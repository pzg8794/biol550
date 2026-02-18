**BIOL550 Trapnell/STAR Workflow**

**Goal:** QC raw reads, build a STAR genome index, align paired-end reads, and prepare for counting/DE.

## 1) Locate Inputs On The Server (Course Dataset)
Find the course dataset directory (if you don’t already know the path):
```bash
find ~ -maxdepth 4 -type d -name "Trapnell_Data" 2>/dev/null
```

Raw reads directory we used:
```bash
READS="/home/pzg8794/BIOL550/Lab1/Trapnell_Data/Trapnell Data/Raw reads"
ls -lh "$READS" | head
```

Confirm read length (we found 75bp per mate; STAR reports 150 because it’s paired-end 2×75):
```bash
F="$READS/GSM794486_C2_R1_1.fq.gz"
zcat "$F" | awk 'NR%4==2{print "read_length", length($0); exit}'
```

## 2) Get A Matching Reference (FASTA + GTF) On The Server
We initially saw references bundled in the course dataset:
```bash
BASE="/home/pzg8794/BIOL550/Lab1/Trapnell_Data/Trapnell Data"
ls -la "$BASE"
ls -la "$BASE/Drosophila reference"
ls -la "$BASE/Human reference"
```

Because the bundled FASTA/GTF combo we tried had contig-name mismatches, we downloaded a consistent genome+annotation pair for **Drosophila RefSeq assembly `GCF_000001215.4`** using NCBI `datasets` (still on the server):

```bash
mkdir -p ~/refs/GCF_000001215
cd ~/refs/GCF_000001215

datasets download genome accession GCF_000001215.4 --include genome,gtf
unzip -o ncbi_dataset.zip
```

Confirm the exact paths:
```bash
find ~/refs/GCF_000001215/ncbi_dataset -type f -name "*.fna" | head
find ~/refs/GCF_000001215/ncbi_dataset -type f -name "*.gtf" | head
```

Paths used:
- FASTA: `~/refs/GCF_000001215/ncbi_dataset/data/GCF_000001215.4/GCF_000001215.4_Release_6_plus_ISO1_MT_genomic.fna`
- GTF: `~/refs/GCF_000001215/ncbi_dataset/data/GCF_000001215.4/genomic.gtf`

## 3) Build STAR Genome Index (Step 2, Part 1)
Create an output directory for the STAR index:
```bash
mkdir -p ~/star_index/droso_refseq_ncbi
```

Run `genomeGenerate` with `nohup` so it survives disconnect:
```bash
nohup /usr/local/bin/STAR/STAR --runMode genomeGenerate \
  --genomeDir ~/star_index/droso_refseq_ncbi \
  --genomeFastaFiles "/home/pzg8794/refs/GCF_000001215/ncbi_dataset/data/GCF_000001215.4/GCF_000001215.4_Release_6_plus_ISO1_MT_genomic.fna" \
  --sjdbGTFfile "/home/pzg8794/refs/GCF_000001215/ncbi_dataset/data/GCF_000001215.4/genomic.gtf" \
  --sjdbOverhang 74 \
  --runThreadN 8 \
  > ~/star_index/droso_refseq_ncbi/genomeGenerate.nohup.log 2>&1 &
```

Monitor:
```bash
tail -f ~/star_index/droso_refseq_ncbi/genomeGenerate.nohup.log
```

Done when you see `finished successfully`. Verify index files exist:
```bash
ls -lh ~/star_index/droso_refseq_ncbi | head
```

## 4) Align Reads With STAR (Step 2, Part 2) Using 1 Thread
We aligned one sample (`GSM794486_C2_R1`) with one thread.

Create output dir:
```bash
OUT=~/BIOL550/Lab1/star_align
SAMPLE="GSM794486_C2_R1"
mkdir -p "$OUT/$SAMPLE"
```

Run STAR alignment (paired-end, gzipped FASTQs):
```bash
READS="/home/pzg8794/BIOL550/Lab1/Trapnell_Data/Trapnell Data/Raw reads"

nohup /usr/local/bin/STAR/STAR \
  --genomeDir ~/star_index/droso_refseq_ncbi \
  --runThreadN 1 \
  --readFilesIn "$READS/${SAMPLE}_1.fq.gz" "$READS/${SAMPLE}_2.fq.gz" \
  --readFilesCommand zcat \
  --outSAMtype BAM SortedByCoordinate \
  --limitBAMsortRAM 6000000000 \
  --outFileNamePrefix "$OUT/$SAMPLE/" \
  > "$OUT/$SAMPLE/star.nohup.log" 2>&1 &
```

Why `--limitBAMsortRAM`:
- STAR failed without it: “not enough memory for BAM sorting… re-run with at least `--limitBAMsortRAM 5005966880`”.
- We set it to `6000000000` to be safe.

Monitor:
```bash
tail -f "$OUT/$SAMPLE/star.nohup.log"
```

When finished, check outputs:
```bash
ls -lh "$OUT/$SAMPLE/Aligned.sortedByCoord.out.bam"
cat "$OUT/$SAMPLE/Log.final.out"
```

**Important:** Don’t start two STAR runs writing to the same `$OUT/$SAMPLE/` at once. If you need to restart, stop STAR and clear the directory first:
```bash
ps -u $USER | grep '[S]TAR'
kill <PID>

rm -rf "$OUT/$SAMPLE"/*
```

## 5) Package Results To Download (Optional)
BAMs tarball (all BAMs that exist):
```bash
EXPORT=~/BIOL550/Lab1/exports/$(date +%F)
mkdir -p "$EXPORT"

cd ~/BIOL550/Lab1
find star_align -type f -name 'Aligned.sortedByCoord.out.bam' -print0 | \
  tar -czf "$EXPORT/star_align_bams.tgz" --null -T -
ls -lh "$EXPORT/star_align_bams.tgz"
```

Logs tarball (everything except BAMs/tmp):
```bash
tar -czf "$EXPORT/star_align_logs.tgz" \
  -C ~/BIOL550/Lab1 star_align \
  --exclude='*/Aligned*.bam' \
  --exclude='*/Aligned*.bam.bai' \
  --exclude='*/_STARtmp*'
ls -lh "$EXPORT/star_align_logs.tgz"
```

## 6) Download To Your Mac
On your Mac:
```bash
DEST="/Users/pitergarcia/DataScience/Semester5/BIOL550/BIOL550-Lab/server_exports/$(date +%F)"
mkdir -p "$DEST"

scp pzg8794@sequoia:/home/pzg8794/BIOL550/Lab1/exports/$(date +%F)/star_align_logs.tgz "$DEST/"
scp pzg8794@sequoia:/home/pzg8794/BIOL550/Lab1/exports/$(date +%F)/star_align_bams.tgz "$DEST/"
```

Unpack:
```bash
tar -xzf "$DEST/star_align_logs.tgz" -C "$DEST"
tar -xzf "$DEST/star_align_bams.tgz" -C "$DEST"
```

## 7) What’s Next (From The PDF): Step 3
Step 3 is **gene read counting + differential expression** (often `featureCounts` + `DESeq2`, or other tools your instructor specifies).