# 02-04 Lecture  RNA-seq Analysis

**Source:** `transcripts/02-04 Lecture_ RNA-seq Analysis-transcript.txt`  
**Date (from filename):** 02-04

## Summary (course notes)
- **Main focus:** Lecture notes focused on the RNA-seq workflow and interpretation of key analysis/QC outputs.
- **Key takeaways:**
  - FastQC deliverables should be organized for review (HTML/ZIP per mate); interpret PASS/WARN/FAIL as triage signals, not automatic accept/reject rules.
  - High duplication can be expected in RNA-seq (highly expressed transcripts); focus on outliers and whether duplication correlates with other QC failures.
  - STAR is resource-heavy; plan runs around shared usage and use STAR summary outputs (unique/multi/unmapped) as alignment QC metrics.
  - Single-cell RNA-seq has different QC/analysis assumptions than bulk RNA-seq; dataset type affects which tools/metrics are appropriate.
- **Action items / follow-ups:**
  - Package/retain FastQC outputs in a consistent structure and record the top recurring WARN/FAIL modules for the weekly report.
  - Capture STAR mapping summary metrics (unique/multi/unmapped) for downstream interpretation and troubleshooting.

## Themes detected (quick scan)
- FastQC; STAR aligner; duplication levels; single-cell RNA-seq

## Transcript highlights (auto-extracted)
- on the right with all the information about the gene, those files tell you which basis are the start and stop locations for genes. Oftentimes, they'll tell you where the exon and intron boundaries are, too, and you could ask that. You don't get that in precursors. So, basically, what it's doing is when you are, we'll take a look at Thursday, we'll actually run this with STAR. There's actually t…
- right, what are all the sequences in the genome and where the genes are located? The second step is saying, for your fragments, what do they line up with in the genome? Some of the programs actually identify new exons that haven't been seen before. Top, bad, star, a number, HiSAT, they're all good at that. So, basically, this is just one part of it where it's including the extra information abo…
- But yeah, Ensembl and RefSeq are the big ones that we'll see in humans. Ensembl does have other stuff. Ensembl is more of an organization and less of a data set. It's something you just learn from GoSea. GoSea references Ensembl all over the place. They also have individual nucleotide sequences, not just whole genome. They've got all kinds of stuff. So these are the two big ones. Okay, so we're…
- Specific genes, yeah. These are specifically genes that were different between them in terms of annotation. They had 25,000 roughly that were common. Take a look at that ensemble on the left. Another 33,000. Okay, here we get into philosophy. How many genes are there in the human genome? Should we start an argument? Because it usually winds up in one. Some people say as low as 15,000. Some peop…
- Does it ring a bell? Okay, I know something you took genetics with. You need to know this. Okay, you can answer if you got it. What's it got? I don't know. No? Oh, no! It starts at the end of the course. Something, it's not protein coding, but it does regulate gene expression. What was it? It's not intrusive, part of the gene. Close. You're on the right track.
- What was it? It starts with an I. What was it? Yes. We can go through the alphabet. What are you doing? You're getting closer. I-N-T-E. It does suppress, it can suppress gene function, but it's I-A-T-R, close, inter, I don't think I paid for this one, yes it will be, absolutely, you need to remember this one, you'll see it throughout your careers, no matter where you are now, you'll have to rem…
- so you used to meet regularly with the folks at the u of r they were strong they have research links and they were doing a lot of rdc early on so a bit about 15 years ago and i was talking about some of the stuff we're doing in graves but what yeah we watch out for this stuff you know the genome is effectively duplicated uh no i don't mean diploid i mean chromosomes and there's no chromosome in…
- that NCBI has changed. They're actually starting to curate more. But 20 years ago, it was no one except everything. Now there's so much data, they kind of have to curate anyways. There's so much data generated, they can't take everything. Sometimes you get a little snotty about it, too. I've had some back and forth, like, no, that's not true. They actually cited papers for it, but they didn't b…
- Are you starting to swamped already? There's a lot of stuff to see. I don't say I wish I could have you for two semesters because then we could do both GEO assemblies and alignments. Alignments with a variety of stake because there's a ton of different ways to parse this data and a lot of . Most of it, you learn from just sitting down and doing it over and over.
- accidentally sit down in a place where there are no factors that are encouraging it to sit down, just by chance, and it'll express it. We see a low level of transcription of things that aren't even genes. If you look at enough transcripts, you'll find things that, yeah, they line up with genomes, but they're not really genes. Polymerase is a little promiscuous, not much. For the most part, it's…

## Definitions (optional, add if used in your write-ups)
- **FastQC module:** A named QC check (PASS/WARN/FAIL) computed per FASTQ file.
- **Adapter signal:** Evidence read-through captured adapter/technical sequence; typically requires adapter clipping (not quality trimming).
- **Duplication levels:** Fraction of reads that are duplicates; in RNA-seq this can reflect high expression, not just PCR artifacts.
- **q-value / FDR:** Multiple-testing–adjusted significance metric; use with a cutoff (e.g., 0.05) for DE calls.
