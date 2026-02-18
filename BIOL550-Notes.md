# BIOL550 - High Throughput Seq Analysis

Course home (myCourses): https://mycourses.rit.edu/d2l/home/1199746

## Index (quick links)

- [Current work (status)](#current-work-status)
- [Slides](#slides)
- [Readings](#readings)
- [Misc](#misc)
- [Tooling reference — OpenAI API key & transcription](#tooling-reference--openai-api-key--transcription)
- [Data download reference — SRA (NCBI)](#data-download-reference--sra-ncbi)
- [Trapnell final — differential expression results](#trapnell-final--differential-expression-results)
  - [What to submit](#what-to-submit-practical-differential-expression-results-package)
  - [Lab session summary (Feb 12, 2026)](#lab-session-summary-feb-12-2026)
  - [Class prep — Wed, Feb 18, 2026](#class-prep--wed-feb-18-2026)
- [BIOL550 Comprehensive Course Guide](#biol550-comprehensive-course-guide)
- [Lab task hub](BIOL550-Lab/task_n_desc.md)
  - [Weekly report requirements](BIOL550-Lab/task_n_desc.md#weekly-report-requirements-make-visible)

## Current work (status)

- Lab task hub: `Semester5/BIOL550/BIOL550-Lab/task_n_desc.md`
- Lab 3 weekly report (HTML): `Semester5/BIOL550/BIOL550-Lab/lab3/BIOL550_Lab3_Report.html`
- Lab 3 notebook: `Semester5/BIOL550/BIOL550-Lab/lab3/BIOL550_Lab3_Report.ipynb`
- Trapnell DE submission artifact (zip): `Semester5/BIOL550/BIOL550-Lab/lab3/cuffdiff_results.zip` (contains `cuffdiff_classref_v2_xs/`)
- DE quick summary (generated locally): `Semester5/BIOL550/BIOL550-Lab/lab3/notes/results_summary.txt` (and `Semester5/BIOL550/BIOL550-Lab/lab3/submission/results_summary.md`)
- Lab session audio + transcripts:
  - `Semester5/2026-02-12 09_37_36.mp3` → `output/transcribe/biol550_2026-02-12_09-37-36.txt`
  - `Semester5/2026-02-12 09_35_11.mp3` → `output/transcribe/biol550_2026-02-12_09-35-11.txt`
- Public BIOL550 repo: https://github.com/pzg8794/biol550
- Zebrafish workspace (group project): `Semester5/BIOL550/group_project/zebrafish/`

## Slides

- [HTS Week 1and2 tech_analysis](https://mycourses.rit.edu/d2l/le/content/1199746/viewContent/11527999/View)

## Readings

Week 1/2
- Week 3 - Assembly
- Week 4 - RNASeq
- Week 5 - Composites and noise
- Week 6 - Barcoding
- Week 7 - Other applications
- Week 11 - Variant callers and missing genes
- Week 13 - Long read applications
- Week 14 - Microbiome and epigenetics

## Misc

- CommandlineWorkshop (starts Jan 15, 2026, 9:30 AM)

## Tooling reference — OpenAI API key & transcription

If by “RSA API” you meant how we used the OpenAI API (and set `OPENAI_API_KEY`), use this.

### 1) Store your `OPENAI_API_KEY` in macOS Keychain (recommended)

In a terminal:

```bash
read -s OPENAI_API_KEY; echo
security add-generic-password -a "$USER" -s OPENAI_API_KEY -w "$OPENAI_API_KEY" -U
unset OPENAI_API_KEY
```

Then, when you need it (new terminal/session):

```bash
export OPENAI_API_KEY="$(security find-generic-password -a "$USER" -s OPENAI_API_KEY -w)"
```

Notes:
- A Python virtual environment does *not* automatically “remember” the key; your *shell environment* must have `OPENAI_API_KEY` exported at runtime.
- Don’t paste keys into chats or commit them to GitHub.

### 2) Transcribe audio via OpenAI (when `OPENAI_API_KEY` is set)

Codex bundled CLI:

```bash
export TRANSCRIBE_CLI="$HOME/.codex/skills/transcribe/scripts/transcribe_diarize.py"
python3 "$TRANSCRIBE_CLI" "Semester5/2026-02-12 09_37_36.mp3" --out output/transcribe/biol550_2026-02-12_09-37-36.txt
```

### 3) Local fallback (no API): `whisper-cpp`

If you can’t/don’t want to use the API, run local:

```bash
whisper-cli -m output/transcribe/models/ggml-base.en.bin -l en -of output/transcribe/biol550_2026-02-12_09-35-11 -otxt -oj "Semester5/2026-02-12 09_35_11.mp3"
```

## Data download reference — SRA (NCBI)

If you meant “SRA” (not “RSA”): **SRA = Sequence Read Archive** and this is the main place we pull public RNA-seq runs.

Script (zebrafish default): `Semester5/BIOL550/group_project/zebrafish/scripts/get_zebrafish_data_sra.py`

### References (official)

- Entrez Direct (`esearch`/`efetch`) docs: https://www.ncbi.nlm.nih.gov/books/NBK179288/
- SRA Toolkit docs: https://github.com/ncbi/sra-tools
- SRA Run Selector (web): use the BioProject page → click **SRA** / **All experiments** → **Run Selector** → download **RunInfo** CSV.

### Workflow we script (metadata → runs → FASTQ)

1) Get a **RunInfo CSV** (this is the “API step” we use for reproducible metadata).

```bash
# Example: query a BioProject or SRP and save run metadata
ACC="PRJNA717662"   # or SRP312283, etc.
esearch -db sra -query "$ACC" | efetch -format runinfo > "${ACC}_runinfo.csv"
```

2) Extract SRR run accessions and download FASTQs with SRA Toolkit.

```bash
# Download the first N runs from the RunInfo (edit N as needed)
N=5
cut -d',' -f1 "${ACC}_runinfo.csv" | tail -n +2 | head -n "$N" > "${ACC}_runs.txt"

# Download + convert to FASTQ (paired-end)
while read -r SRR; do
  prefetch "$SRR"
  fasterq-dump --split-files --threads 4 "$SRR"
  gzip -f "${SRR}"_*.fastq
done < "${ACC}_runs.txt"
```

Notes:
- If you’re scripting on the class server, check which tools exist: `command -v esearch efetch prefetch fasterq-dump`.
- For class requirements, **filter runs first** using the RunInfo CSV (LibraryLayout, avgLength/avgSpotLen, spots/bases).

### Existing “worked example” already in these notes

See: **Dataset Validation Example: PRJNA717662 (Manual Steps)** (search that exact heading) for the full copy/paste runinfo + filtering workflow.

# **BIOL550 Comprehensive Course Guide**

*Course Overview and Key Themes*

BIOL550 is an advanced genomics and bioinformatics course that explores cutting-edge methods for DNA/RNA sequencing and analysis. Major themes include:

* ***Next-Generation Sequencing (NGS) Technologies:*** Understanding modern high-throughput sequencing platforms (e.g., Illumina and BGI/MGI systems) and their impact on data generation. The course compares sequencing-by-synthesis platforms, highlighting that current Illumina NovaSeq and BGI MGISEQ produce comparable data quality for applications like single-cell RNA-seq. Students gain insight into how massively parallel sequencing has revolutionized genetics, enabling whole-genome and transcriptome analyses with single-base resolution.  
    
* ***Genome Assembly Strategies:*** Challenges of assembling genomes from short reads and advances with hybrid and long-read assemblies are a central topic. The course emphasizes that even with high coverage short reads, genome assembly remains unsolved, often yielding draft genomes with gaps and errors. Students examine de Bruijn graph assemblers (e.g., Velvet for short reads) and hybrid assemblers (e.g., MaSuRCA, which generates super-reads to combine Illumina, 454, and Sanger data). Real-world case studies (chicken genome, fungal pathogen genome) illustrate the pros and cons of different sequencing technologies on assembly quality.  
    
* ***Transcriptomics (RNA-Seq) Analysis:*** The course covers experimental design and data processing for RNA sequencing. Key steps include strand-specific library preparation (as in the protocol by Zhong et al., 2011), read alignment to a reference (using spliced aligners like TopHat), de novo transcript assembly or reference-guided assembly (e.g., Cufflinks), and quantification of gene expression. Emphasis is placed on how stranded RNA-seq improves transcript resolution and how choices in gene annotation databases (RefSeq vs Ensembl) can significantly affect quantified expression results. Students learn to carry out differential gene expression analysis and interpret results in a biological context.  
    
* ***Variant Calling and Genomic Variation:*** Another major theme is identifying genetic variants (SNPs/indels) from sequencing data. The course introduces pipelines like the Broad Institute’s GATK and contrasts them with specialized tools for challenging scenarios (e.g., LoFreq for low-frequency variants). Students learn about the sensitivity vs. false-positive tradeoffs in variant detection – for example, in pooled-sample experiments, GATK, CRISP, and LoFreq achieve balanced accuracy ≳80%, whereas tools like VarScan sacrifice sensitivity for fewer false positives. Practical skills include running variant callers and evaluating their performance with metrics like sensitivity, specificity, and balanced accuracy.  
    
* ***Epigenomics:*** The course explores how genome-wide epigenetic modifications (especially DNA methylation) are profiled and how they influence gene regulation. A highlight is an in natura epigenomic study of a mangrove tree under salt stress, which revealed environment-induced changes in DNA methylation. Students see how bisulfite sequencing and related techniques can map methylation patterns, and how stress conditions (e.g., high salinity) trigger global hypermethylation of transposable elements, accompanied by changes in gene expression. This provides insight into epigenetic mechanisms of adaptation in extreme environments.  
    
* ***Microbiome and Environmental Genomics:*** BIOL550 also addresses culture-independent genomic analysis of communities. Students examine metagenomic and metatranscriptomic approaches to study microbiomes, learning that taxonomic diversity alone often poorly predicts functional diversity of a community. A case study on spatial variation in microbiome function (Barnes et al., 2020\) emphasizes linking community composition to functional outputs in different environments. The course further introduces environmental DNA (eDNA) techniques for biodiversity assessment. For example, an eDNA metabarcoding study demonstrated how water turbidity and sampling methods affect the detection of fish species from water samples. Students learn best practices for eDNA surveys – such as filtering larger water volumes in low-biomass settings and adjusting protocols for PCR inhibitors in turbid waters.  
    
* Other emerging topics include single-cell genomics (e.g., single-cell RNA-seq for cell-type discovery) and multi-omics integration. Overall, BIOL550 builds both practical skills (using bioinformatics tools) and conceptual understanding of how genomics data are generated and interpreted across diverse biological contexts.

## **Week-by-Week Topics and Techniques**

Below is a week-by-week summary of BIOL550, detailing core topics, case studies, and skills developed. Each week’s content builds on previous ones, gradually equipping students with technical, analytical, and conceptual expertise in genomics.  
**Weeks 1–2: Next-Generation Sequencing Technology Overview**  
***Topics:*** Introduction to NGS platforms and data characteristics; historical evolution from Sanger to massively parallel sequencing. The class reviews the seminal work by Elaine Mardis (2008) on next-gen DNA sequencing methods. Key platforms (Illumina, BGI, PacBio, Oxford Nanopore) are compared in terms of read length, accuracy, and throughput. A 2020 study comparing Illumina NovaSeq vs. BGI/MGI sequencing for single-cell RNA-seq libraries is discussed to illustrate current state-of-the-art platforms. This showed that MGISEQ-2000 data is on par with Illumina in detected genes and barcodes, indicating multiple vendors can now produce high-quality sequence data. Students also learn about cost and data trends (the $/genome plummeting over time) and how higher output enables new applications (e.g., large population sequencing, metagenomics, ancient DNA analyses). Techniques and Tools: No hands-on tools yet; focus is on concepts like sequencing-by-synthesis, error profiles, and how read length/coverage requirements differ by application. Skills gained: Students become conversant in sequencing jargon (reads, coverage, paired-ends) and learn to critically evaluate a sequencing platform’s suitability for a given project (e.g., short reads for variant calling vs. long reads for assembly). This foundational knowledge is crucial later weeks.  
**Week 3: Genome Assembly Algorithms and Case Studies**

* ***Topics:*** De novo genome assembly principles. The course covers both classical Overlap-Layout-Consensus (OLC) approaches and modern de Bruijn graph methods for short-read assembly. Velvet, a pioneering short-read assembler, is introduced as an example of de Bruijn graph assembly achieving N50 contigs on the order of kilobases even from 35–50 bp reads. Students examine how Velvet handles very short reads by constructing a graph of k-mers rather than overlaps. The assembler SOAPdenovo/SOAP2 from BGI is presented as well, noting its use of the Burrows-Wheeler Transform to achieve ultrafast alignment and its ability to handle the human genome in mere GBs of memory (an important innovation given the 1000 Genomes Project data volume). Case studies: Two comparative assembly studies highlight challenges:  
* ***Chicken Genome Assembly:*** Students read a case study by Ye et al., where a chicken genome was assembled using NGS data (Illumina and 454\) and compared to the Sanger-based reference. They found NGS assemblies captured most genes and even revealed novel sequences not in the older reference, but were more fragmented (contig N50s several-fold lower). This taught students how genome properties (size \~1.2 Gb, repeat content) and read lengths affect contiguity, and that short-read assemblies, while cost-effective, often break at repeats, leading to gaps in gene regions.  
* ***Fungal Pathogen Assembly:*** The class discusses a fungal genome assembly (DiGuistini et al., 2009), which combined Sanger, 454, and Illumina reads. The highest assembly quality was achieved by integrating all data in one iterative assembly process. This case illustrated how using mixed read lengths and pairing libraries improved contiguity and gene recovery. It also emphasized data filtering strategies to improve assembly (e.g., remove low-quality reads). Students see that even with high coverage, assemblers must deal with repeats and errors; accordingly, hybrid strategies can yield superior results.  
* ***Tools:*** MaSuRCA is introduced as a modern hybrid assembler that creates super-reads to combine short reads of varying lengths with long reads. In class, students compare MaSuRCA’s performance against Allpaths-LG and SOAPdenovo2 on test datasets (e.g., Rhodobacter bacterium and mouse chromosome) to appreciate differences in contig N50 and accuracy. Skills gained: By the end of Week 3, students can describe the major algorithmic approaches to assembly and know key metrics for assembly evaluation (N50, coverage, scaffolds vs. contigs). They also learn to use assembly software on example data and practice evaluating assembly output against a reference or expected genome size. This builds technical proficiency in genomics data processing and fosters analytical skills in troubleshooting assembly results (e.g, recognizing when repeats or heterozygosity caused contig breaks)

**Week 4: RNA-Seq Experimentation and Data Analysis**  
Topics: End-to-end RNA-seq workflow. This week is devoted to how one goes from biological samples to differentially expressed genes. It starts with experimental design and library prep: the class examines the strand-specific Illumina RNA-seq protocol by Zhong et al. (2011), which addresses the lack of strand information in conventional RNA-seq. Students learn why preserving strand information matters (for correctly identifying antisense transcripts and improving annotation). The protocol’s innovation – incorporating dUTP in second-strand cDNA then enzymatically removing it – is discussed as a cost-effective way to prepare 96 libraries in parallel. Next, read alignment is covered. Students use spliced aligners like TopHat or the more recent HISAT/STAR to map RNA-seq reads to a reference genome, accounting for introns. They learn about the importance of reference gene annotation in quantification: a 2022 study by Chisanga et al. is presented, which compared using RefSeq vs. Ensembl gene models for quantifying human RNA-seq data. The class discusses the finding that RefSeq’s conservative annotation yielded better correlation with ground-truth expression than the more inclusive Ensembl, which unexpectedly had decreased accuracy after expansion. This teaches that the choice of annotation database can introduce bias in expression estimates, and that “more genes” in an annotation is not always better if many are low-confidence. After alignment, transcript assembly and quantification are tackled. Students experiment with Cufflinks/Cuffdiff to assemble transcripts and estimate FPKM/RPKM values, and they explore alternative splicing detection. The concept of The RNA-seqlopedia is introduced to summarize the standard steps: experimental design, RNA preparation, library prep, sequencing, and analysis. Each step is linked to decisions (e.g., poly(A) selection vs rRNA depletion, single-end vs paired-end reads, depth required for discovery of splicing). The course also touches on emerging RNA-seq variants (small RNA-seq, ribosome profiling, etc., though in less detail). Skills gained: Students gain hands-on experience mapping reads and performing differential expression analysis. By analyzing a provided dataset (for example, a yeast knockout vs wildtype or a cancer vs normal tissue RNA-seq), they learn to identify differentially expressed genes and validate findings. Conceptually, they become aware of common pitfalls: batch effects, library biases, and the multiple hypothesis testing problem in gene expression. This week solidifies their ability to go from raw sequencing reads to biological insights about gene regulation.

**Week 5: Transcriptomic Case Study – Tissue-Specific Expression vs. Composite Samples**  
Topics: A deep dive into differential expression analysis and how experimental sampling can affect results. The centerpiece is a honeybee case study examining RNA-seq from whole tissues vs. specific organs. The class reads about experiments in which researchers compared gene expression in honeybee abdomens (which contain multiple organs) to expression in isolated sting glands and digestive tracts. This study highlighted the concept of composite structures: using entire body segments that include many cell types for RNA extraction. The findings showed potential pitfalls: if a small organ with specialized genes (e.g., venom-producing sting gland) is diluted by a larger tissue, its unique expression signals can be “washed out” in the whole-sample RNA-seq. Indeed, genes highly expressed only in the sting gland might appear low or not expressed in an abdominal sample, yielding false negatives. On the other hand, a large organ (like the digestive tract) contributed enough RNA that its genes were mostly detected even in whole-abdomen samples. Discussion: Students interpret honeybee RNA-seq results (e.g., venom protein genes) to quantify how much signal loss occurred in composite vs. dissected samples. They also examine the number of total genes detected in each condition, notingthat the sting gland had the largest unique transcriptome despite being small. This leads to a broader conversation about experimental design: when is it necessary to isolate specific cell types or regions? The class considers examples from other organisms (brain region-specific expression, tumor microdissection) where mixing tissues could confound results. Tools and methods: If available, students may learn about laser capture microdissection or single-cell RNA-seq as alternatives to bulk composite sampling. They also review statistical models for differential expression (like the negative binomial model in DESeq2 or edgeR) and how low-abundance transcripts in composite samples could fall below detection thresholds. Skills gained: Analytical skills in interpreting RNA-seq data are honed. Students learn to critically evaluate whether an observed “absence” of expression might be technical rather than biological. They also gain appreciation for how sample preparation decisions impact downstream analysis. This week strengthens their ability to design their own studies – for instance, deciding when to pool samples or when to sequence replicates separately – to ensure robust, interpretable data

**Week 6: Exogenous Nucleic Acids and Microbiome Interactions**  
Topics: This week transitions into considering sequences from unexpected sources, preparing the ground for microbiome analysis. Students explore a provocative finding: the detection of exogenous RNA sequences in human plasma. A 2012 PLOS One study by Wang et al. is examined, which found that a significant fraction of RNA reads in blood plasma did not map to human transcripts – instead, many aligned to bacteria and fungi. The authors carefully ruled out sequencing error and contamination, concluding that human blood contains a diverse array of microbial and other exogenous RNAs, possibly from gut microbes or diet. These RNAs may be protected in vesicles or protein complexes, raising the hypothesis that they could serve as signaling molecules in human-microbe interactions. Class discussion: Students consider how microbial RNA might enter the bloodstream (intestinal permeability, food intake, etc.) and what it implies for biomarker discovery. The presence of exogenous sequences was initially startling – e.g., over 40% of plasma cDNA sequencing reads were of unknown origin after accounting forthe human genome and transcriptome. This leads to a discussion of distinguishing a true biological signal from contamination. The class learns about careful controls (sterile reagents, sequencing “air” or water controls) and data validation needed in such studies. They also discuss implications: if plasma RNAs from gut bacteria correlate with disease, could they be used in noninvasive diagnostics? This foreshadows later topics on the microbiome’s systemic effects. Skills/techniques: Students do not necessarily run tools this week, but they learn metagenomic read classification basics. The concept of aligning reads to large databases (like NT or using tools such as Kraken for taxonomic classification) is introduced, so they know how exogenous sequences can be identified. They also gain critical thinking skills about data validation in metagenomics (for example, how to differentiate genuine low-level microbial signal from index misassignment or laboratory contaminants). Skills gained: Conceptually, students appreciate the complexity of sequencing data in a metagenomic context – a single sample (like blood) can contain mixed-origin DNA/RNA. They also become aware of the microbiome’s potential to leave traces in host-derived data. This week builds a mindset of vigilance for unexpected results and underscores the importance of computational filtering and rigorous controls in genomic experiments.

**Week 7: Environmental DNA (eDNA) and Single-Cell Genomics**

* Topics: Week 7 covers two frontier areas that extend genomics beyond the traditional lab-grown samples: environmental DNA and single-cell sequencing.  
* eDNA Metabarcoding: Students analyze a 2021 study by Kumar et al. on eDNA protocols in different water conditions. This experiment tested how sampling effort, DNA extraction method, and filter pore size influence the detection of fish DNA from water in turbid estuarine vs. clear offshore sites. The results showed stark contrasts: turbid water, though full of PCR inhibitors (mud, organics), yielded \~3× more DNA and gave consistent species detections across replicates, with only a few low-read species varying by method. In clear water, DNA yield was low, and species detections were highly patchy among methods and replicates. This suggests eDNA in low-productivity waters is sparse and heterogeneously distributed, requiring larger sample volumes (≥2 L) to capture diversity. The study concluded with best-practice recommendations: e.g., use a coarse filter (1.0–3.0 μm) in high-sediment water to avoid clogging but still capture DNA, and perform inhibitor removal steps for muddy samples. Skills/Discussion: Students learn how to design eDNA surveys based on habitat (in turbid environments, expect better yield but need to address inhibitors; in clear waters, concentrate larger volumes). They also see how pilot studies are essential to identify optimal protocols for new environments. As a class exercise, they might plan an eDNA study for a given scenario (e.g., surveying an invasive species in a lake), deciding on filtration and replication strategies.  
    
    
* Single-Cell RNA-Seq: The course also introduces single-cell transcriptomics as a means to resolve cellular heterogeneity. As an example, students review a recent single-cell RNA-seq study of mouse lung endothelial cells (Wang et al., 2022). This study identified distinct subpopulations of alveolar capillary cells (gCAPs) via clustering of scRNA-seq data. It showed, for instance, two gCAP subsets distinguished by FOXF1 expression – one proliferative subset (FOXF1⁺ cKIT⁺) and one non-proliferative subset (FOXF1⁻) with different marker genes. The researchers confirmed these subsets in situ with RNA scope and linked a genetic perturbation (Foxf1 mutation) to disrupted signaling in one subset. Skills/Discussion: While students may not perform scRNA-seq analysis from scratch (which requires advanced skills in R or Python), they learn the workflow: cell isolation, barcoding, library prep (often using droplet microfluidics like 10x Genomics), sequencing, and clustering analysis. The class discusses outputs like t-SNE/UMAP plots, how to interpret gene expression in clusters, and the concept of pseudotime for developmental trajectories. The inclusion of single-cell topics complements week5’s theme: rather than physically dissecting tissues, one can computationally deconvolute cell types via single-cell sequencing.  
* Skills gained: In the eDNA portion, students develop practical field genomics planning skills and learn to troubleshoot environmental sample issues (yield vs. inhibitors). In the single-cell portion, they gain a conceptual understanding of how to uncover fine-scale biological variation that bulk RNA-seq would mask. Both topics reinforce adaptability – knowing how to tweak protocols for unconventional samples (whether it’s filtering swamp water or capturing transcripts from a single cell). They also highlight the ever-expanding toolkit of genomics, from ecology to developmental biology.

**Week 11: Variant Calling and Analysis of Genomic Variations**  
(Note: Weeks 8–10 may have involved project work or other readings; here we continue with Week 11 as per the provided materials.) Topics: Identification and evaluation of genetic variants from sequencing data. In Week 11, students focus on single-nucleotide variant (SNV) calling in difficult scenarios, such as pooled samples or low-frequency mutations. A key reading is a 2015 benchmarking study by Huang et al., which systematically evaluated five variant callers: GATK’s UnifiedGenotyper, CRISP, LoFreq, VarScan, and SNVer. This study simulated pooled sequencing data (merging individual sample BAMs) to test each tool’s sensitivity and false-positive rate under varying coverage and pool sizes. Findings: The class discusses how GATK, CRISP, and LoFreq performed well overall, maintaining ≥80% balanced accuracy in many scenarios. Notably, LoFreq and CRISP were much faster and more memory-efficient than GATK, yet achieved comparable sensitivity – LoFreq, for instance, models sequencing error via per-base quality scores (a Phred-score-based Poisson-binomial model) to detect rare variants. VarScan and SNVer had low false positive rates but missed many true variants (low sensitivity), meaning they are conservative but might fail to detect rare mutations in a pool. The study’s conclusion that LoFreq and CRISP can be preferable for pooled/rare variant detection (with LoFreq excelling at finding low-frequency mutants) is highlighted. Techniques: During this week, students get hands-on experience with variant calling. They might be given a small pooled dataset or individual sample BAMs to merge and then asked to run at least two tools (e.g., GATK vs. LoFreq). They practice using command-line tools: specifying reference genomes, handling BAM files, and applying variant filters. The concept of sensitivity vs. precision is revisited with precision-recall or ROC curves. Students also learn how to use resources like dbSNP or a “truth set” to evaluate calls. Special topics: The challenges of heterogeneous samples (like detecting subclonal cancer mutations or minority viral strains) are discussed. LoFreq’s ability to call variants present at a few percent allele frequency is noted as enabling the detection of minor drug-resistant viral populations or mosaic mutations. GATK’s Bayesian model is explained, and why high-depth data or multiple samples are needed for its statistical confidence. Skills gained: Technically, students become capable of running variant-calling workflows and understand the need for post-call filtering and annotation (e.g., using Variant Effect Predictor or SnpEff to predict impacts). Analytically, they learn to interpret variant caller outputs and decide which variants are reliable. This week reinforces good bioinformatics practice: careful parameter tuning and comparative evaluation of tools rather than blindly trusting one program. It also prepares those interested in medical genomics to handle real-world variant analysis scenarios.

**Week 13: Advanced Genome Assembly – Haplotype-Resolved Polyploid Genome**  
Topics: A return to genome assembly, tackling one of the hardest scenarios: a highly heterozygous polyploid genome. The class investigates the case of the tetraploid potato genome assembly (Sun et al., Nature Genetics 2022). This state-of-the-art project assembled the 3.1 Gb genome of a potato cultivar ‘Otava’ into chromosome-scale haplotype-resolved sequences. Students learn what makes the potato challenging: it has four homologous sets of chromosomes and abundant heterozygosity (unexpectedly, \~50% of the genome was identical-by-descent due to recent inbreeding, but the rest had many structural variants). The initial assembly, even with long reads and Hi-C, showed evidence of haplotype collapse: coverage patterns revealed contigs that had merged two, three, or four haplotypes into one (termed “diplotigs,” “triplotigs,” “tetraplotigs”). About \~21% of the assembly represented two collapsed haplotypes and smaller portions for three or four. Such ambiguous assembly structures are problematic because one contig might actually represent divergent sequences merged incorrectly. Resolution approach: The scientists employed an innovative solution called “gamete binning.” They sequenced 717 individual pollen genomes (which are diploid in potato, since potato produces diploid gametes) with short reads. By aligning each pollen’s reads to the draft assembly, they could assign reads to specific haplotypes based on presence/absence patterns. This allowed the separation of the sequencing data into four buckets, one per haplotype, enabling a fresh assembly of each haplotype separately. The result was a near-complete, phased assembly where only 54% of genes were present on all four haplotypes – meaning many gene copies had diverged enough to be missing from at least one haplotype. They also found \~11% of genes showed allele-specific expression among haplotypes (illustrated by differences in leaf transcriptome expression), often correlated with allele-specific DNA methylation – linking this to epigenomic regulation in polyploids. Class discussion: This case encapsulates many modern genomics techniques: long-read sequencing (PacBio/ONT for contigs), Hi-C for scaffolding, short-read sequencing of single cells (pollen) for phasing, and integration of epigenomic and transcriptomic data. Students discuss how haplotype phasing is increasingly important for understanding functional variation – e.g., if one haplotype carries a deleterious allele that’s compensated by another. The potato example shows that collapsing haplotypes in assembly can mask important variation (nearly half of the genes weren’t uniformly present in all four sets). Skills/techniques: While performing a full polyploid assembly is beyond a classroom, students learn to use genome browsers or dotplots to visualize assembly versus reference or self-alignments to detect collapses. They may use a small Arabidopsis allotetraploid dataset to see how duplicated regions can collapse. The concept of using Hi-C contact maps to separate haplotypes (as an alternative to gamete sequencing) might be touched upon. Skills gained: This week gives students a taste of cutting-edge research. They learn how to critically read a high-impact genome paper, understanding its methods and interpreting summary statistics. It reinforces problem-solving: when standard assembly fails (ambiguities, collapsed repeats), creative strategies (sequencing gametes or trio binning with parental genomes) can rescue the situation. Students also appreciate the biological insights gained: e.g., discovery of extensive structural rearrangements in potato and allele-specific gene regulation – connecting genomics with plant breeding and evolution.

**Week 14: Epigenomics and Microbiome Function – Integrative Analyses**

* ***Topics:*** The final week ties together genomics with broader biological questions, using two culminating case studies:  
* ***Epigenomics Case*** – Mangrove Adaptation: Students examine the work of Miryeganeh et al. (2022) on the mangrove tree Bruguiera gymnorhiza. This study combined a new genome assembly with in natura epigenome and transcriptome profiling to investigate how mangroves tolerate high salinity. Key results discussed: in natural populations, trees in high-salinity conditions showed drastic morphological differences and thousands of gene expression changes compared to low-salinity sites. Moreover, high salinity induced genome-wide DNA hypermethylation of transposable elements (TEs) in mangrove tissues. This was accompanied by upregulation of certain chromatin modifier genes, suggesting an active epigenetic response to salt stress. The study provides evidence that DNA methylation changes are part of mangrove stress tolerance, likely silencing TEs that could become active under stress and potentially regulating stress-responsive genes. The conclusion drawn is that epigenetic regulation is a conserved mechanism in plants for environmental adaptation – similar patterns of methylation change under stress have been noted in crops like rice and wheat. Class integration: This case synthesizes many course aspects: de novo assembly was required due to limited prior genomic resources; RNA-seq was used for transcriptomes; and bisulfite sequencing for methylomes. Students discuss how one would design such a study – e.g., comparing individuals from different field conditions, controlling for genetic differences. They also consider the interpretation: correlation vs causation in epigenetics (do methylation changes drive adaptation or are they by-products?). It’s noted that the mangrove study is observational (in natura), but it sets the stage for future functional tests. This reinforces the idea that genomics, transcriptomics, and epigenomics can be combined to address evolutionary and ecological questions.  
* ***Microbiome Function Case – Spatial Dynamics:*** The second case is from Barnes et al. (2020) on microbiomes, chosen to illustrate functional metagenomics. Students learn that while microbiome research often catalogs “who is there,” an equally important question is “what are they doing?” The Barnes study showed that predicting community function is confounded by variation over space and time, and mere taxonomic diversity is an imperfect predictor of functional capacity. For instance, the presence or absence of certain microbes alone did not capture the potential for pathogen interaction or immune modulation – rather, understanding which genes/pathways are active in the microbiome is key. The course touches on techniques like metagenomic sequencing and metatranscriptomics, which can profile gene content and expression in microbial communities.   
* ***A specific example might be discussed (hypothetical):*** two locations have similar gut bacterial species, but one has those bacteria carrying antibiotic resistance genes, and the other doesn’t – illustrating why functional gene assays are crucial. Class integration: This leads to a broader reflection on the course: initially, students learned how to sequence and assemble genomes, then how to measure gene expression and variation; now they see how those tools help in complex systems (an entire community’s DNA or a whole organism’s multi-layered response to environment). The microbiome example emphasizes systems biology thinking – multiple species interacting, requiring genomics data integration. It also hints at a “puzzle” going forward: linking genotype to phenotype not just within one genome, but across interacting genomes (host and microbiome).  
* ***Skills gained:*** By week 14, students have developed a holistic view. They are capable of reading current literature and extracting how genomics approaches are applied to real-world problems (like conserving mangroves or studying disease ecology). In technical terms, they’ve been exposed to analyzing bisulfite sequencing outputs (methylation calling) and to the idea of functional enrichment analysis for microbiome genes. The final cases encourage them to think critically and interdisciplinarily, preparing them to apply genomic skills in research projects or further studies.

# 

# **Broader Inquiries and Puzzles Highlighted**

Throughout BIOL550, several cross-cutting scientific inquiries emerge – these are “puzzle” style challenges that illustrate the evolving nature of genomic research:

***“Missing Genes” in Assemblies:*** Students confront the fact that early NGS-based assemblies sometimes failed to capture all expected genes, often due to technical limitations. For example, in the nematode assembly case (Nippostrongylus brasiliensis), the short-read assembly by a genome project (WTSI) had many fragmented genes – some universal single-copy genes (USCOs) and important enzyme genes (CAZymes) were split or missing due to repetitive sequences causing contig breaks. Only by using long Oxford Nanopore reads did researchers resolve these repeats and recover the full gene sequences. The course thus raises the puzzle: if a gene isn’t found in an assembly, is it truly absent biologically, or just technically absent? Students learn to approach any draft genome with caution regarding completeness. The chicken assembly comparison also touched on this – while most genes were captured, some smaller or repeat-associated genes might be missing or truncated in draft NGS assemblies. BIOL550 teaches strategies to address this puzzle: increasing read lengths, deepening coverage, and using orthogonal evidence (transcripts, homology) to find “missing” genes.

***Ambiguous Assembly Structures and Haplotype Resolution:*** The potato case exemplifies how complex genomes can produce ambiguous assembly artifacts (e.g., one contig representing multiple collapsed haplotypes). This raised the question of how to untangle such structures. The solution (sequencing many pollen genomes for binning) was itself a clever puzzle-solving approach. Students see that new experimental designs (like single-haplotype sequencing or trio binning with known parents) can solve ambiguities that pure computational methods cannot. This theme – of distinguishing nearly identical sequences – is also relevant in metagenomics (differentiating strains of the same species) and in segmental duplications within genomes. The concept of graph-based assemblies (representing multiple haplotypes in a graph rather than a single consensus) is briefly mentioned as a future direction to handle ambiguity. By exploring these, students appreciate the ongoing puzzle for genome biologists: how to represent highly variable or polyploid genomes without losing important variation.

***Strain-Level and Allele-Level Functional Variation:*** A recurring idea is that genetic variation at fine scales (between strains of a species or alleles in a genome) can have functional consequences. In BIOL550, this appears in multiple guises. The variant calling week highlights that within a viral quasispecies or a pooled sample, low-frequency mutations (minor strains) might be crucial (e.g., a drug resistance mutation present at 5% frequency could expand under treatment) – hence, tools like LoFreq are needed to catch those. The potato transcriptome analysis revealed allele-specific gene expression: 11% of genes in tetraploid potato showed differential expression between haplotypes, meaning effectively that each “strain” (haplotype) of the gene was regulated differently, which could affect traits. Similarly, the mangrove study’s focus on epigenetic differences under stress can be viewed as the environment creating quasi-strains at the epigenome level (with and without methylation) that result in different gene outputs. In microbiomes, strain-level variation is equally critical – two strains of E. coli might both be present in a gut, but one produces a toxin, and the other doesn’t; functional assays are needed to tell. The course underlines that modern genomics is moving beyond just species or gene presence/absence to these subtle within-group variations. Students learn experimental and computational approaches to characterize strain/allele variation, from variant calling pipelines to phased assemblies and high-resolution metagenomics.

In summary, BIOL550 not only trains students in current genomics techniques but also immerses them in the intellectual challenges at the field’s frontiers. By grappling with puzzles like missing genes, ambiguous assemblies, and hidden variation, students gain a forward-looking perspective. They are encouraged to think like researchers: to ask what might be overlooked in a result and how new technologies or analyses could uncover deeper layers of biological information. This comprehensive exposure positions graduates of BIOL550 to contribute meaningfully to genomics research or any biotechnology field that relies on large-scale genomic data.

## **Semester 5: Integrated BIOL550 & DSCI601 Plan**

* **Weeks 1–2:** **BIOL550:** Finalize dataset and preprocessing pipeline. Select an RNA-seq/epigenomic dataset (e.g., TCGA or GEO) with demographic labels. Run QC, alignment (e.g., HISAT2/STAR), and quantify expression/variants (Bowtie/GATK) – leveraging code and protocols from BIO630/ISTE780 when possible. **DSCI601:** Draft project proposal and baseline model. Define research questions in light of GA-Work (quantum ML) and IDAI700 (fairness/EQUITAS). Produce a “data card” summarizing dataset composition, demographics, preprocessing steps, and initial fairness baseline. Implement a simple classifier on raw features and compute initial accuracy and disparity metrics (e.g. disparate impact) to set baselines.

* **Weeks 3–4:** **BIOL550:** Perform read alignment, variant calling, and methylation analysis (epigenomics) in parallel. Use BIO630-derived scripts (e.g., Nussinov-based modules) to add RNA structural features where applicable. Integrate multi-omics (RNA+epi) data for biomarker discovery – following the Puzzle Plan’s multi-omics framework. Outputs: expression matrix, VCFs, annotated variants, and feature tables. **DSCI601:** Build multi-omic ML models. Ingest BIOL550 outputs (expression, variants, methylation), and train baseline models (e.g., Random Forest/neural networks) to predict disease status. Incorporate a quantum-inspired angle (e.g., implement a simple quantum circuit classifier on a subset of features, or apply the GA-Work “neural bandit” concept to optimize feature selection). Evaluate model accuracy and fairness (EQUITAS): compute group-specific metrics (sensitivity, disparate impact). Deliverable: refined model code and preliminary results.

* **Weeks 5–6:** **BIOL550:** Analyze RNA secondary structure effects and enhancer/promoter marks. Reuse the BIO630 Nussinov algorithm code to compute RNA folding ΔG for transcripts. Integrate these thermodynamic stability features into the biomarker analysis as proposed in the Puzzle Plan (RNA ΔG as a fairness covariate). Map variants to regulatory regions (from ISTE780/BIO630 resources) and assess impact on gene expression. Outputs: “rna\_structure.py” module and integrated feature dataset (including Nussinov ΔG). **DSCI601:** Develop advanced ML and fairness mitigation. Train enhanced models (e.g., deep neural networks, ensemble methods) on the enriched feature set. Experiment with adversarial debiasing or reweighting (inspired by GA-Work’s adversarial bandits) to protect against subgroup bias. Enforce fairness constraints from IDAI700/EQUITAS: tune decision thresholds so sensitivity disparities stay ≤5%. Deliverable: trained ML models (code: baseline\_model.py, neural\_model.py, ensemble\_fair\_model.py in repo) and fairness evaluation script.

* **Weeks 7–8:** **BIOL550:** Refine analysis and begin write-up. Perform differential expression and epigenetic-wide association analyses (e.g., using DESeq2/Cuffdiff), comparing subgroups to expose potential biases. Merge results into a coherent biomarker pipeline. Document methods/results in a draft “BIOLOG550 paper” section. **DSCI601:** Fairness auditing and ethics integration. Apply an ISTE780-derived fairness audit (script fairness\_audit.py) to the BIOL550 results to identify any new disparities. Develop a governance framework: specify rollback triggers (from IDAI700) if fairness criteria fail. Draft ethics/fairness write-up (template) detailing how preprocessing and modeling uphold EQUITAS principles. Deliverable: updated ML pipeline code, interim results figures, and sections of the Methods/Results draft.

* **Weeks 9–10:** **BIOL550:** Multi-omics integration and manuscript draft. Integrate expression, variant, and epigenomic findings into one analysis. Validate candidate biomarkers (e.g., via enrichment analysis or external datasets). Write up Results and Discussion for the BIOL550 deliverable (intended as a publishable paper on “Fair RNA/variant biomarkers”), emphasizing reuse of BIO630 methods and ISTE780 metrics. **DSCI601:** Finalize model and comparative analysis. Incorporate “ensemble\_fair\_model.py” to combine classifiers (leveraging ensemble techniques highlighted in ISTE780 notes). Evaluate final performance vs fairness trade-offs. Prepare ML paper draft (“fair biomarker classification”), including an ethics section (Template 4 from Semester5-Notes) and compliance with IDAI700 frameworks. Deliverable: full drafts of both course papers with figures and code on GitHub.

* **Weeks 11–12:** **BIOL550:** Capstone presentation and final revisions. Prepare slides outlining the integrated pipeline (see TEMPLATE “Capstone Presentation Outline”). Perform one last fairness audit: e.g., plot disparity (DI) trajectory over data/iterations (akin to FAIRNESS\_DASHBOARD.md). Finalize and proofread the BIOL550 paper (code finalized, ready for submission). **DSCI601:** Submit final report and code. Finalize the “DSCI601 final\_report.md” with all results, and update the Data Card with final demographics and limitations. Ensure repo documentation (README) highlights how each week extends previous courses: add BIO630\_APPLICATION.md and ISTE780\_OPERATIONALIZATION.md describing reuse. Deliverables: BIOL550 and DSCI601 papers (each formatted for publication), and a unified GitHub repo “equitable-rna-biomarkers” containing code/tools/datasets.

* **Dependencies & Synergy:** BIOL550 outputs feed directly into DSCI601 models (expression/feature tables → ML input). Key code is **reused**: Nussinov structure (BIO630) in Week 5; fairness metrics (ISTE780) in Week 11; ML fairness frameworks (IDAI700) throughout. The plan intentionally aligns frameworks: e.g., DSCI’s neural-bandit and ensemble methods (from GA-Work) parallel BIOL550’s pipeline choices, unifying under the Puzzle Plan’s goal of \<5% disparity. All deliverables (papers, code, dashboards) are designed as publishable research outputs. This integrated timeline ensures each project builds on past work and supports the other – achieving modular, equity-focused bioinformatics as envisioned in the Puzzle Plan.

**Sources:** Derived from course notes and strategic plans in BIO630, ISTE780, IDAI700, GA-Work, and Semester5-RIT-Notes.

## **Cross-Course Work Strategy:** 

## **BIOL550, DSCI601, BIO630, ISTE780, IDAI700, GA-Work, Academic Planning**

**Main takeaway:** Use **one shared scientific/data-science project** as the backbone for the semester and let each course take a different “view” of it:

* **BIOL550** → biological/HTS framing, methods, and data-generation assumptions.  
* **DSCI601** → applied data science pipeline on that same dataset.  
* **BIO630** → algorithms/theoretical underpinnings (assembly, alignment, optimization).  
* **ISTE780** → advanced analytics/model evaluation and deployment framing.  
* **IDAI700** → research framing and scholarly paper around the same core problem.  
* **GA-Work \+ Academic Planning** → weekly milestones, reflection, and long-term PhD-path alignment.

Below is an **itemized plan by course and major assignment**, structured so that work in one place can be reused/extended in others.

### **1\. Choose and Fix the Shared “Core Project.”**

You already have several candidate “spines” in your files:

* **QuantumPathOptimization.pdf**: optimization/path planning problem well-suited to BIO630 algorithms and ISTE780/DSCI601 modeling.QuantumPathOptimization.pdf​  
* **main\_fixed\_references.pdf**: likely a prior paper draft you wrote; can be the starting point for IDAI700 and GA-Work integration.main\_fixed\_references.pdf​  
* **BIOL550 readings**: microbiome function, MaSuRCA assembly, Dual RNA-Seq, etc 

Given the puzzle's focus on **equitable, big-data diagnosis**, a good choice is:  
**Core Project Theme:** “Data-driven prediction and explanation in complex biological or quantum-inspired systems,” implemented concretely either as  
– an **omics diagnosis task** (HTS / microbiome / epigenomics) or  
– a **quantum path optimization/routing** task.  
Pick **one concrete dataset/problem** and commit to it for all courses.

### **2\. BIOL550 (This Course) – HTS Methods Feeding the Project**

There is no explicit BIOL550 syllabus file here, but the Week 3 MaSuRCA article and Week 14 microbiome article show the pattern: each week centers on an HTS method or application. Use BIOL550 as the **“methods \+ data understanding” engine** for the project.​

## **Recurring Weekly Tasks (BIOL550)**

For each BIOL550 week:

1. **BIOL550-Notes (2 pages, “-Notes” doc)**  
   * “Problem & data” summary from the paper.  
   * “Pipeline sketch”: what preprocessing, assembly/mapping, statistics, and evaluation did they use?  
   * “Risks & biases”: at least three ways the results could be wrong or biased.  
   * “Re-use in project”: 1 paragraph on how those methods or concerns map into your core project (features, preprocessing, evaluation).  
2. **Mini-method artifact**  
   * Tiny implementation or demo:  
     * e.g., emulate the super-reads concept with a toy k-mer stitcher based on MaSuRCA.  
     * illustrate cross-mapping bias like Dual RNA-Seq mapping strategies.  
     * Model functional redundancy as a feature ambiguity in microbiome data.  
   * Save under /semester5/BIOL550/weekXX/.  
3. **Decision log entry**  
   * Add 1 bullet to a shared “Project Decisions” doc (under GA-Work) capturing a permanent decision the project will follow (e.g., “for omics models, we avoid purely taxonomic features because of functional redundancy; we include function-level features where possible”). 

These three pieces are what other courses will repeatedly point back to.

## 

### 

### **3\. DSCI601 (Applied Data Science I) – Pipeline on the BIOL550 Project**

From **syllabus-DSCI.601.01-Applied-Data-Science-I.pdf**, DSCI601 expectations include problem framing, data acquisition/cleaning, exploratory analysis, modeling, and communication.​

## 

## **DSCI601 Key Assignments (typical structure from syllabus)**

Exact names may vary, but the pattern is:

* **Project Proposal** (early semester)  
* **Midterm Progress / EDA & Baseline Models**  
* **Final Project (Report \+ Presentation)**


## **How to Reuse BIOL550 Work**

1. **Proposal (DSCI601)**  
   * Problem statement, domain background → **reuse BIOL550-Notes** and your BIOL550 introduction to the system.  
   * Data description → Import the same dataset/setting you use for BIOL550 methods.  
   * Risks & ethics → reuse BIOL550 “Risks & biases” section verbatim or with minor edits.  
2. **Midterm Progress**  
   * Data cleaning & processing → incorporate decisions from BIOL550 Decision Log (e.g., how to deal with misalignment, redundancy, etc.).  
   * Baseline models → simple models on the same outcome BIOL550 are contextualizing.  
   * Comparison to domain expectations → connect model results to what the biological/physics papers suggest should happen.  
3. **Final Project**  
   * Methods → reference BIOL550 methods and BIO630 algorithms (below) as the scientific justification for your pipeline.  
   * Discussion → interpret model decisions and limitations in light of BIOL550 limitations (assembly error, functional redundancy, etc.).

## 

## **Weekly DSCI601 Tasks (aligned to BIOL550)**

Each week, after BIOL550 tasks, do:

* 30–60 min: translate new BIOL550 insights into **data or modeling changes** (feature engineering, evaluation nuance, error analysis).  
* 30–60 min: update a DSCI601 **project notebook** (EDA → model → metrics).  
* 15–20 min: update DSCI601 **running report** so you don’t cram at the end.

## 

# **BIOL550 × DSCI601: Integrated Academic Strategy**

## **Executive Report**

## **SUMMARY**

I have created a **comprehensive, semester-long integrated strategy** for BIOL550 and DSCI601 that:

1. **Eliminates duplicate work** by having both courses contribute to a single shared project: **"Fair RNA Biomarker Discovery for Equitable Disease Risk Stratification."**  
2. **Operationalizes your EQUITAS framework** from IDAI700 by auditing algorithmic fairness at every pipeline stage (preprocessing → modeling → evaluation).  
3. **Extends BIO630 & ISTE780 work** by applying RNA algorithms and fairness metrics to a real bioinformatics dataset.  
4. **Produces four major deliverables:**  
   * **Shared GitHub repository** (fully reproducible, open-source)  
   * **Data card** (source, preprocessing, bias audit, ethics)  
   * **Architecture memo** (pipeline design \+ fairness strategy)  
   * **Fairness assessment report** (disparate impact before/after mitigation)

## **KEY DELIVERABLES CREATED FOR YOU**

I have prepared **5 comprehensive strategy documents** (all available for download):

## **1\. Main Strategy Document (280 document)**

* 607 lines of detailed planning  
* Complete 14-week BIOL550 curriculum with weekly deliverables  
* DSCI601 integration timeline  
* Shared deliverables with grading criteria  
* Rubrics, contingencies, and success metrics


## **2\. Executive Summary (280 artifact)**

* Quick-start guide  
* Core concept overview  
* Why this approach works (table comparison)  
* Week-by-week milestones  
* Grading transparency & example flow


## **3\. Semester Timeline (281 artifact)**

* Month-by-month breakdown (January–April)  
* Week-by-week sync points  
* BIOL550 \+ DSCI601 parallel tasks  
* Key dates and checkpoints  
* GitHub commit schedule


## **4\. Course Integration Document (282 artifact)**

* How BIO630 → BIOL550 (reuse algorithms)  
* How ISTE780 → BIOL550 × DSCI601 (operationalize fairness)  
* How IDAI700 → entire project (implement EQUITAS)  
* Three-semester arc (foundation → application → impact)  
* Progression of rigor & scope


## **5\. Launch Checklist (283 artifact)**

* Pre-semester setup tasks  
* Week-by-week verification checklists  
* Grading progress tracking  
* Red flags & contingencies  
* Success metrics


## **6\. One-Page Visual Summary (284 artifact)**

* Concept diagram  
* Weekly handoff pattern  
* Fairness journey timeline  
* Shared deliverables structure  
* Key dates & contact info

## **THE PROJECT SPINE: "Fair RNA Biomarker Discovery"**

## **Research Question**

**Biology:** How can we identify disease-relevant RNA biomarkers while ensuring prediction accuracy does *not* systematically vary across ancestry groups or care settings?  
**Data Science:** Given an RNA expression dataset with protected attributes, how do we train a model that achieves strong predictive performance, passes equalized odds fairness tests, and includes a detailed fairness audit?

## **Weekly Structure**

| Week | BIOL550 Topic | DSCI601 Parallel | Spine Ledger Decision |
| :---- | :---- | :---- | :---- |
| 1 | Sequencing QC | Advisor meeting | QC threshold |
| 2 | Read mapping | Literature review | Mapping protocol |
| 3 | Normalization | Literature review | Stratified CPM |
| 4 | Feature selection | Proposal | Fairness-aware threshold |
| 5 | RNA structure | Related work | Complexity filter |
| 6 | Missing data | Related work | Zero-inflation model |
| 7 | EDA \+ **Synthesis** | Proposal finalized | Mandatory demographic coloring |
| 8 | Reproducibility | Advisor meeting | Reproducibility per subgroup |
| 9 | DE testing | Approach writeup | Stratified DE reporting |
| 10 | ML preprocessing | **Architecture memo** | Stratified scaling |
| 11 | **Fairness audit** | Ethics writeup | Baseline DI measurement |
| 12 | Data augmentation | **Fairness report** | Fairness-aware SMOTE |
| 13 | Reproducibility | **Endterm demo** | Docker containerization |
| 14 | **Capstone** \+ synthesis | **Final report** | All decisions reviewed |

## **GRADING DISTRIBUTION**

**BIOL550: 400 points**

* Weekly deliverables (14 × 15 pts): 210 pts  
* Midterm synthesis: 40 pts  
* Shared deliverables: 100 pts  
* Final capstone: 50 pts

**DSCI601: 120 points**

* Proposal \+ related work: 25 pts  
* Approach \+ architecture: 10 pts  
* Ethics & fairness: 5 pts  
* Code review \+ code: 10 pts  
* Advisor meetings: 30 pts  
* Final demo \+ report: 15 pts  
* Code submission: 5 pts  
* Miscellaneous: 20 pts

**Shared & Co-Graded:**

* Data card: 100 pts total (BIOL550: 50, DSCI601: 30\)  
* Architecture: 100 pts total (BIOL550: 50, DSCI601: 40\)  
* Fairness report: 150 pts total (BIOL550: 60, DSCI601: 100\)

## **INTEGRATION WITH PRIOR COURSES**

| Prior Course | Contribution to BIOL550 × DSCI601 |
| :---- | :---- |
| **BIO630** | RNA algorithms (Nussinov, energy minimization) \+ fairness-aware evaluation framework |
| **ISTE780** | Fairness metrics (80 rule, cost-weighting, equalized odds) applied weekly |
| **IDAI700** | EQUITAS framework (co-design, governance, civic literacy) operationalized at every step |

## 

## **MONTHLY SYNC STRUCTURE**

Four 30-minute meetings with both instructors:

* **End of January (W4):** W1–W4 progress, data/fairness targets  
* **End of February (W8):** Midterm check, preprocessing complete  
* **End of March (W12):** Fairness baseline, mitigation strategies  
* **End of April (W14):** Celebration, discuss future directions

## **GITHUB REPO STRUCTURE**

equitable-rna-biomarkers/  
├── README.md (installation, example run, expected outputs)  
├── environment.yml (conda environment, pinned versions)  
├── Makefile (reproducible workflow)  
├── biol550/ (preprocessing pipeline)  
│   ├── qc.py, mapping.py, normalization.py, ...  
│   ├── methods\_memos/ (W1–W14 deliverables)  
│   └── spine\_ledger.md (all 14 decisions logged)  
├── dsci601/ (modeling pipeline)  
│   ├── feature\_engineering.py, modeling.py, fairness\_evaluation.py  
│   └── ethics\_writeup/ (fairness report iterations)  
├── data/ (raw, processed, data\_card.md)  
├── docs/ (architecture.md, final\_report.tex, visualization suite)  
├── results/ (figures, metrics CSV, version-controlled outputs)  
└── .github/workflows/ (CI/CD: automated tests on each push)

## **SUCCESS CRITERIA (By Week 14\)**

✓ **Reproducibility:** Anyone can clone → run example → get same results  
✓ **Fairness Journey:** Disparate impact tracked week-by-week (baseline → mitigation → final)  
✓ **Integration:** BIOL550 capstone \+ DSCI601 report tell one coherent fairness story  
✓ **Documentation:** All decisions logged with rationale; links to code commits  
✓ **Open Science:** GitHub public, CC-BY-4.0 licensed, DOI generated  
✓ **Community Ready:** README invites feedback; limitations section guides future use

## **WHY THIS WORKS**

| Aspect | Traditional Approach | This Strategy |
| :---- | :---- | :---- |
| **Scope** | Two separate projects (8–10 weeks overlap) | One integrated project (zero duplication) |
| **Authenticity** | Hypothetical datasets | Real omics data with protected attributes |
| **Fairness** | Bolt-on at the end | Woven throughout (Week 1–14) |
| **Grading** | Two reports, two grades | Two capstones, one shared narrative |
| **Impact** | Coursework artifact | Publication-ready methodology \+ code |

## **NEXT STEPS**

1. **Download all 5 strategy documents** (provided as artifacts 280–284)  
2. **Contact both instructors** (by Jan 20\) with:  
   * This integration strategy  
   * Request to align on timeline & data access  
   * Schedule monthly sync calls  
3. **Set up GitHub repo** (by Jan 15\)  
4. **Begin Week 1 BIOL550** with first methods memo \+ code

## 

## **ADDITIONAL RESOURCES IN WORKSPACE**

Two comprehensive planning documents have been saved to your workspace:

* /workspace/BIOL550\_DSCI601\_Integrated\_Strategy.md (607 lines, full detail)  
* All documents reference BIO630, ISTE780, and IDAI700 work

## **CONTACT**

All documents include:

* Contact quick-reference tables  
* Red flags & contingency plans  
* Week-by-week checklists  
* Grading rubrics  
* Success metrics


## **FINAL THOUGHT**

**This strategy is proof that fairness-aware bioinformatics is teachable, reproducible, and operationalizes your EQUITAS framework in real data.**  
By the end of the semester, you will have:

1. A fully reproducible fairness-aware diagnostic pipeline  
2. Measurable evidence that bias mitigation works  
3. Two capstone presentations telling one integrated story  
4. A publication-ready methodology that advances the field

# **BIOL550 × DSCI601: Integrated Academic & Work Strategy**

## **Executive Summary & Quick-Start Guide**

Date: January 14, 2026 | Status: Ready for Semester Implementation  
Author: \[You\] | Instructors: BIOL550 \+ DSCI601 advisors

## 

## **THE CORE IDEA**

One shared project. Two complementary courses. Zero duplicate work.  
You will develop a single, semester-long, equitable bioinformatics diagnostic pipeline that:

* Uses RNA/biomarker omics data to predict disease risk or clinical outcomes.  
* Explicitly audits and mitigates algorithmic bias across populations (ancestry, care site, socioeconomic status).  
* Demonstrates that fairness and performance can coexist—operationalizing your EQUITAS framework from IDAI700.

BIOL550 grades: Biological rigor, omics methods, preprocessing fairness audits, reproducibility.  
DSCI601 grades: Modeling excellence, fairness metrics, ethics integration, stakeholder communication.  
Shared & jointly graded: Data card, architecture memo, fairness assessment report, final GitHub repo.

## **WHY THIS WORKS**

| Dimension | Traditional Approach | This Strategy |
| :---- | :---- | :---- |
| Scope | Two separate projects → 8–10 weeks of overlapping work. | One project → each course focuses on its strength. |
| Learning | Siloed: biology in BIOL550, data science in DSCI601. | Integrated: methods feed modeling; fairness is woven throughout. |
| Fairness | Fairness was grafted on at the end. | Fairness audited at every stage (preprocessing → model → evaluation). |
| Burden | Two capstones, two repos, two reports. | One repo, one narrative, two capstone presentations on the *same* project. |
| Authenticity | Hypothetical omics dataset for coursework. | Real-world workflow: biology constraints → data science solutions. |

## **THE PROJECT SPINE: "Fair RNA Biomarker Discovery"**

## **Research Question**

Biology: How can we identify disease-relevant RNA biomarkers while ensuring prediction accuracy does *not* systematically vary across ancestry groups or care settings?  
Data Science: Given an RNA expression dataset with protected attributes, how do we train a model that:

* Achieves strong predictive performance (AUC \> 0.80)?  
* Passes equalized odds, fairness tests across ancestry?  
* Includes a detailed fairness report with rollback triggers?

## **Concrete Outputs**

| Deliverable | Graded by | Description |
| :---- | :---- | :---- |
| Data Card | Both | 2–3 pages: source, preprocessing, bias audit, ethical considerations. |
| Methods Memos | BIOL550 | 14 weekly 1-pagers (W1–W14) \+ 1 synthesis (5–8 pages). |
| GitHub Repo | Both | Fully reproducible pipeline: preprocessing (BIOL550) \+ modeling (DSCI601). |
| Architecture Memo | Both | 2–3 pages: pipeline design, tool choices, fairness strategy. |
| Fairness Report | Both | 5–8 pages: disparate impact audit, bias mitigation results, limitations. |
| Final Report | DSCI601 | 12–15 pages: integrates all above \+ methods section leads with BIOL550 contributions. |

## **BIOL550: 14-WEEK STRUCTURE**

## **Weekly Formula: Methods Memo \+ Coding \+ Spine Ledger Decision**

Each week, you complete three short deliverables:  
A. Methods Memo (2 pages, 5 pts)

* Summarize the week's omics method (e.g., read mapping, normalization, statistical testing).  
* Identify 3–4 failure modes (ways bias or error can creep in).  
* Connect explicitly to your Project Spine (e.g., "Our pipeline will include cross-mapping checks because of this week's learning").

B. Coding Implementation (Functional code, 5 pts)

* Reproduce or implement a toy version of that week's algorithm.  
* E.g., Week 1: FASTQ parser \+ basic QC. Week 9: Limma-like DE test with ancestry stratification.  
* All code goes to /biol550/ folder on GitHub.

C. Spine Ledger Update (One decision, 5 pts)

* Log one permanent decision that improves your shared pipeline.  
* E.g., "QC threshold: reads \< Q20 removed." Or: "DE calling: stratified intercept per ancestry."  
* All decisions tracked in /biol550/spine\_ledger.md.

Weekly subtotal: 15 points × 14 weeks \= 210 points.

## **Week-by-Week Topics**

| Week | Topic | Bias Mode(s) | Code Artifact | Spine Ledger Decision |
| :---- | :---- | :---- | :---- | :---- |
| 1 | Sequencing QC | GC bias, polymerase slippage | FASTQ parser \+ QC report | QC threshold: Q20 cutoff |
| 2 | Read mapping | Cross-mapping, reference bias | Dual-mapper toy (k-mer lookup) | Combined reference strategy |
| 3 | Normalization | Library size, batch effects | CPM \+ batch removal | Stratified CPM by cohort |
| 4 | Feature selection | Disparity in gene retention | Variance filtering audit | Fairness-aware threshold |
| 5 | RNA structure | Assay bias, structural complexity | Nussinov algorithm | Complexity filter for reliability |
| 6 | Missing data | Systematic dropout in low-abundance genes | KNN \+ MICE comparison | Zero-inflation model per subgroup |
| 7 | EDA & visualization | Subgroup visibility | UMAP \+ ancestry coloring | Mandatory demographic coloring |
| 8 | Reproducibility | Invisible batch effects | ICC calculation stratified by ancestry | Reproducibility check per subgroup |
| 9 | Statistical testing | Confounding adjustment bias | Limma-style DE with ancestry intercept | Stratified DE reporting |
| 10 | ML preprocessing | Scaling disparities | Robust scaling per ancestry | Stratified scaling protocol |
| 11 | Fairness audit baseline | Aggregate disparate impact | Disparate impact calculator | 80-rule compliance target |
| 12 | Bias mitigation | Augmentation & resampling | SMOTE stratified by ancestry | Fairness-aware augmentation |
| 13 | Reproducibility & docs | Auditability | Docker containerization | Reproducible environment pinning |
| 14 | Synthesis & capstone | Integration & storytelling | Final pipeline integration test | All decisions reviewed \+ linked |

## 

## **BIOL550 Final Grades**

| Component | Weeks | Points | % |
| :---- | :---- | :---- | :---- |
| Weekly memos (A) \+ code (B) \+ ledger (C) | 1–14 | 210 | 52.5% |
| Midterm synthesis memo | 7 | 40 | 10% |
| Data card (joint, BIOL550 portion) | 10–13 | 50 | 12.5% |
| Architecture memo (joint, BIOL550 portion) | 13 | 50 | 12.5% |
| Final capstone presentation | 14 | 30 | 7.5% |
| Final code \+ README | 14 | 20 | 5% |
| Total |  | 400 | 100% |

## **DSCI601: STANDARD PROJECT-BASED STRUCTURE**

You form a team (1–2 people) and adopt the Project Spine as your applied data science capstone.

## **Key Milestones (Approximate Weeks)**

| Checkpoint | Week | Deliverable | Points | Connection to BIOL550 |
| :---- | :---- | :---- | :---- | :---- |
| Advisor meeting 1 | 2–3 | Feedback report \+ pitch | 15% | BIOL550 W1–W2 data |
| Preliminary proposal | 4 | 2–3 page proposal | 5% | Integrate W1–W4 methods |
| Related work survey | 6–7 | 5–8 page literature review | 10% | BIOL550 provides domain references |
| Advisor meeting 2 | 8 | Feedback report \+ code review | 15% | BIOL550 W1–W8 pipeline |
| Approach writeup | 9 | Feature engineering & model selection | 5% | Use BIOL550 W9–W11 insights |
| Architecture memo | 10 | Pipeline design (joint with BIOL550) | 5% | BIOL550 W13 reproducibility |
| Code review | 10 | Peer feedback on code | 5% | BIOL550 code reviewed |
| Ethics & fairness | 11 | Bias audit \+ mitigation strategies | 5% | BIOL550 W11–W12 audits |
| Endterm demo | 13 | 15-min live presentation | 7% | BIOL550 \+ DSCI601 in action |
| Final code | 13 | GitHub submission | 5% | Shared repo |
| Final report | 14 | 12–15 pages | 8% | Integrates all the above |
| Total |  |  | 100% |  |

## 

## **How DSCI601 Integrates BIOL550 Work**

* Weeks 1–3: Advisor-guided problem framing; incorporate BIOL550 W1–W2 data insights.  
* Weeks 4–6: Proposal \+ literature review; BIOL550 methods memos provide domain references.  
* Weeks 7–9: Feature engineering & modeling strategy; directly use BIOL550 W4–W10 fairness audits.  
* Weeks 10–12: Build model; operationalize EQUITAS through fairness metrics (equalized odds, calibration).  
* Weeks 13–14: Final demo \+ report; tell unified story of omics methods \+ fair modeling.

## 

## **SHARED DELIVERABLES (GRADED BY BOTH)**

## **1\. Data Card (2–3 pages)**

What: Document your data source, preprocessing, bias risks, and ethical considerations.  
Content:

* Source (dataset ID, N subjects, N genes).  
* Demographic breakdown (ancestry, sex, age, site of care).  
* Preprocessing steps with code references.  
* Bias audit: disparate impact of preprocessing *by ancestry*.  
* Limitations & ethical considerations.

Timeline: BIOL550 leads W1–W7; DSCI601 finalizes by W10.  
Grading: BIOL550 15%, DSCI601 10%.

## 

## **2\. Architecture Memo (2–3 pages \+ diagram)**

What: High-level design of the end-to-end pipeline.  
Content:

* Data flow diagram (raw → preprocessing → features → modeling → fairness eval → outputs).  
* Key decision points & rationale (why this algorithm over that one?).  
* Tool/framework choices (Python libraries, Docker, etc.).  
* Deployment & sustainability plan.

Timeline: Weeks 10–12 (joint authorship).  
Grading: BIOL550 20%, DSCI601 15%.

## 

## **3\. Fairness Assessment Report (5–8 pages \+ visuals)**

What: Comprehensive audit of algorithmic fairness across the entire pipeline.  
Content:

* Fairness definition (disparate impact, equalized odds, calibration, etc.).  
* Baseline fairness (from preprocessing, BIOL550 W1–W12).  
* Model fairness (classifier performance, calibration *by ancestry*).  
* Bias mitigation strategies applied (resampling, cost-weighting, post-hoc calibration).  
* Before/after results (% improvement in disparate impact).  
* Rollback triggers (if disparate impact \> X%, stop; seek community review).  
* Limitations.

Timeline: Weeks 9–12 (co-authored).  
Grading: BIOL550 15%, DSCI601 25%.

## 

## **4\. GitHub Repo**

What: Fully reproducible, documented pipeline code.  
Structure:  
equitable-rna-biomarkers/  
├── README.md (install, run example, expected outputs)  
├── environment.yml (conda environment)  
├── biol550/ (preprocessing, QC, normalization, feature selection, fairness audits)  
├── dsci601/ (feature engineering, modeling, fairness evaluation)  
├── data/ (raw, processed, data\_card.md)  
├── results/ (figures, metrics CSV)  
└── .github/workflows/ (CI/CD tests)

Timeline: Ongoing (weeks 1–14), integration in W13–W14.  
Grading: BIOL550 20%, DSCI601 20%.

## **MONTHLY SYNCHRONIZATION**

End of each month (4 times during semester): 30-min sync call.  
Attendees: BIOL550 instructor, DSCI601 advisor/instructor, you.  
Agenda:

* Review completed methods, memos & code artifacts.  
* Check progress on fairness audits.  
* Align on any design changes.  
* Identify blockers (data access, compute resources, scope creep).

## 

## 

## **GRADING TRANSPARENCY**

| What | Graded by | When | Points | Notes |
| :---- | :---- | :---- | :---- | :---- |
| Weekly memos \+ code (BIOL550 only) | BIOL550 | Weekly | 210 (52.5%) | No DSCI601 grade; DSCI601 reads for context. |
| Midterm synthesis | BIOL550 | W7 | 40 (10%) | BIOL550 only. |
| Data card | Both | W10–W13 | 100 total (BIOL550: 50, DSCI601: 30\) | Joint grading; both must sign off. |
| Architecture memo | Both | W10–W12 | 100 total (BIOL550: 50, DSCI601: 40\) | Co-authored; both grades. |
| Fairness report | Both | W9–W12 | 150 total (BIOL550: 60, DSCI601: 100\) | BIOL550 owns the preprocessing audit; DSCI601 owns the model audit. |
| Proposal \+ related work | DSCI601 | W4–W7 | 15 (DSCI601 only) | BIOL550 contributes domain references but is not graded. |
| Approach \+ architecture | DSCI601 | W9–W10 | 10 (DSCI601 only) | BIOL550 contributes feature insights. |
| Code review | DSCI601 | W10 | 5 (DSCI601 only) | Peer feedback on code. |
| Ethics & fairness | DSCI601 | W11 | 5 (DSCI601 only) | Modeling-specific fairness writeup. |
| Final capstone presentation (BIOL550) | BIOL550 | W14 | 30 (7.5%) | BIOL550 only; 15–20 min narrative. |
| Endterm demo (DSCI601) | DSCI601 | W13 | 7 (DSCI601 only) | 15-min live demo (both course contributions). |
| Final report | DSCI601 | W14 | 8 (DSCI601 only) | 12–15 pages integrating all work. |
| Final code submission | Both | W13–W14 | BIOL550: 20, DSCI601: 5 | Shared GitHub repo. |
| Total |  |  | BIOL550: 400, DSCI601: 120 | Clear separation of grades. |

## **EXAMPLE: HOW ONE BIOL550 WEEK FLOWS TO DSCI601**

## **Week 9 (BIOL550): Statistical Testing & Confounding**

BIOL550 produces:

* Methods memo: "DE genes differ by ancestry; aggregated DE calls mask subgroup biomarkers."  
* Code: Limma-style DE test with ancestry-stratified intercepts.  
* Spine ledger: "DE calling protocol: stratified intercept per ancestry; results reported separately."

DSCI601 receives (Weeks 10–11):

* Uses BIOL550's stratified DE genes as features.  
* Adds ancestry × gene interactions to the model (preserving subgroup signal).  
* In ethics writeup: "Following BIOL550's analysis, we include ancestry-stratified features to avoid aggregation bias."

Result: No redundancy. BIOL550 did fairness analysis once; DSCI601 operationalizes it in the model. 

## **QUICK-START CHECKLIST**

## **Before the semester starts**

*  GitHub repo created (template structure above).  
*  Data access confirmed (public dataset \+ IRB if needed).  
*  BIOL550 & DSCI601 instructors aligned on project scope & timeline.  
*  Monthly sync calendar scheduled (4 dates).

## **Week 1**

*  GitHub repo ready with /biol550/, /dsci601/, /data/, /docs/ folders.  
*  BIOL550 methods memo W1 \+ toy code pushed.  
*  DSCI601 advisor meeting held & first feedback report written.  
*  Spine ledger started with decision 1\.

## **Weeks 2–13**

*  Every Friday: BIOL550 pushes W\[N\] methods memo \+ code.  
*  Every Monday: DSCI601 reviews and plans W\[N+1\] features/modeling strategy.  
*  Monthly sync call (end of month 1, 2, 3, 4).

## **Week 14**

*  All 14 BIOL550 methods memos \+ code complete.  
*  DSCI601 final report finished & submitted.  
*  Data card, architecture memo, and fairness report finalized & signed by both instructors.  
*  GitHub repo cleaned up & documented.  
*  BIOL550 capstone presentation (15–20 min).  
*  DSCI601 endterm demo (already done W13) \+ final report submitted.

# **Manually switch the VPN server before connecting**

# This works for **Cisco AnyConnect** and **GlobalProtect** (RIT & UofR both commonly use these).

### **Steps**

1. # **Disconnect** from the VPN completely (Do not stay connected to UofR)

2. # **Open the VPN client** (but don’t click Connect yet)

3. # **Click the server/address field**

   * # Delete the UofR address entirely

   * # Manually type the **RIT VPN address**

4. # Common RIT VPN addresses (use the one your IT page specifies):

   * # vpn.rit.edu

   * # vpn.rit.edu/ritvpn

   * # remote.rit.edu

5. # Click **Connect**

6. # Authenticate with **RIT credentials \+ Duo**

# The key is **typing the RIT address manually** — auto-selection is what keeps forcing UofR.

# 

# **Linux Command Line Lab \- Section 1 & Scavenger Setup (Mac/RIT)**

# 

# **HTS** **Spring 2026**

**Linux Command Line**  
In this activity we will practice using SSH, Scp tools for file transfer, and the command line.

**Necessary programs for this and future workshops \- all should be free. Do not pay for any\!**

* **PC**  
  * Putty \- [http://www.chiark.greenend.org.uk/\~sgtatham/putty/download.html](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html)  
  * WinScp – [https://winscp.net/eng/download.php](https://winscp.net/eng/download.php)  
  * Xming \- [http://www.straightrunning.com/XmingNotes/](http://www.straightrunning.com/XmingNotes/)  
* **Apple**  
  * FileZilla – [https://filezilla-project.org/](https://filezilla-project.org/)  
  * X11 emulator

**1\.** We will start out by testing your accounts on one of the GSOLS servers with X11. 

* Note that if you are off campus, you must use the ITS VPN.   
  * You can find the **VPN** **software** by Googling for "RIT VPN".  
  * On Windows systems, start by opening the **SSH** **client** Putty.   
    * Set the server to the name given by the instructor, setting your username, and setting "Enable X11 forwarding" to "on".   
  * On the Apple systems, open a terminal and use the command "**ssh –X username@hostname**".   
    * When prompted, enter your password. You should now be at the prompt.

**2\.** Next we will play with some basic commands. 

* Notice that you are at a prompt which includes your username and the server name.   
* It also is followed by the **"\~"** character, which means your "**home directory**."   
  * Directories are the same thing as a "folder".

From your prompt, type "**ls**" and press enter. 

* Note that you have a list of file names that appear.   
* Now try "**ls \-al**".   
  * Notice how more information is displayed, including the   
    * name, size, and date last modified for each file.   
  * There are also two special "files" named **"." and ".."**.   
    * The former means **"the current directory"**, and the latter means **"the directory one higher than this."**   
    * Try changing to the directory above where you start (**your home directory**) by using the command "**cd ..**", then perform a "long listing" (e.g. "**ls \-al**").   
    * "**cd**" stands for "change directory".   
      * *What do you see?*   
      * *Do you see your username in the listing?*   
    * That would be your home directory.   
      * There are two ways to change back..."**cd \<username\>**"   
        * where "\<username\>" is your username without the "\<" and "\>" characters.   
      * Or, you could just enter "**cd**" as a command...without any "parameters" (additional information after the base command to modify the command's behavior), cd changes to your home directory.

**3\.** Next, we will transfer files from the desktop to the server and back. 

* Open up the file transfer program **WinScp (PC) or FileZilla (Apple)**.   
* **Create a file** with some simple text on the desktop using any word processor that can save documents as plain text   
  * (e.g. Notepad on PC).   
* Using the file transfer program, copy the file to your server account.   
* Verify that the contents are readable by using the command "**cat \<filename\>**" from the prompt.   
* Next, transfer the file "**Commandline.txt**" from your server account's home directory to your desktop.   
* On the PC, right click on the file and choose "**Open**" or "Open with…".   
  * **Choose Notepad**, but do not allow the box next to "Always use the selected program…" to remain checked   
    * (unless you really want to).   
  * On the Apples, open the file with your text editor.

**4\.** There are some commands that you will need more than others. From the command line, try all of the following, starting with the command "**man**".

* **man** \<commandname\> \- presents the man (manual) page on the command  
* **cat** \<filename\> \- shows the contents of a text file on your screen  
* **mkdir** \<dir\> \- creates a directory  
* **cd** \<dir\> \- changes into a directory  
* **cp** \<source\> \<destination\> \- copies the source file to the destination file  
* **cp \-R** \<source directory\> \<destination\> \- Recursively copies the source directory to the destination directory  
* **rm** \<filename\> \- removes a file…be careful with this command\! There is no backup\!  
* **mv** \<source\> \<destination\> \- moves a file from source to destination  
* **ls** \- lists all files in the current directory  
* \<command\> | more \- "pipes" output to a program that scrolls one page at a time to your screen  
* **chmod** \<permissions\> \<file\> \- changes read/write/execute permissions on a file  
* **pwd** \- "print working directory"…tells you which directory you are in  
* **passwd** \- allows you to change your password  
* **top** – shows what jobs are running on the server ("q" to quit)  
* **du \-k \-s** – show how much drive space is taken up by a directory and its subdirectories  
* **gzip** – compresses a file (saves drive space)  
* **gunzip** – uncompresses a file (uses more drive space)  
* **ln** – creates a link to a file (like a shortcut)  
* **grep** \<text\> \<filename\> – Looks for the text string in the file

**5\. The Server Scavenger Hunt\!**  
For the final portion of this workshop, you will need to find a series of pieces of information on the course server. To do this, you will need to use several of the above commands. Each item to be found requires increased sophistication. **Collect the answers** into a plain text file and upload that to the Dropbox.

1. In your folder is a **folder** **called** "**scav**".   
   * **Task:** Change into that directory and report the name of the file (not the directory) as item "a".  
   * **Answer:** \-r--r--r-- 1 pzg8794 pzg8794  153 May 13  2015 readme  
2. **Read that file's contents.**   
   * **Task: Look** for a line that states it is the answer to this question and **Report** the name of this answer as item **"b"**.  
   * **Answer:** The answer to "b" is "I found the file."  
3. In the file in part b are instructions for step c.   
   * **Task: Follow** those instructions **and report** items "c" through "e".  
   * **Answer**: \# The answer to "c" is "I will run this shell script."  
     

**6\.** After you finish the scavenger hunt, let's try using an editor. 

* There are many common options available, such as Nano, Emacs, Vi, Vim.   
  * If you already have one that you are comfortable with and is on the server, feel free to use it.   
  * *If you have not used a commandline editor before, let's learn Nano.*    
    * *To start the editor, use the command "nano filename.txt"...*  
      * *you can use any filename and extenstion that you want.*    
    * *An extension of ".txt" would probably be a good choice, though.*    
      * *Start up the editor, and enter several lines of test.*

In Nano, you can move around with the arrow keys, and type wherever the cursor is. 

* You should also be able to use Home, End, PageUp, and PageDown as normal.   
* The mouse should not move the cursor.   
* Once you are finished, you can use Ctrl-X to save an exit.   
* Follow the prompts.  
  * *Use "cat" or "more" on the document you created.*  
  * *In Nano, you can find common commands at the bottom of the screen.  "*  
    * *^K" means Ctrl-K.  That will "cut" the current line.*    
    * *You can then move the cursor, and use "^U" to paste the line back in at that position.*   
    *  *If you use ^K mutliple times, a single ^U will paste all of them.*    
  * *This is an easy way to edit code.*  
*  *You can also use ^C to see which line/character you are at, ^\_ to jump to a line, ^W to find text.*    
* *To write out any changes without quitting, you can use ^O.  ^G will allow you to see other options.*   
* *Again, all prompts are at the bottom of the screen.*

*After you are satisfied with your document, upload it to the Assignment box for this Workshop.*

**Subject:** BIOL550 Spring 2026 – Introduction and Health Accommodation Context

Hi Professor Osier,

I hope you are doing well.

I apologize for not reaching out earlier, but being sick for about a month with flu/RSV symptoms appears to have exacerbated my chronic illness condition. I've been dealing with the aftermath and working to get back to a stable, manageable baseline.

Thankfully, this week things seem to be improving, but the backlog from being sick is significant—and if I'm not careful, the stress and disrupted schedule can interfere with the medication plan I follow for other conditions I manage as well (including ADHD).

## 

I want to be transparent about this early because **this course is genuinely important to me**. Even though it wasn't originally in my ideal sequence, it aligns closely with my research direction in **equitable, large-scale genomic diagnostics**—where my goal is to build data-driven diagnostic tools that are both accurate and fair across diverse populations, particularly for culturally and linguistically diverse (CLD) communities.

My chronic illness resulted from years of misdiagnosis—an experience that drives my commitment to developing genomic pipelines that reduce the algorithmic biases I've seen firsthand in medical systems. BIOL550's focus on **preprocessing workflows, variant calling in heterogeneous samples, and critical evaluation of failure modes** directly informs my work on:

* **RNA biomarker discovery** (extending algorithms from prior coursework to real clinical datasets)  
* **Preprocessing fairness audits** (evaluating how QC filtering, read mapping, and normalization introduce disparate impact across ancestry groups)  
* **Variant calling in pooled/low-frequency scenarios** (detecting mutations that standard pipelines miss—analogous to how conditions like mine can be medically overlooked)

## 

I want you to know that **I am fully committed to prioritizing this course and doing the work at a high level**. I'm not reaching out to preemptively ask for special treatment—I'm reaching out to make sure I understand the right process if a health flare-up occurs and I need a short extension to recover and stay on track. In that situation, having a clear, agreed-upon procedure makes a big difference in maintaining both health and academic performance.

I have already submitted my accommodations request through the appropriate office, and I confirmed that you have received it. If possible, I'd also appreciate guidance on what you prefer in terms of communication:

* How much advance notice you'd like when accommodation might be needed  
* What information is helpful for you to have  
* How you'd like extension requests handled when medically necessary

These accommodations serve as a safety net during chronic illness flare-ups or medication transitions, allowing me to maintain focus on what matters most: rigorous research and mastering the genomic methods your course teaches.

Thank you very much for your time and understanding.

Sincerely,  
**Piter Garcia**  
I’ve included a concise log of the steps I followed and the final answers below. If possible, I’d also appreciate using office hours in the future to confirm expectations for lab submissions. Steps completed on sequoia:

**1\) Verify home directory contents and locate scav**

```shell
ls -la
```

Confirmed scav/ exists in home directory.

**2\) Enter scavenger hunt directory and identify required file**

```shell
cd scav/
ls -la
```

Observed:

* exec/ (directory)  
* readme (file)

**3\) Read instructions and extract answer (b)**

```shell
cat readme
```

Output indicates:

* b) I found the file.  
* Next step: enter exec/ and read first comment in runme.sh for (c)

**4\) Enter exec directory and locate scripts**

```shell
cd exec/
ls -la
```

Confirmed scripts present:

* runme.sh  
* runme2.sh

**5\) Read runme.sh and extract answer (c), plus instructions for (d) and (e)**

```shell
cat runme.sh
```

Found:

* c) I will run this shell script.  
* (d) will be printed when runme.sh runs  
* (e) requires running runme2.sh

**6\) Resolve execute permissions and run scripts.  Initial attempt:**

```shell
./runme.sh
```

Result: Permission denied  
Fix permissions:

```shell
chmod u+x runme.sh
chmod u+x runme2.sh
```

Run runme.sh (prints d \+ e instructions):

```shell
./runme.sh
```

Output:

* d) It worked\!  
* Instruction: run runme2.sh

Run runme2.sh:

```shell
./runme2.sh
```

Output indicates the real value for (e) is in:  
/usr/local/bin/RealAnswerToE.txt

**7\) Retrieve the final answer for (e)**

```shell
cat /usr/local/bin/RealAnswerToE.txt
```

Output:

* e) I copied the file, changed permissions, and ran this script. I rock.

**8\) vi Scavenger\_hunt\_results-Answers.txt**   
\- Entered the answers below

**9\) scp pzg8794@sequoia.rit.edu:\~/scav/exec/Scavenger\_hunt\_results-Answers.txt /Users/pitergarcia/DataScience/Semester5/BIOL550**   
\- Copied text file to my BIOL550 directory in my PC local directory

## Final Answers (a–e)

```
a) readme
b) I found the file.
c) I will run this shell script.
d) It worked!
e) I copied the file, changed permissions, and ran this script.  I rock.
```

Hello\!

You can find the syllabus online [here](http://bulgogi.rit.edu/~mosier/lab/courses/20252026/hts/).  You will also find my schedule linked there, including office hours.  Office hours will be at [this](https://rit.zoom.us/my/mvoscl) Zoom link.  The passcode for Thursday Zoom sessions, linked from the Zoom tab in this course shell, will be "hisat2".  Please keep this confidential.

If you have any questions, please let me know as soon as possible.  I tend to be very responsive to emails during the daytime.

I look forward to meeting all of you\!

Best,

Dr. Osier

# **Week 1: Next-Generation Sequencing Technology Overview**

## **Course Context**

# **BIOL550** is an advanced genomics and bioinformatics course focused on cutting-edge methods for DNA/RNA sequencing and analysis. Week 1 begins the semester-long exploration of high-throughput sequencing (HTS) technologies, setting the conceptual foundation for all subsequent weeks.

## 

## **Week 1 Learning Objectives**

# By the end of Week 1, students will be able to:

1. # **Understand the historical evolution** from Sanger sequencing to massively parallel, next-generation sequencing (NGS).

2. # **Compare major NGS platforms** (Illumina, BGI/MGI, PacBio, Oxford Nanopore) in terms of read length, accuracy, throughput, and cost per genome.

3. # **Evaluate sequencing platform suitability** for different applications (e.g., variant calling vs. de novo assembly).

4. # **Explain sequencing-by-synthesis chemistry** and how it impacts data quality and downstream analysis.

5. # **Recognize key sequencing metrics** and their biological implications (coverage depth, read pairs, GC bias).

6. # **Articulate how NGS has enabled novel applications** in genomics (whole-genome sequencing, metagenomics, single-cell RNA-seq, ancient DNA).

# 

## **Core Topics**

## **Historical Context: Sanger → NGS**

# Sanger sequencing, developed in 1977, enabled early genome projects but was labor-intensive and expensive (\~$100,000 per genome in the 2000s). Beginning around 2006–2008, NGS platforms like Illumina (Solexa), Roche (454), and others massively parallelized sequencing, enabling millions of reads per run. This exponentially reduced cost-per-genome—from $100k → $1k → $100 within a decade—and enabled high-throughput population studies, metagenomics of unculturable organisms, and RNA sequencing.

## 

## **Major NGS Platforms (Comparative Overview)**

## The course covers four primary platform families:

* # **Illumina NovaSeq** produces 50–150 bp paired-end reads with \~0.1% error rates and 6 Tb throughput per run, enabling cost-effective variant calling and large-scale RNA-seq. Its mature ecosystem of tools (GATK, TopHat, Cufflinks) and established quality standards make it the dominant platform for most genomics projects.

* # **BGI/MGI MGISEQ-2000** offers comparable accuracy (0.1%) and cost (\~$100–200 per genome) to Illumina, with 1–2 Tb throughput, representing a growing competitive option in the market.

* # **PacBio Sequel II** delivers 10–30 kb long reads with improved accuracy in HiFi mode (\~0.1–1%), enabling de novo assembly and structural variant detection. The tradeoff is higher cost (\~$1–3k per sample) but unique ability to resolve repetitive regions.

* # **Oxford Nanopore MinION** produces ultra-long reads (10–100 kb) with 5–15% raw error rates, improving to \<1% when polished. Its portability and real-time analysis capability make it valuable for field applications and rapid diagnostics, though higher per-base error rates require careful handling in variant calling.

* # **Platform suitability depends on application:** short reads excel for variant calling and large-scale RNA-seq but struggle with repeats; long reads resolve structural variation and repeat-rich regions but cost more and have higher error rates initially. Hybrid approaches (short \+ long reads) increasingly define state-of-the-art genome assemblies.

## **Sequencing-by-Synthesis Chemistry**

* # **Illumina's sequencing-by-synthesis (SBS) workflow:** DNA fragments are amplified on a flow cell via bridge amplification, creating \~1 million clusters per mm². Fluorescently tagged nucleotides are added one at a time; after each incorporation, an image captures fluorescence intensity, which is converted to a base call and quality score (Phred Q-score).

* # **Quality implications:** early cycles yield higher-confidence calls as clusters remain well-amplified, while later cycles experience degradation from phasing (asynchronous polymerization) or dephasing (signal loss), reducing quality. GC-biased regions (\>60% or \<30% GC content) often show lower coverage or quality. Understanding these dynamics is essential for data filtering and troubleshooting assembly or variant-calling results.

## **Key Sequencing Metrics**

| Metric | Significance |
| ----- | ----- |
| **Read Depth (Coverage)** | Average number of times each base is sequenced; 20–30× typical for human genomes, 100+× for sensitive variant detection. |
| **Paired-End Reads** | Two reads from opposite ends of a DNA fragment (\~300–500 bp); improves mapping accuracy and structural variant detection. |
| **Quality Score (Phred)** | Q30 \= 0.1% error, Q40 \= 0.01% error; typically retain Q ≥ 20\. |
| **N50 (Assembly Metric)** | Length of contig where 50% of bases are in sequences ≥ N50; higher N50 indicates better assembly quality. |
| **GC Content** | Identifies biases in library preparation and potential contamination. |

# 

## **Week 1 Foundational Reference**

# **Elaine Mardis (2008), *Annual Review of Genomics and Human Genetics*: "The Impact of Next-Generation Sequencing Technology on Genetics"** is the seminal paper reviewed this week. Mardis predicted that NGS would enable: (1) whole-genome sequencing in large populations; (2) RNA-seq to rival microarrays; (3) culture-independent metagenomics. These predictions proved prescient, and the course builds upon them throughout the semester. Modern extensions include long-read improvements (PacBio HiFi, Nanopore), single-cell genomics (10x Genomics), and emerging applications in spatial transcriptomics and environmental DNA metabarcoding.

# 

## **Week 1 Activities**

# **Reading Assignment:** Mardis (2008) foundational review (\~20 pages); optional platform comparison studies (2020 Illumina vs. BGI single-cell RNA-seq).

# **Conceptual Exercises:**

* # Platform suitability decision tree: Given a research question and budget, select an appropriate sequencing platform with justification.

* # Error rate and coverage tradeoffs: Compare short-read (Illumina) vs. long-read (Nanopore) approaches for variant calling vs. assembly.

# **Technical Exercise (Optional):** Download a public RNA-seq dataset, decompress FASTQ files, run FastQC to examine quality scores, read composition, and GC content; summarize findings in a 1-page report identifying any quality issues.

# 

## **Connection to Subsequent Weeks**

# Week 1's understanding of NGS platforms and data characteristics directly supports:

* # **Week 2:** Data cost trends and throughput for large projects.

* # **Week 3:** **Genome assembly** using short- and long-read data; assembly quality metrics depend on understanding Week 1 read lengths and error profiles.

* # **Week 4:** **RNA-seq** analysis, where quality scores and read characteristics inform alignment and quantification.

* # **Weeks 5+:** All specialized applications (variant calling, epigenomics, metagenomics, environmental DNA) rely on foundational concepts from Week 1\.

## 

# **References**

# Comprehensive BIOL550 Course Guide, file 25 2020 Illumina vs. BGI single-cell RNA-seq comparison, BIOL550 course materials Mardis, E. R. (2008). *Annual Review of Genomics and Human Genetics*, 9, 387–402 BIOL550 comprehensive course overview, file 25

# This Week 1 overview provides the essential foundation in next-generation sequencing technologies and is available as a downloadable markdown document (see ) for your reference and study.

# 

# **Week 1: Next-Generation Sequencing Technology Overview**

## 

## **Course Context**

BIOL550 is an advanced genomics and bioinformatics course focused on cutting-edge methods for DNA/RNA sequencing and analysis. Week 1 begins the semester-long exploration of high-throughput sequencing (HTS) technologies, setting the conceptual foundation for all subsequent weeks.

## **Week 1 Learning Objectives**

By the end of Week 1, students will be able to:

1. Understand the historical evolution from Sanger sequencing to massively parallel, next-generation sequencing (NGS).  
2. Compare major NGS platforms (Illumina, BGI/MGI, PacBio, Oxford Nanopore) in terms of:  
   * Read length  
   * Accuracy (error rates)  
   * Throughput (bases/run)  
   * Cost per genome  
3. Evaluate sequencing platform suitability for different applications (e.g., variant calling vs. de novo assembly).  
4. Explain sequencing-by-synthesis chemistry and how it impacts data quality and downstream analysis.  
5. Recognize key sequencing metrics and their biological implications (coverage depth, read pairs, GC bias, etc.).  
6. Articulate how NGS has enabled novel applications in genomics (whole-genome sequencing, metagenomics, single-cell RNA-seq, ancient DNA).

## **Core Topics**

## **1\. Historical Context: Sanger → NGS**

Background: Sanger sequencing, developed in 1977, enabled the first genome projects (e.g., *E. coli*, 1995; human genome, 2003\) but was labor-intensive and expensive (\~$100,000 per genome in 2000s).  
NGS Revolution: Starting \~2006–2008, platforms like Illumina (Solexa), Roche (454), and others massively parallelized sequencing, enabling millions of reads in a single run. This reduced cost-per-genome exponentially (from $100k → $1k → $100 within a decade) and enabled high-throughput studies of populations, environments, and disease states.

Key Insight: Cheaper, faster sequencing opened entirely new applications: metagenomics of unculturable organisms, RNA-seq without isolating individual genes, and variant calling in large cohorts.

## **2\. Major NGS Platforms (Comparative Overview)**

| Platform | Read Length | Accuracy  (Error Rate) | Throughput (Bases/Run) | Cost/Genome | Key Strength |
| :---- | :---- | :---- | :---- | :---- | :---- |
| Illumina NovaSeq | 50–150 bp  (typically paired-end) | \~0.1% | 6 Tb/run | \~$100–300 | High accuracy, established ecosystem, many tools |
| BGI/MGI MGISEQ-2000 | 50–150 bp | \~0.1% | 1–2 Tb/run | \~$100–200 | Comparable accuracy to Illumina, competitive pricing |
| PacBio Sequel II | 10–30 kb (long reads) | \~0.1–1%  (with HiFi mode) | 100–200 Gb/run | \~$1–3k | Long reads resolve repeats, structural variants |
| Oxford Nanopore MinION | 10–100 kb  (ultra-long reads) | \~5–15% (raw reads); \<1% (polished) | 1–10 Gb/run | $500–1k | Portable, real-time analysis, ultra-long molecules |
| 10x Genomics Visium (spatial RNA-seq) | Variable (captures 55–100 bp transcripts) | \~0.1% | \~100 Gb/slide | \~$500/sample | Cell-type and spatial resolution in tissues |

Interpretation Notes:

* Short reads (Illumina, BGI) excel at variant calling and large-scale RNA-seq but struggle with repeats and structural variants.  
* Long reads (PacBio, Nanopore) resolve repetitive regions and can detect long variants but are costlier per run and have higher error rates (though improving).  
* Hybrid strategies (short \+ long reads) are increasingly common for high-quality genomes.

## **3\. Sequencing-by-Synthesis (SBS) Chemistry**

**How Illumina Works:**

1. **Cluster Generation:** DNA fragments are amplified on a flow cell by bridge amplification, creating \~1 million clusters per mm².  
2. **SBS Cycles:** Nucleotides tagged with fluorescent dyes are added one at a time. After each incorporation, an image is taken, and the dye is cleaved off.  
3. **Base Calling:** Fluorescence intensity at each cycle is converted to a base call (A, C, G, T) and a quality score (Phred score, Q10–Q40+).

**Quality Implications:**

* **Early cycles (beginning of read):** higher quality, as clusters are well-amplified.  
* **Later cycles:** quality may drop due to phasing (asynchronous polymerization causing off-by-one errors) or dephasing (loss of signal over time).  
* **GC bias:** Regions with extreme GC content (\>60% or \<30%) often have lower coverage or quality.

Output: FASTQ files contain reads and per-base quality scores; downstream analysis (alignment, variant calling) relies heavily on these quality metrics.

## **4\. Foundational NGS Metrics & Concepts**

| Metric | Definition | Why It Matters |
| :---- | :---- | :---- |
| Read Depth (Coverage) | Average number of times each base is sequenced | Higher coverage → more confidence in calls; 20–30× typical for human genomes, 100+× for variant detection |
| Paired-End Reads | Two reads from opposite ends of a DNA fragment (typically 300–500 bp) | Helps span repeats, improves mapping accuracy, enables structural variant detection |
| Quality Score (Phred) | Q-score \= –10 × log₁₀(error probability). Q30 \= 0.1% error, Q40 \= 0.01% | Filters: usually keep Q ≥ 20; low-Q reads removed in QC |
| N50 (Assembly metric) | Length of longest contig/scaffold where 50% of bases are in contigs ≥ N50 | Higher N50 \= fewer, larger assembled pieces; indicates assembly quality |
| GC Content | Proportion of G+C bases | Biases in library prep and sequencing; used to identify contamination or unusual sequences |

## **5\. Key Seminal Reference & Trends**

Elaine Mardis (2008), *Annual Review of Genomics and Human Genetics*: "The Impact of Next-Generation **Sequencing Technology on Genetics"**

* Landmark review explaining why NGS was transformative.  
* Covered platforms available at that time (Illumina, 454, Applied Biosystems).  
* Highlighted applications: whole-genome sequencing, RNA-seq, ChIP-seq, metagenomics.  
* Emphasized cost trajectory: predicted further drops in $/genome, enabling population-scale studies.

**Trends Noted in 2008 (proven prescient):**

* Short reads would enable large-scale variant discovery.  
* RNA-seq would rival microarrays for gene expression.  
* Metagenomics would revolutionize microbiology (culture-independent identification).

**Modern Extension (2020s):**

* Long-read revolution: PacBio HiFi and Nanopore improving error rates; repeats and polyploids now tractable.  
* Single-cell genomics: 10x Genomics and others enable cell-type discovery at transcriptome/chromatin level.  
* Cost plateau & accessibility: High-end sequencing now accessible to smaller labs; cost of data storage becoming the bottleneck, not sequencing itself.

## 

## **6\. 2020 Case Study: Illumina vs. BGI for Single-Cell RNA-Seq**

**Study Overview:**  
A 2020 comparative study benchmarked Illumina NovaSeq vs. BGI MGISEQ-2000 on identical single-cell RNA-seq libraries, showing that MGISEQ-2000 achieves comparable data quality to established Illumina platforms.

**Key Findings:**

* Detected genes: Both platforms identified similar numbers of genes per cell (median \~1500–2000 genes/cell in lymphocytes).  
* Cell barcodes: Barcode recovery rates were similar across platforms (\~80–90%).  
* Cost-performance: MGI data was on par with Illumina in cost-per-gene-per-cell, indicating a viable competitor for high-throughput applications.  
* Implication: Multiple sequencing vendors now offer high-quality data, reducing monopoly pricing and enabling research groups to choose based on cost, logistics, or institutional partnerships.

## **Week 1 Activities & Deliverables**

## **Reading Assignment**

1. Mardis, E. R. (2008). *Annual Review of Genomics and Human Genetics*, 9, 387–402.  
   * \~20 pages; foundational but accessible overview of NGS technologies and applications.  
   * Focus on: sections on Illumina, 454, SOLiD platforms; metagenomics and transcriptomics applications.  
2. Platform Comparison Papers (optional, for deeper dive):  
   * 2020 Illumina vs. BGI single-cell study (provided in course materials).  
   * Skim the Methods & Results; focus on Table 1 (platform specifications) and Figure 3 (gene/barcode recovery).  
3. Supplementary Resources:  
   * *RNA-seqlopedia* (online guide, Week 4 material, but useful to understand downstream context).  
   * GATK Best Practices overview (will be used in Weeks 3+, but skim to understand quality/coverage implications).

## **Conceptual Exercises**

**Exercise 1: Platform Suitability Decision Tree**

* *Scenario:* You have a budget of $5,000 and want to sequence 50 bacterial genomes (each \~5 Mb) to look for SNPs and small indels.  
* *Question:* Which platform would you choose? Why?  
  * Consider: cost, read length required, turnaround time, required coverage depth.  
  * Justify in 1 paragraph.  
* *Answer sketch:* Illumina is optimal here—short reads are sufficient for variant calling, cost-per-genome is lowest, and the ecosystem (GATK, samtools) is mature.

**Exercise 2: Error Rate & Coverage Trade-Off**

* *Scenario:* Two sequencing projects produce 30× coverage of a human genome.  
  * Project A: Illumina (Q30 average, 0.1% error rate).  
  * Project B: Nanopore (Q15 average, 3% error rate, but 10 kb reads).  
* *Question:* Which would you use for de novo assembly? For variant calling?  
  * Justify in 1–2 paragraphs.  
* *Answer sketch:* For assembly, Nanopore's long reads are invaluable for resolving repeats despite higher error rates—long reads provide unique information. For variant calling, Illumina is safer because high error rates in Nanopore could lead to false variants; but modern polished long-read approaches (HiFi) are changing this.

## 

## **Technical Exercise (Hands-On – Optional but Recommended)**

**Command-Line Workshop Kickoff:**

* The course includes a command-line workshop starting January 15, 2026 (referenced in BIOL550-Notes).  
* In Week 1, students are encouraged to:  
  1. Download a small publicly available RNA-seq dataset (e.g., from GEO, \~1 Gb compressed).  
  2. Decompress the FASTQ files.  
  3. Use FastQC (or similar) to examine read quality scores, base composition, and GC content.  
  4. Summarize findings in a 1-page report: e.g., "What is the median Q-score? Are there any quality dips at cycle 70? Is GC content biased?"  
* Learning goal: Build familiarity with FASTQ format and real-world sequencing output before diving into alignment and assembly.

## **Week 1 Grading & Checkpoints**

| Deliverable | Due | Weight | Criteria |
| :---- | :---- | :---- | :---- |
| Reading Reflection (1 page) | End of Week 1 | 10% | Summarize Mardis paper's main contributions; identify 2 applications that excite you |
| Platform Suitability Exercises  (2 x 1 para) | End of Week 1 | 10% | Sound reasoning; correct identification of pros/cons for each platform |
| FastQC Report  (if attempting hands-on) | End of Week 1 | Bonus 5% | Correctly interpret QC metrics; identify any quality issues |
| Class Participation / Discussion | Ongoing | 5% | Engage in Q\&A; ask clarifying questions about NGS concepts |

Total Week 1: 25% of pre-midterm grade (assuming midterm is \~50% and final is \~50% of course).

## **Looking Ahead: How Week 1 Connects to Later Weeks**

* Week 2: Continues NGS platform overview; introduces data cost trends and throughput implications for large projects.  
* Week 3: Transitions to genome assembly, using short-read data (from Week 1\) to assemble sequences; long-read assembly also covered.  
* Week 4: RNA-seq analysis, building on understanding of sequencing quality and read characteristics.  
* Weeks 5+: Specialized applications (RNA structure, metagenomics, epigenomics, etc.) all depend on grasping Week 1's foundational concepts.

## **Common Misconceptions to Avoid**

1. **"Longer reads are always better."**  
   * False. Long reads are great for assembly and structural variants but cost more per base. For variant calling in well-assembled genomes, short reads are more cost-effective.  
2. **"Higher coverage is always better."**  
   * Diminishing returns. 30× is adequate for SNP calling; beyond 100–200× provides little additional sensitivity and wastes resources.  
3. **"All Q30 bases are equally reliable."**  
   * False. A Q30 base called at cycle 5 (early) is more trustworthy than a Q30 base at cycle 100 (late), due to phasing/dephasing effects.  
4. **"Sequencing error is the only source of uncertainty."**  
   * False. Library prep bias (PCR, adapter), alignment errors, and reference bias also introduce uncertainty.

## **Key Takeaways (Summary)**

* NGS revolutionized genomics by reducing cost \~1000-fold and enabling large-scale population studies.  
* Multiple platforms exist, each with trade-offs; choice depends on application, budget, and desired outcome.  
* Sequencing metrics (coverage, quality scores, read length) are critical for interpreting results and troubleshooting.  
* Foundation for the semester: Understanding how sequencing data are generated is essential for all downstream analysis (assembly, variant calling, RNA-seq, metagenomics).

## 

## **Resources & Further Reading**

**Foundational Papers:**

* Mardis, E. R. (2008). Next-generation DNA sequencing methods. *Annu. Rev. Genomics Hum. Genet.* 9, 387–402.  
* Schadt, E. E., Turner, S., & Kasarskis, A. (2010). A window into third-generation sequencing. *Hum. Mol. Genet.* 19, R227–R240.

**Platform Reviews (Optional, for specific platform deep-dives):**

* Illumina documentation:   
* [https://www.illumina.com/technology/sequencing.html](https://www.illumina.com/technology/sequencing.html)  
* Oxford Nanopore:   
* [https://nanoporetech.com/](https://nanoporetech.com/)  
* PacBio:   
* [https://www.pacb.com/](https://www.pacb.com/)

**Data Quality & Format:**

* FASTQ Format Guide:   
* [https://en.wikipedia.org/wiki/FASTQ\_format](https://en.wikipedia.org/wiki/FASTQ_format)  
* FastQC Documentation:   
* [https://www.bioinformatics.babraham.ac.uk/projects/fastqc/](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)

## **Questions & Next Steps**

If you have questions about Week 1 concepts:

* Post on the course discussion forum (myCourses).  
* Attend office hours (check the Open Advising / Walk-In Hours schedule).  
* Reach out to the TAs during the command-line workshop.

**Prepare for Week 2:**

* Consolidate your understanding of NGS platforms.  
* Start thinking about applications of interest (variant calling? assembly? metagenomics?).  
* Begin the FastQC hands-on exercise if you haven't already.

**Optional Pre-Week-2 Reading:**

* First few pages of a genome assembly paper (Week 3 material) to get a sense of how short-read data is used downstream.

## **Document Information**

| Attribute | Value |
| :---- | :---- |
| Course | BIOL550: High-Throughput Sequencing Analysis |
| Week | 1 |
| Academic Term | Spring 2026 |
| Instructor | \[As listed in course syllabus\] |
| Created | January 28, 2026 |
| Format | Markdown (.md) / Downloadable as PDF or DOCX |

# **Week 1: Comprehensive Readings Overview – Aligned with Your Spring 2026 Academic Plan**

## **Discussion Prompts & Reflection Questions**

The document includes **three detailed reflection prompts**:

## **Prompt 1: Platform Choice**

*Scenario:* Design variant discovery in 1,000 individuals with a $100k budget.  
*Question:* Which platform? Coverage depth? Tradeoffs?

## **Prompt 2: Quality Score Interpretation**

*Scenario:* FASTQ shows Q30–Q40 at cycles 5–50 but Q20–Q25 at cycles 80–150.  
*Question:* What do you conclude? What action?

## **Prompt 3: RNA-Seq vs. Microarrays**

*Question:* Why is NGS transformative for transcriptomics? Compare advantages & disadvantages.

## **Resources & Next Steps**

## **To Access This Document**

The comprehensive readings guide is saved as  and can be downloaded in markdown format, then converted to PDF or DOCX via any markdown editor (or your word processor).

## **Required Readings for Week 1**

* **Mardis, E. R. (2008).** *Annual Review of Genomics and Human Genetics*, 9, 387–402  
  * \~20 pages; 2–3 hours careful reading  
  * Focus on platform comparison table, SBS chemistry, and applications sections

## **Recommended Before Week 2**

* Complete the **7-day reading schedule** above  
* Attend Thursday Zoom workshop (9:30–11:20 AM) for real-time Q\&A  
* Write a 1-paragraph reflection on a hypothetical platform choice  
* Create a **Platform Comparison Table** as study notes

## **How This Aligns with Your Academic Plan**

* **Monday/Wednesday/Friday teaching** at Pine Brook: document provides time-efficient reading schedule  
* **Sunday deadlines** (BIOL650 lab reports due): reading is front-loaded to Mon–Thu  
* **DSCI601 integration**: understanding NGS platforms in Week 1 enables intelligent feature selection (expression, variants, methylation) for fairness audits in weeks 7–12

## **Summary**

This comprehensive readings overview provides:

1. **Detailed analysis** of Mardis (2008)—the primary Week 1 text  
2. **Historical context** (Sanger → NGS) and modern extensions (long reads, cost trends)  
3. **Platform specifications** with comparison tables and tradeoff analysis  
4. **Sequencing chemistry** explanation (why quality degrades over read length)  
5. **Five major applications** with motivation and impact  
6. **Time management guide** integrated with your teaching schedule  
7. **Discussion prompts** for reflection and class engagement  
8. **Integration with your BIOL550/DSCI601 project** (Week 3 dataset selection, feature engineering)

The document is designed as a **study companion** and **reference guide** for Week 1 and beyond, supporting your role as a graduate student balancing field placement (Pine Brook), advanced coursework (RIT \+ UofR), and research synthesis (BIOL550/DSCI601 pipeline for equity-focused bioinformatics).

# **Week 1 Comprehensive Readings Overview**

## **Aligned with Course Syllabus & Spring 2026 Academic Plan**

## **Week 1 Reading Assignment Overview**

## **Primary Reading: Mardis (2008)**

* **Citation:** Mardis, E. R. (2008). "The Impact of Next-Generation Sequencing Technology on Genetics." *Annual Review of Genomics and Human Genetics*, 9, 387–402.  
* **What It Is:** A seminal, comprehensive review by Elaine Mardis (one of the key figures in NGS development) that captures the state of sequencing technology circa 2008 and articulates why NGS is transformative for genomics.  
* **Length:** \~20 pages (including figures and references)  
* **Reading Difficulty:** Intermediate (accessible to graduate students; assumes basic molecular biology background)  
  Time to Read: 2–3 hours carefully; 1 hour skimming with focus on key sections

## **Detailed Section-by-Section Breakdown**

## **Part 1: Historical Context (Introduction)**

Mardis begins with the Sanger-to-NGS paradigm shift:

* Sanger sequencing (1977): Enabled the Human Genome Project but was slow, expensive (\~$100k per genome in 2000s), and required manual interpretation  
* NGS platforms (2006–2008): Illumina (Solexa), Roche (454), Applied Biosystems (SOLiD), and others enabled massively parallel sequencing—millions of reads per run  
* Cost trajectory: Exponential decline from $100k → $10k → $1k per genome, opening population-scale studies

**Why This Matters for Week 1:**  
You will learn the motivation behind NGS adoption and appreciate why understanding multiple platforms is critical. The paper contextualizes Week 1's platform comparisons within a historical narrative.  
**Key Insight:**  
The shift from serial (Sanger) to parallel (NGS) sequencing did not just reduce cost—it fundamentally changed what research questions could be answered. You can now sequence entire populations, not just reference genomes.

## **Part 2: Platform Comparison (Main Section)**

Mardis compares three major platforms available in 2008:

## **1\. Illumina (Solexa)**

* Read Length: 35–50 bp (short reads)  
* Throughput: \~1–2 Gb per run  
* Error Rate: \~0.1% (low)  
* Chemistry: Sequencing-by-synthesis (SBS) with fluorescently tagged nucleotides  
* Strength: High accuracy, massive throughput, established software ecosystem  
* Limitation: Short reads struggle with repeats and structural variants

## **2\. Roche 454 FLX**

* Read Length: 200–400 bp (longer than Illumina)  
* Throughput: \~400 Mb per run (lower than Illumina)  
* Error Rate: \~0.1% (low)  
* Chemistry: Pyrosequencing (light emission per base incorporation)  
* Strength: Longer reads help with repeats; good for small genomes and de novo assembly  
* Limitation: Lower throughput; higher cost per base

## **3\. Applied Biosystems SOLiD**

* Read Length: 35–50 bp (short)  
* Throughput: \~2–4 Gb per run  
* Error Rate: Very low (\~0.001%) due to color-space encoding  
* Chemistry: Oligonucleotide ligation and detection (unusual approach)  
* Strength: Extreme accuracy for variant detection  
* Limitation: Complex data format; smaller user base; discontinued by 2012

**Comparison Table in Mardis (2008):**

| Platform | Read Length | Throughput/Run | Error Rate | Cost/Genome |
| :---- | :---- | :---- | :---- | :---- |
| Illumina | 35–50 bp | 1–2 Gb | 0.1% | \~$50k–100k |
| 454 FLX | 200–400 bp | \~400 Mb | 0.1% | \~$100k–200k |
| SOLiD | 35–50 bp | 2–4 Gb | 0.001% | \~$100k |

**Why This Section Is Critical for BIOL550:**  
In Weeks 3–14, you will work with real datasets from Illumina, and you will encounter discussions of read length, coverage, and sequencing error. This comparison grounds your understanding of *why* we choose certain platforms for certain applications (short reads for variants, longer reads for assembly).  
**Key Insight:**  
There is no "best" platform—only "best for your question." An assembler needs longer reads; a variant caller needs high accuracy.

## **Part 3: Sequencing-by-Synthesis Chemistry**

Mardis explains the biochemistry behind Illumina SBS:

1. **Cluster Generation:** DNA fragments are amplified on a flow cell using bridge amplification, creating \~1 million clusters per mm²  
2. **SBS Cycles:** Four labeled nucleotides (A, C, G, T) are added one at a time; after each cycle, a camera image captures fluorescence  
3. **Base Calling:** Intensity values are converted to base calls (A, C, G, T) and quality scores (Phred Q-scores, Q10–Q40+)  
4. **Quality Degradation:** Later cycles experience "phasing" (loss of synchronization) and "dephasing" (signal decay), reducing quality

**Mathematical Detail:**

* Phred Q-score: Q \= –10 × log₁₀(error probability)  
  * Q10 \= 10% error  
  * Q20 \= 1% error  
  * Q30 \= 0.1% error (standard threshold for "high-quality")  
  * Q40 \= 0.01% error

**Why This Section Matters:**  
When you perform quality control (QC) on FASTQ files in Week 1–2 hands-on exercises, you will see quality curves that show degradation over read length. Understanding *why* (phasing/dephasing) prevents misinterpretation.  
**Key Insight:**  
A Q30 base called at cycle 10 is more trustworthy than a Q30 base at cycle 80, because early cycles have less phasing error.

## **Part 4: Applications & Impact (Results & Discussion)**

Mardis highlights how NGS is already transforming genomics:

## **A. Whole-Genome Sequencing (WGS)**

* Enables personal genomics and population studies (e.g., 1000 Genomes Project, in progress in 2008\)  
* Variant discovery at scale: SNPs, indels, structural variants  
* Challenges: repeat regions, coverage gaps, computational burden

## **B. RNA-Seq (Transcriptomics)**

* Unlike microarrays, RNA-seq detects novel transcripts, isoforms, and non-polyadenylated RNAs  
* Dynamic range: from very low to very high expression (vs. microarray compression)  
* Single-nucleotide resolution: can detect strand-specific transcription, SNPs in RNA

## **C. Metagenomics**

* Sequence environmental samples (soil, water, human microbiome) without culturing  
* Identify species composition and functional potential  
* Challenges: database dependency, contamination assessment

## **D. ChIP-Seq (Chromatin Immunoprecipitation)**

* NGS enables genome-wide mapping of transcription factor binding sites  
* Single-base resolution vs. microarray-based ChIP

## **E. Ancient DNA & Paleogenomics**

* Short, damaged DNA fragments are ideal for short-read sequencing  
* Enables reconstruction of extinct species genomes and evolutionary relationships

**Why These Applications Matter to Your Work:**  
In weeks 4–14, you will deep-dive into RNA-seq, metagenomics, and variant calling. This section of Mardis provides the "why"—the biological and methodological motivation for each application.  
**Key Insight:**  
NGS didn't just make sequencing faster/cheaper; it enabled *new types of experiments* that were impossible before (metagenomics, RNA-seq without PCR, single-cell seq).

## **Part 5: Cost Trends & Future Directions**

Mardis projects forward (2008 predictions):

| Prediction | Outcome (2026 status) |
| :---- | :---- |
| Cost will drop to $1k per genome | ✓ Accurate—achieved by \~2015 |
| Longer reads will be possible | ✓ Accurate—PacBio HiFi, Nanopore now routine |
| Errors will improve | ✓ Accurate—HiFi now achieves 0.1% error on long reads |
| Applications will diversify | ✓ Accurate—single-cell, spatial, epigenomics, etc. |
| Computational bottlenecks will shift | ✓ Accurate—sequencing cost now negligible; storage/compute rate-limiting |

**Implications for 2026 & Your Research:**  
The Spring 2026 sequencing landscape includes long-read platforms (PacBio Sequel II, Oxford Nanopore) that were nascent in 2008\. Your course will cover hybrid short \+ long-read strategies, reflecting this evolution.

**Key Insight:**  
Mardis's 2008 predictions were largely accurate, which gives confidence to her stated vision: genomics is becoming a data science problem, not just a wet-lab problem.

## 

## **Secondary/Supplementary Materials (Optional for Week 1\)**

## **1\. BIOL550 Course Slides: "HTS Week 1 and 2 Tech Analysis"**

* **Location:** myCourses BIOL550 (instructor Michael Osier)  
* **Content:** PowerPoint slides covering platform specifications, sequencing metrics (reads, coverage, paired-ends), and early case studies  
* **Use:** Provides visual aids (platform diagrams, quality score distributions) to complement Mardis's text

## **2\. 2020 Platform Comparison Study (Illumina NovaSeq vs. BGI/MGI)**

* **Context:** An optional deeper-dive, referenced in the BIOL550 Comprehensive Course Guide, comparing state-of-the-art Illumina and BGI sequencers on single-cell RNA-seq libraries  
* **Key Finding:** MGISEQ-2000 (BGI's platform) achieves comparable data quality to Illumina NovaSeq—indicating market competition and multiple viable vendors  
* **Why Relevant:** Modernizes Mardis (2008) platform comparison to 2020–2026 context  
* **Reading Level:** Intermediate (peer-reviewed journal paper with methods/results tables)  
  **Time to Read:** 45 minutes (focus on Methods, Results summary table, and Conclusions)

## **3\. RNA-Seqlopedia (Online Guide)**

* **URL:** Provided by instructor (referenced in course materials for Week 4, but useful context for Week 1\)  
* **Content:** Step-by-step overview of RNA-seq from experimental design through analysis  
* **Why Useful for Week 1:** Explains how sequencing technology choices (read length, depth, paired-end) cascade into downstream decisions

## **Week 1 Reading Schedule & Time Management**

## **Recommended Pacing (for 7-day week)**

| Day | Task | Time | Notes |
| :---- | :---- | :---- | :---- |
| Monday | Skim Mardis intro & platform comparison sections | 1 hr | Class 11:00 AM; read after class or early morning before |
| Tuesday | Read Mardis SBS chemistry & applications in depth | 1.5 hr | Deepest reading day; focus & highlights |
| Wednesday | Review Mardis cost trends; skim slides | 1 hr | Class 11:00 AM; consolidate understanding |
| Thursday | Zoom workshop 9:30–11:20 AM; optional: start 2020 platform paper | 1.5 hr | Use Zoom time for real-time Q\&A on readings |
| Friday | Finish optional 2020 paper if interested; prepare reflection | 1 hr | Lighter day (only teaching; finish early) |
| Saturday | Coursework for other classes (DSCI601, ED452B) | — | BIOL550 reading mostly done |
| Sunday | Prepare Week 1 reflection & first lab report (if assigned) | 2 hr | Start drafting responses to discussion questions |

Total Reading Time (Core): \~5 hours for Mardis (2008)  
Total Time (with Optional Materials): \~7 hours

## **Week 1 Learning Outcomes (What You Should Know After Readings)**

After completing Week 1 readings and class, you should be able to:

1. Explain the historical shift from Sanger to NGS and why it matters  
2. Compare three major sequencing platforms (read length, accuracy, throughput, cost) and describe use cases for each  
3. Describe sequencing-by-synthesis chemistry at a conceptual level (cluster generation, base incorporation, quality scoring)  
4. Articulate the Phred Q-score scale and its biological interpretation  
5. List five major NGS applications (WGS, RNA-seq, metagenomics, ChIP-seq, ancient DNA) and their advantages over pre-NGS methods  
6. Discuss cost trends and how they enable new research  
7. Evaluate a sequencing platform choice for a hypothetical research question (e.g., "We want to assemble a plant genome with repeats—Illumina or 454?")

## 

## **Integration with Your Spring 2026 Academic Plan**

## 

## **How Week 1 Supports Your BIOL550/DSCI601 Project**

**According to your Strategic Integration Plan:**

* **Weeks 1–2 (BIOL550):** Finalize dataset and preprocessing pipeline  
* **Input to DSCI601:** Feature tables (expression, variants, methylation) derived from BIOL550  
* **Reuse Strategy:** BIOL550 RNA-seq outputs → DSCI601 ML models for fairness-aware biomarker discovery

**Week 1's Role:** Understanding NGS platform choices in Week 1 directly impacts your decision in Week 3 (project selection).   
**For example:**

* If you choose a cancer RNA-seq dataset, you need to know if short reads (Illumina) or long reads (Nanopore) were used  
* If you choose genomic variants, you need to understand depth and error tradeoffs in variant calling

**Takeaway:**  
Week 1 is the foundation layer. Your Week 3–16 bioinformatics pipeline, and your DSCI601 fairness audits, all rest on this foundation.

## **Recommended Annotation & Note-Taking Strategy**

## **While Reading Mardis (2008), Track:**

1. Platform Specifications Table (create a side table):  
   * For each platform: read length, throughput, error rate, cost, best use case  
2. Key Concepts:  
   * SBS chemistry: cluster generation → base calls → Q-scores  
   * Phasing/dephasing: why quality drops over read length  
   * Applications & motivations: why NGS transformed X field  
3. Questions for Instructors:  
   * "Which platform will our BIOL550 datasets use?"  
   * "Why doesn't the syllabus mention PacBio or Nanopore?" (Likely: 2008 paper precedes their maturity)  
   * "How does platform choice affect the variant calling methods in Week 11?"

## **Resources & Links**

| Resource | Type | Link / Source |
| :---- | :---- | :---- |
| Mardis (2008) full text | Journal paper | *Annual Review of Genomics and Human Genetics*, 9, 387–402 |
| BIOL550 course page | myCourses | myCourses BIOL550 (Michael Osier) |
| FastQC documentation | Tool manual | [https://www.bioinformatics.babraham.ac.uk/projects/fastqc/](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) |
| Illumina platform specs | Vendor | [https://www.illumina.com/systems/sequencing-platforms.html](https://www.illumina.com/systems/sequencing-platforms.html) |
| Oxford Nanopore tech overview | Vendor | [https://nanoporetech.com/](https://nanoporetech.com/) |
| PacBio specifications | Vendor | [https://www.pacb.com/](https://www.pacb.com/) |

## 

## **Summary Table: Week 1 Readings at a Glance**

| Reading | Author | Year | Length | Difficulty | Time | Key Takeaway |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| Mardis review | Elaine Mardis | 2008 | \~20 pp | Intermediate | 2–3 hr | NGS platforms revolutionize genomics; cost/speed tradeoffs define platform choice |
| 2020 Platform comparison | (Modern) | 2020 | \~15 pp | Intermediate | 45 min | Illumina and BGI now comparable; market has matured |
| BIOL550 slides | Michael Osier | 2026 | \~30 slides | Beginner | 1 hr | Visual complement to Mardis; sequencing metrics |
| RNA-seqlopedia | (Online) | Ongoing | \~20 pp | Intermediate | 1.5 hr | Contextualizes sequencing in RNA-seq workflow (preview of Week 4\) |

## **Final Checklist: Before Week 2**

*  Read Mardis (2008) carefully; highlight key platform comparisons  
*  Create a Platform Comparison Table with specs for Illumina, 454, SOLiD  
*  Understand Phred Q-score formula and what Q30 means  
*  List five major NGS applications with brief motivation for each  
*  Watch BIOL550 Week 1 slides (during or after class)  
*  (Optional) Skim 2020 platform comparison paper for modern context  
*  Write a 1-paragraph reflection on which sequencing platform you'd choose for a hypothetical research question  
*  Attend Thursday Zoom workshop (9:30–11:20 AM) and ask 1–2 clarification questions

## 

## **Document Information**

| Field | Details |
| :---- | :---- |
| Course | BIOL550: High-Throughput Sequencing Analysis (RIT) |
| Week | 1 (Jan 20–26, 2026\) |
| Context | Spring 2026 MS Data Science \+ PhD Bridge Program |
| Author | Academic Planning & Course Integration |
| Created | January 28, 2026 |
| Format | Markdown (.md) → Downloadable as PDF/DOCX |
| Alignment | Spring 2026 Strategic Integration Plan |

## **How to Use This Document**

1. Before Class: Review the "Week 1 Reading Assignment Overview" section  
2. While Reading Mardis: Use "Detailed Section-by-Section Breakdown" as a guide  
3. After Reading: Complete the "Final Checklist" and prepare reflection  
4. In Class: Use discussion prompts to engage with classmates and instructor  
5. For Reference: Keep this document handy for Weeks 2–3 when topics build on NGS platforms

This comprehensive overview aligns with your BIOL550 syllabus, the course's comprehensive guide, and your Spring 2026 academic plan, ensuring that Week 1 readings serve as a strong foundation for your integrated bioinformatics research across BIOL550 and DSCI601.

# **Week 2 Material Overview: Comprehensive Overview**

**Week 2 is the second part of a unified "Weeks 1–2" platform analysis unit**, deepening Week 1's foundational concepts with real-world economics, hands-on quality control tools (FastQC), and practical platform selection scenarios.

**Content Structure:**

* Week 1–2 unified unit context (same lecture slides, complementary focus)  
* 7 explicit Week 2 learning outcomes  
* Evaluation of platform economics (cost trajectory 2008–2026)  
* Real-world 2020 Illumina vs. BGI platform performance comparison  
* FastQC quality control tool introduction and interpretation  
* Platform selection decision frameworks with 3 realistic scenarios  
* Grading structure and specific Week 2 deliverables

**Practical Features:**

* **Cost Trajectory Table:** $100k/genome (2008) → $100 (2026); validates Mardis predictions  
* **Platform Performance Comparison:** 2020 study showing functional equivalence (genes detected, error rates, cost parity)  
* **Real-World Scenarios:** Platform selection for population SNV studies, genome assembly, field diagnostics  
* **FastQC Interpretation Guide:** Per-base quality, cycle degradation, contamination detection  
* **Platform Selection Decision Tree:** 4-question framework for choosing appropriate platform  
* **Fairness Integration:** Infrastructure bias, accessibility, cost disparity, ancestry representation  
* **BIO630/ISTE780/IDAI700 Connections:** How platform choice cascades into assembly algorithms and fairness audits

## 

## **2\. Week 2 Learning Outcomes (7 Total)**

| \# | Outcome | Spring 2026 Application |
| ----- | ----- | ----- |
| 1 | Evaluate platform economics & cost trends | Understand why sequencing is now affordable; enables large-scale studies |
| 2 | Compare 2020 platform performance (Illumina vs. BGI) | Recognize that multiple vendors competitive; no single "best" platform |
| 3 | Use FastQC for raw data quality analysis | Hands-on skill for interpreting real sequencing runs |
| 4 | Make data-driven platform decisions | Scenario-based problem solving for your project context |
| 5 | Recognize fairness implications | Infrastructure bias; who benefits from cheaper sequencing? |
| 6 | Understand platform-algorithm coupling | Short reads → de Bruijn graphs (Week 3); long reads → OLC |
| 7 | Connect to Week 3 assembly | Platform choice determines algorithmic feasibility |

## **Week 2 Core Content Highlights**

## **1\. Platform Economics: 2008 Predictions → 2026 Reality**

**Mardis (2008) Prediction:** Cost will drop exponentially.  
**2026 Reality:** FULLY REALIZED

| Year | $/Genome | Sequencer Cost | Read Output |
| ----- | ----- | ----- | ----- |
| 2008 | $100,000 | $500k–$1M | 1–2 Gb/run |
| 2015 | $1,000 | $125k | 400–600 Gb/run |
| 2026 | $100–300 | $100k | 1–6 Tb/run |

**Implications:**

* A human genome dropped from $100k → $100 in \~18 years  
* Cost reduction enabled population-scale genomics (1000 Genomes, GTEx)  
* **Bottleneck shifted:** Sequencing cost → computational interpretation  
* Multiple vendors now competitive; era of Illumina near-monopoly fading

**Fairness Angle:**

* Who benefits from cost drop? Primarily developed countries with research infrastructure  
* Developing regions adopting NGS later; may use older platforms  
* Public sequencing datasets skew toward Illumina \+ Western-biased samples

## **2\. Real-World Platform Performance (2020 Study)**

**Study Design:** Illumina NovaSeq vs. BGI MGISEQ-2000 using identical single-cell RNA-seq libraries (10x Genomics)

**Key Findings:**

| Metric | Illumina | BGI | Result |
| ----- | ----- | ----- | ----- |
| Genes/cell detected | 3,000 median | 2,950 median | **\~1% difference** |
| Barcodes (multiplexing) | 96–384 | 96–384 | **Equivalent** |
| Sequencing depth | 50k–100k reads/cell | 50k–100k reads/cell | **Equivalent** |
| Error rate | 0.1% | 0.1% | **Equivalent** |
| Cost/run | Higher (premium) | \~20–30% cheaper | **BGI advantage** |

**What This Teaches:**

* Platform choice is no longer "which is best?" but "which fits my constraints?"  
* By 2020, multiple vendors achieved **functional equivalence** for mainstream applications  
* Cost pressure from BGI forced Illumina to justify premium (ecosystem, reputation, support)

## **3\. Platform Selection Framework (Scenario-Based)**

**Three Real Scenarios:**

## **Scenario 1: Population Variant Discovery (1,000 individuals, $150k budget)**

* **Choice:** Illumina 30× WGS or BGI equivalent  
* **Cost:** \~$150/genome  
* **Tradeoff:** Miss structural variants; enable population-scale SNV discovery  
* **Historical Context:** In 2008, this would have been impossible ($100M budget needed)

## **Scenario 2: De Novo Genome Assembly (Single organism, $10k budget)**

* **Choice:** PacBio HiFi (15 kb reads) or Nanopore (50+ kb reads)  
* **Cost:** \~$10k total  
* **Tradeoff:** Higher per-run cost, but long reads solve repeat problem that destroys short-read assemblies  
* **Why Not Illumina?:** Would produce fragmented draft with gaps at repetitive regions

## **Scenario 3: Field Diagnostics (Developing Region, Rapid Results)**

* **Choice:** Nanopore MinION (handheld device)  
* **Cost:** $200–500/device \+ per-run costs  
* **Tradeoff:** Higher per-base error; mitigated by consensus basecalling  
* **Advantage:** Portability enables deployment in resource-limited settings (real clinical relevance)

## **4\. FastQC Tool Introduction (Hands-On)**

**What FastQC Analyzes:**

1. **Per-base quality score distribution**  
2. **Quality by cycle** (phasing/dephasing degradation pattern)  
3. **Per-base nucleotide content** (contamination detection)  
4. **GC content distribution** (bias or artifact identification)  
5. **Adapter contamination** (residual sequencing oligonucleotides)  
6. **Duplicate reads** (PCR bias indicator)  
7. **Overrepresented sequences** (polyA, contaminants)  
8. **Example FastQC Output Interpretation:**  
   Cycles 1–50:    Q30–40 (green zone)     ✓ Excellent  
   Cycles 51–100:  Q20–25 (yellow zone)    ⚠ Acceptable (expected)  
   Cycles 101–150: Q15–20 (red zone)       ⚠ Consider trimming

**Action:** Trim reads to cycle 100–120 to retain high-confidence bases.

# **Week 2 Material Overview**

## **Advanced NGS Platforms & Cost-Performance Analysis (Continuing Weeks 1–2 Content)**

## 

## **Following Academic Plan for Spring 2026**

## 

## **Document Purpose**

This document provides a comprehensive Week 2 material overview for BIOL550 (High Throughput Sequencing Analysis), continuing the Weeks 1–2 combined platform and cost analysis unit. Week 2 deepens Week 1 concepts by examining real-world platform selection tradeoffs, cost trends from 2008–2026, hands-on data quality analysis (FastQC), and integration with your DSCI601 \+ BIOL550 fairness-aware project.  
Format: Markdown (.md) | Downloadable as PDF or DOCX

Total Reading Time: 4–5 hours (shorter than Week 1; focus is on consolidation \+ tools)

## **Course Context: Weeks 1–2 as Unified Unit**

| Aspect | Week 1 | Week 2 |
| :---- | :---- | :---- |
| Focus | Platform fundamentals; SBS chemistry | Platform economics; real-world tradeoffs; hands-on QC |
| Learning Arc | "What exists and why?" | "How to choose? What are the costs and limits?" |
| Lecture | Mon 11:00, Wed 11:00, Thu 9:30 Zoom (same slides as W1) | Same schedule; continued platform discussion |
| Materials | Mardis (2008) seminal review | Optional 2020 Illumina vs. BGI study \+ FastQC tutorial |
| Deliverables | Lab report (reflection on platforms) | Lab report (platform choice analysis \+ FastQC interpretation) |

Instructor Note: Weeks 1–2 use the same lecture slides ("HTS Week 1 and 2 Tech Analysis"); content scaffolds from foundational concepts → application-driven decisions.

## **Week 2 Learning Outcomes**

By the end of Week 2, students will:

1. Evaluate platform economics (cost per genome, cost per base, time-to-result) and understand cost trends from 2008–2026  
2. Compare real-world platform performance using the 2020 Illumina NovaSeq vs. BGI MGISEQ single-cell RNA-seq study  
3. Use FastQC to analyze raw sequencing data and interpret quality metrics (per-base Q-scores, quality by cycle, base composition)  
4. Make data-driven platform decisions for specific research scenarios (balancing cost, read length, accuracy, turnaround time)  
5. Recognize fairness implications of platform choice (which platforms better serve underrepresented populations?)  
6. Understand when each platform is appropriate (short-read SNV calling vs. long-read assembly vs. portable field diagnostics)  
7. Connect Week 2 to Week 3 (assembly algorithms depend on read length/quality from Week 2 platform choice)

## **Week 2 Required Materials**

## **Primary Reading (Recommended, Not Required)**

2020 Platform Comparison Study – "Illumina NovaSeq vs. BGI MGISEQ for Single-Cell RNA-Seq"

| Attribute | Details |
| :---- | :---- |
| Type | Peer-reviewed platform performance study |
| Length | \~12–15 pages (shorter than Mardis; focused comparison) |
| Difficulty | Intermediate (practical; fewer theory sections) |
| Time to Read | 45 minutes – 1 hour |
| Availability | Referenced in BIOL550 syllabus; check myCourses or RIT library |
| Why This Paper | Modernizes Mardis (2008); shows that multiple vendors now produce equivalent quality; demonstrates current cost parity |
| Key Finding | MGISEQ-2000 detected comparable genes and barcodes to Illumina NovaSeq for single-cell libraries, suggesting vendor consolidation hasn't reduced platform options |

## 

## **Lecture Materials (Provided by Instructor)**

Slides: "HTS Week 1 and 2 Tech Analysis" (same as Week 1; continued discussion)

| Attribute | Details |
| :---- | :---- |
| Format | PowerPoint slides (available on myCourses) |
| Content | Extended platform economics, cost curves, performance benchmarks, case studies |
| Use | Reference during class; key figures show cost trajectories |
| Timing | Available by Monday, Jan 27 (Week 2 continuation) |

## **Hands-On Tools & Tutorials (Optional but Recommended)**

FastQC Quality Control Tool

| Tool | Purpose | Time |
| :---- | :---- | :---- |
| FastQC v0.11.9+ | Interpret raw FASTQ quality metrics | 30–45 min to learn |
| Available at: | [https://www.bioinformatics.babraham.ac.uk/projects/fastqc/](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) | Free; command-line or GUI |
| What to Learn | Per-base quality scores, quality by cycle, base composition, adapter contamination | Directly applies Week 2 concepts |
| Example Dataset | Instructor may provide sample FASTQ file (from Week 1 real sequencing run) | Practice on actual data |

## **Week 2 Core Content: Detailed Breakdown**

## **Part 1: NGS Platform Economics (2008 → 2026 Reality Check)**

The Cost Curve: From Thousands to Hundreds  
Mardis (2008) predicted: Cost will drop exponentially. By 2026, this prediction has been fully realized:

| Year | $/Genome (Illumina) | Sequencer Cost | Read Output | Event |
| :---- | :---- | :---- | :---- | :---- |
| 2008 | $100,000 | $500k–$1M | 1–2 Gb/run | Mardis paper; NGS nascent |
| 2012 | $4,000 | $200k | 100–200 Gb/run | HiSeq emergence |
| 2015 | $1,000 | $125k | 400–600 Gb/run | NovaSeq development begins |
| 2020 | $300 | $100k | 2–4 Tb/run | NovaSeq mainstream |
| 2024–2026 | $100–300 | $100k+ | 1–6 Tb/run | Current pricing; BGI competitive |

**What This Means:**

* A human genome went from $100k (2008) → $100 (2026) in \~18 years  
* Cost reduction enabled population-scale studies (1000 Genomes, GTEx, etc.)  
* Bottleneck shifted from sequencing cost → computational storage and interpretation  
* Multiple vendors (Illumina, BGI, not to mention PacBio, Nanopore) now competitive

**Fairness Implication:**  
Lower costs mean more labs globally can perform sequencing. However, who benefits from the cost drop? Developed countries with research infrastructure adopted NGS earlier and built expertise. Developing regions are catching up but may be over-represented by older, cheaper platforms or underfunded.

## **Part 2: Real-World Platform Performance (2020 Study)**

Study Design: 2020 benchmark comparing Illumina NovaSeq and BGI MGISEQ-2000 using identical single-cell RNA-seq libraries (10x Genomics standard).

**Key Findings:**

| Metric | Illumina NovaSeq | BGI MGISEQ-2000 | Conclusion |
| :---- | :---- | :---- | :---- |
| Genes per cell detected | Median 3,000 | Median 2,950 | Comparable (\~1% difference) |
| Barcodes per cell (multiplexing) | \~96–384 | \~96–384 | Same |
| Sequencing depth | 50k–100k reads/cell | 50k–100k reads/cell | Equivalent |
| Cost per run | Higher (Illumina premium) | \~20–30% cheaper | BGI advantage |
| Turnaround time | 1–2 days | Similar | Parity |
| Error rate | 0.1% | 0.1% | Equivalent |

**What This Study Teaches:**

1. Market Shift: By 2020, multiple vendors achieved functional equivalence for mainstream applications (RNA-seq)  
2. Cost Pressure: BGI's competitive pricing forced Illumina to justify premium (reputation, software ecosystem)  
3. Application-Dependent: For RNA-seq, either platform works. For niche applications (ancient DNA, ultra-high accuracy), platforms differ more  
4. Vendor Consolidation Risk: Over-reliance on one vendor (Illumina) has decreased; now labs have real options

## **Part 3: Cost-Benefit Analysis Across Platforms (Real Scenarios)**

Scenario 1: Population Variant Discovery (1,000 individuals, $150k budget)

| Platform | Coverage | Total Cost | $/Genome | Pros | Cons |
| :---- | :---- | :---- | :---- | :---- | :---- |
| Illumina 30× | 30× WGS | $150k (\~$150/ind) | $150 | High accuracy; reference genome ecosystem | Structural variants missed |
| BGI 20× | 20× WGS | $150k (\~$150/ind) | $150 | Cost parity; competitive | Slightly lower coverage per person |
| PacBio 20× | 20× CLR | $200k (over budget) | $200 | Structural variants captured | Cost prohibitive for 1000 individuals |

Decision: Illumina or BGI 30–40× WGS. Tradeoff: miss rare structural variants to enable population-scale SNV discovery.

**Scenario 2: De Novo Genome Assembly (Single organism, $10k budget)**

| Platform | Read Length | Run Cost | Coverage Needed | Total Cost | Outcome |
| :---- | :---- | :---- | :---- | :---- | :---- |
| Illumina 250 bp | 150 bp paired | $3k | 100× short | $3k | Draft genome; gaps at repeats |
| PacBio HiFi | 15 kb | $10k | 30–40× long | $10k | Near-complete; few gaps |
| Nanopore | 50+ kb | $2k device | 20–30× long | $4k (device) | Rapid assembly; higher error |

Decision: PacBio HiFi or Nanopore. Tradeoff: higher per-run cost, but long reads solve the repeat problem that plagued short-read assembly.

Scenario 3: Field Diagnostics in Developing Region (rapid pathogen detection)

| Platform | Portability | Cost per Run | Turnaround | Accuracy | Suitable? |
| :---- | :---- | :---- | :---- | :---- | :---- |
| Illumina | Lab-only | $3k–5k | 1–2 days | 0.1% | No (infrastructure required) |
| Nanopore MinION | Handheld | $200–500 (per device) | Hours | 5–15% raw | YES (field-ready) |
| BGI | Lab-only | Similar to Illumina | Similar | Equivalent | No (infrastructure required) |

Decision: Nanopore. Tradeoff: higher per-base error (mitigated by consensus basecalling), but portability enables rapid diagnostics in remote settings.

## **Part 4: Quality Metrics & FastQC (Hands-On Introduction)**

**What FastQC Does:**  
FastQC analyzes raw FASTQ files and produces visualizations of:

1. Per-base quality score distribution (what we discussed in Week 1\)  
2. Quality scores by position (cycle-by-cycle degradation)  
3. Per-base nucleotide content (are we seeing expected %A, C, G, T?)  
4. GC content distribution (biased samples show abnormal peaks)  
5. Adapter contamination (residual sequencing adapters?)  
6. Duplicate reads (PCR bias?)  
7. Overrepresented sequences (contaminants or polyA tails?)

Example FastQC Report Interpretation:

**Report Section: Quality by Cycle**  
Cycles 1–50:    Green zone (Q30–40)      ✓ Good  
Cycles 51–100:  Yellow zone (Q20–25)     ⚠ Acceptable (expect this)  
Cycles 101–150: Red zone (Q15–20)        ⚠ Consider trimming  
Action: Trim reads to cycle 100–120 for downstream analysis (retain high-confidence bases).

**Report Section: Per-Base Nucleotide Content**  
Position 1–20:  Abnormally high A+T content  ⚠ Check for adapter/bias  
Position 21–150: Balanced (25% A, C, G, T)   ✓ Good  
Action: Investigate positions 1–20; may indicate adapter contamination.

## 

## **Part 5: Platform Selection Framework (Decision Tree)**

Question 1: What is your research question?

* Variant discovery in coding regions? → Short-read SNV calling (Illumina/BGI)  
* Structural variations / genome assembly? → Long-read (PacBio/Nanopore)  
* Metagenomics / unknown organisms? → Long-read or short-read high-throughput (Illumina)  
* Field diagnostics? → Nanopore (portable)  
* Ancient/degraded DNA? → Short reads OK; long reads better if available

Question 2: What is your budget?

* $100–300/genome? → Illumina or BGI WGS  
* $1–3k/sample? → PacBio or deep Illumina  
* \<$1k total budget? → Nanopore device \+ runs

Question 3: What is your timeline?

* Need results in weeks? → Illumina (mature pipeline)  
* Can I wait months? → PacBio (higher quality but slower)  
* Need results in hours? → Nanopore (real-time sequencing)

Question 4: Do fairness considerations matter?

* Is my model trained on biased data? → Choose platform used in training (for consistency)  
* Am I studying underrepresented populations? → Ensure platform covers ancestry diversity in databases  
* Do I need replicates across platforms? → Mix platforms to validate findings

## **Week 2 Grading & Deliverables**

## **BIOL550 Grading (Continued from Week 1\)**

The same structure applies; Week 2 is the second of 10 weekly lab reports.

## 

## **Week 2 Specific Deliverables**

1\. Attendance & Participation (→ 90 pts participation pool)

* Attend Mon 11:00, Wed 11:00, Thu 9:30 Zoom  
* Ask ≥1 question about platform economics or tradeoffs  
* Engage in Q\&A about FastQC interpretation

2\. Platform Economics Reflection (1–2 pages, if assigned)

* Reflect on cost curve from Mardis (2008) predictions → 2026 reality  
* Discuss one scenario where cheaper sequencing enables a study that wouldn't have been possible in 2008  
* Connect to fairness: who benefits from the cost drop? Who might be left behind?

3\. FastQC Hands-On (Optional Exercise)

* Download sample FASTQ from instructor (or public dataset)  
* Run FastQC  
* Interpret results (quality by cycle, GC content, adapters)  
* Write a 1-paragraph summary: "What does this data quality tell me about the sequencing run?"

4\. Second Weekly Lab Report (2–3 pages, due Sunday Feb 2, 11:59 PM)

* Summarize Week 2 concepts (platform economics, real-world tradeoffs)  
* Solve one platform selection scenario (from your project context)  
* Interpret a FastQC output (or hypothetical)  
* Connection to your BIOL550 project: "Which platform would I choose for my RNA biomarker dataset, and why?"

**Week 3 Work Overview**

This paper introduces MaSuRCA, a hybrid genome assembler that combines de Bruijn‑style efficiency with overlap–layout–consensus flexibility by collapsing massive Illumina datasets into a much smaller set of long “super‑reads,” then assembling those with a modified Celera Assembler. It is evaluated as a technology against Allpaths‑LG and SOAPdenovo2 on bacterial and mammalian data, making it a perfect fit for BIOL550’s “tech comparison” theme.

## **Big-picture goal and contribution**

Second‑generation sequencers produce billions of short reads cheaply, but existing assemblers either struggle with error and variable read lengths (pure OLC) or throw away adjacency information and become error‑sensitive (pure de Bruijn). MaSuRCA’s goal is to get the best of both worlds: it turns high‑coverage short reads into a *compressed*, error‑tolerant representation (super‑reads) and then runs a classic overlap-based assembler on that reduced dataset.  
The central conceptual contribution is the **super‑read paradigm**: instead of building and traversing a full de Bruijn graph, MaSuRCA extends each read uniquely in both directions using k‑mer counts to produce long, error‑corrected “super‑reads” that contain essentially all of the information in the original reads but are hundreds of times fewer in number. This allows it to mix Illumina, 454, and Sanger reads in one assembly and to scale to very large genomes (e.g., pine, cow, cat, macaque) using a single unified framework.

## **Algorithmic design (tech side for BIOL550)**

MaSuRCA’s pipeline has three major algorithmic pieces, each of which illustrates a BIOL550‑relevant design pattern:

1. **Error correction and k‑unitigs**  
   * Illumina reads are first error‑corrected using QuorUM; this simplifies the k‑mer landscape and lengthens simple paths in k‑mer space.  
   * The algorithm builds a k‑mer count table (via Jellyfish) and defines “simple” k‑mers (unique predecessor and successor), then merges them into maximal **k‑unitigs**, similar to “unipaths” in Allpaths‑LG.  
   * No k‑mer belongs to more than one k‑unitig, which is critical later for unambiguous extension.  
2. **Super‑reads from paired‑end data**  
   * Each PE read is mapped onto k‑unitigs; if it is fully contained in a k‑unitig, that unitig is its super‑read; otherwise, reads are used to stitch multiple overlapping k‑unitigs into a longer sequence.  
   * Read pairs are also used to find unique k‑unitig paths between mates; successful cases yield a single long super‑read spanning both ends, failures yield two super‑reads plus a linking PE constraint.  
   * Theoretical result: if the original reads are “k‑perfect” (cover the genome with ≥k‑bp overlaps), then the resulting k‑super‑reads preserve all information; no true sequence information is lost.  
3. **Overlap assembly and scaffolding (CABOG)**  
   * After discarding non‑maximal super‑reads (those that are exact substrings of other super‑reads), MaSuRCA assembles maximal super‑reads, linking mates, jumping libraries, and optional long reads using a modified CABOG (Celera) assembler.  
   * CABOG’s coverage‑based repeat handling is adjusted to account for the number of original reads represented in each super‑read, restoring accurate depth statistics.  
   * A gap‑filling module builds local k‑unitigs around scaffold gaps (from contig‑end “faux reads”) and tries to create a unique super‑read spanning both sides, filling 10–20% of gaps in typical genomes.

For BIOL550, MaSuRCA is a textbook example of *algorithm engineering*: it repurposes known ideas (k‑mers, OLC, error correction) into a hybrid pipeline tuned to real data constraints (coverage, error, insert‑size variability).

## **Benchmark datasets and performance metrics**

The authors benchmark MaSuRCA against Allpaths‑LG and SOAPdenovo2 on two real datasets with finished reference genomes:

* **Rhodobacter sphaeroides** (high‑GC bacterium, 4.6 Mb, Illumina PE \+ jumping \+ optional Sanger long reads), chosen as a challenging small genome with GC ≈ 68% that stresses Illumina biases.  
* **Mouse chromosome 16** (≈98 Mb from C57BL/6J), using Illumina libraries and optional Sanger long reads; assembled as a single chromosome‑scale test case.

They use **QUAST** to measure **contig NGA50** (length N such that 50% of the *reference* is covered by aligned contigs of length ≥N) and also compute **scaffold NGA50** and misassembly rates by aligning scaffolds to the finished genome with Nucmer. This aligns directly with the Week‑3 “tech comparison” you saw in the chicken paper: same organism, multiple assemblers, and standardized contiguity \+ correctness metrics.

## 

## **Rhodobacter results (Illumina only vs hybrid)**

* With Illumina short reads only, MaSuRCA and Allpaths‑LG have very similar contig NGA50 (≈41–42 kb) and scaffold NGA50 (\~3.1–3.2 Mb), both far better than SOAPdenovo2 (contig NGA50 17.5 kb, scaffold NGA50 67 kb).  
* SOAPdenovo2 has fewer contig misassemblies numerically, but this comes at the cost of much smaller contigs and extremely short scaffolds; MaSuRCA and Allpaths produce chromosome‑scale scaffolds near the size of the largest R. sphaeroides chromosome (\~3.2 Mb).  
* When low‑coverage Sanger long reads are added (1–4×), MaSuRCA’s contig NGA50 jumps dramatically—from 41.4 kb to 63.9 kb (1× LR), 87.2 kb (2×), and 228.4 kb (4×), with scaffold NGA50 staying at \~3.2 Mb and scaffold error rate dropping at higher LR coverage.  
* Allpaths‑LG and SOAPdenovo2 cannot directly take such mixed datasets (short \+ long Sanger) in the same way, so MaSuRCA’s hybrid design becomes a distinct advantage.

## **Mouse chromosome 16 results**

* On Illumina‑only data, MaSuRCA’s contig NGA50 (56 kb) is about double that of Allpaths‑LG (28 kb) and much higher than SOAPdenovo2 (8 kb), though MaSuRCA has somewhat more contig‑level misassemblies than Allpaths.  
* For scaffolds, MaSuRCA produces very long structures: scaffold NGA50 ≈ 3.4 Mb vs 0.26 Mb for Allpaths and 1.8 Mb for SOAPdenovo2, i.e., an order of magnitude larger than Allpaths for similar or modestly higher error density.  
* Adding 1–4× Sanger long reads steadily increases contig NGA50 (to 70, 82, and 102 kb) and improves or maintains acceptable misassembly rates; scaffold NGA50 rises above 4.5 Mb at higher LR coverage despite no long‑read mate‑pair information.

For BIOL550, these results model how to compare tools: MaSuRCA is not uniformly “best” (e.g., Allpaths sometimes has fewer errors), but it offers **strong contiguity, flexible input, and clear gains from hybrid data**, which you would highlight when justifying assembler choice for a new genome project.

## 

## **Practical considerations and course‑level lessons**

The discussion section is unusually honest about *data problems* and diagnostics, which is exactly the mindset BIOL550 emphasizes:

* **Input quality checks:** They recommend counting unique k‑mers to estimate per‑read error rate: if U is the average number of unique k‑mers per read and k the k‑mer length, then U/k gives a lower bound on errors per read; values like ≥2–3 errors per 100‑bp read signal a problematic run that may be better discarded.  
* **Library pathologies:** Mis‑labeled insert sizes, chimeric jumping libraries, or uneven PE vs mate quality can all destroy contiguity, and “data debugging” is often as critical as algorithm tuning.  
* **Polymorphism:** Diploid polymorphism inflates the number of super‑reads (\~2–4× coverage in super‑reads rather than \~2×) and can fragment scaffolds if haplotypes diverge beyond what CABOG will merge (≈6%); resolving this may require post‑processing to separate haplotypes.

The paper also positions MaSuRCA within the broader ecosystem (GAGE, GAGE‑B) and notes that no assembler is universally best; performance is dataset‑dependent, and systematic benchmarks across multiple genomes are needed before declaring a tool “standard.” That message lines up directly with the BIOL550 academic plan: learn to understand **why** a tool works, **when** it works, and **what trade‑offs** it makes, rather than treating it as a black box.

N50 is a key bioinformatics metric for assessing the continuity and quality of a genome assembly, representing the length of the shortest contig or scaffold that covers 50% of the total assembled genome length. A higher N50 value generally indicates a more complete and less fragmented assembly, commonly used for long-read data evaluation. 

* How N50 is Calculated Sort:   
  Arrange all contigs/scaffolds in descending order of length.Sum: Calculate the total length of all contigs. Find 50%: Determine the 50% value of the total assembly length.Identify N50: Sum the lengths from the longest contig downwards until the sum reaches or exceeds 50% of the total length. The length of this last added contig is the N50.   
* Key Aspects and Related Metrics Contiguity Measure:

N50 is frequently used to evaluate how well a genome is assembled; higher values mean fewer, larger pieces.L50 (or L50 count): The smallest number of contigs whose combined length equals 50% or more of the genome.NG50: Similar to N50, but uses the expected total genome size instead of the assembled genome size for the 50% calculation, allowing for comparisons across different assemblies.Context: While crucial, a high N50 should be accompanied by high BUSCO scores (completeness) and proper annotation to ensure quality.

# **MaSuRCA: Genome Assembly for the Real World**

**Background & Context:**  
MaSuRCA (Maryland Super Read Cabog Assembler) is a hybrid genome assembler designed to address the challenges of assembling large, complex genomes from next-generation sequencing (NGS) data. The BIOL550 course emphasizes understanding both the algorithmic strategies and practical outcomes of modern assembly tools, especially in the context of real biological data.

**Key Innovations:**

* **Super-Reads:** MaSuRCA’s core innovation is the creation of “super-reads”—long, accurate synthetic reads generated by merging overlapping short reads using unique k-mer extensions. This reduces assembly complexity and error propagation.  
* **Hybrid Assembly:** MaSuRCA can integrate both short (Illumina) and long reads (Sanger, PacBio, etc.), leveraging the strengths of each to improve contiguity and accuracy.


**Performance Highlights (from Tables 1 & 2):**

* On *R. sphaeroides* (bacterial genome), MaSuRCA (Illumina-only) matches Allpaths-LG in contiguity (NGA50), and adding long reads dramatically increases scaffold length (NGA50 up to 228.4 kb).  
* On mouse chromosome 16 (complex, diploid), MaSuRCA outperforms both Allpaths-LG and SOAPdenovo2 in scaffold size (NGA50 up to 4511 kb with long reads), while maintaining competitive error rates.  
* The addition of long reads consistently improves assembly contiguity and, in some cases, reduces misassemblies.


**Algorithmic Insight (Fig. 2):**

* The “super-read” process is visually explained: reads are extended by unique k-mers, merging into longer, more informative sequences (super-reads), which are then assembled. This approach reduces graph complexity and improves assembly quality.


**Course-Relevant Takeaways:**

* **Comparative Evaluation:** MaSuRCA’s results highlight the importance of benchmarking assemblers on both simple and complex genomes, a key BIOL550 theme.  
* **Hybrid Data Integration:** The assembler’s ability to combine short and long reads anticipates current trends in genomics, where multi-platform data is the norm.  
* **Algorithmic Transparency:** The super-read concept is a clear, teachable example of how algorithmic choices impact biological outcomes.


**Practical Implications:**

* MaSuRCA is a strong choice for projects requiring high contiguity, especially when long reads are available.  
* Its performance on both bacterial and mammalian genomes makes it versatile for a range of BIOL550 projects.


**Next Steps for BIOL550:**

* Visualize the comparative metrics (NGA50, misassemblies, scaffold N50) for MaSuRCA, Allpaths-LG, and SOAPdenovo2.  
* Discuss how super-reads and hybrid assembly strategies could be applied to your own datasets.

02/04/2026

## **1\. What the annotation files add (GTF/GFF)**

* The genome FASTA gives you the raw sequence only; annotation files (GTF/GFF) add the **structure**:  
  1. Gene start and stop coordinates  
  2. Exon and intron boundaries  
  3. Transcript IDs and isoforms  
  4. Strand information (which DNA strand the gene is on)  
* Aligners like STAR/TopHat/HiSAT typically use annotation in **two conceptual steps**:  
  1. Build an index of the genome that also knows where annotated genes and exons are.  
  2. Align your RNA‑seq fragments to the genome and, using that index, decide which gene/exon each fragment belongs to and where splicing events occur.  
* Some aligners can also **detect novel exons/junctions** that are not in the annotation (e.g., STAR, TopHat, HiSAT), adding evidence for new isoforms beyond the reference.

## **2\. Reference annotation sets: Ensembl, RefSeq, and others**

* When we talk about using “different reference sets,” we really mean **different annotation collections** built on top of (usually) the same genome sequence.  
* The main human examples discussed in class:  
  * **Ensembl**  
    * A large, curated resource/organization, not just a single file.  
    * Provides genome assemblies, gene models, individual sequences, and cross‑links to many external databases.  
  * **RefSeq** (NCBI Reference Sequence)  
    * A curated set of reference sequences (genomic, transcript, and protein).  
    * Often what people mean when they say “RefSeq annotations” for human.  
    * There can be different branches or subsets (e.g., restricted, “best” or “select” transcripts).  
* Technically, many of these are stored as **flat files** (e.g., GTF/GFF, tables), so there was some joking in class about whether they’re “real databases.” Functionally, though, they behave like databases because:  
  * Each feature has IDs and accession numbers.  
  * They cross‑reference external resources (using accessions rather than URLs, since URLs change).  
* Key idea:  
  * You always have a **genome sequence** (FASTA).  
  * For each reference set (Ensembl, RefSeq, etc.) you also have a **matching annotation file** that lists “all the interesting features.”

## **3\. Species differences and “only one reference” cases**

* The choice of annotation set is **species‑dependent**:  
  * For human and mouse, you often have multiple rich options (Ensembl, RefSeq, GENCODE, etc.).  
  * For many non‑model species, there may be only a single, partial, or lower‑quality annotation; in those cases you “make the best of it” with what’s available.  
* One of the first ambiguities you face in an RNA‑seq project is: **which annotation/reference set do we use?**  
  * This affects gene counts, isoform definitions, and downstream interpretation.  
  * Later in the course, you’ll see that different choices can change which genes look “different” or how GO enrichment behaves.

## 

## **4\. Gene length bias and false positives in RNA‑seq**

* A **major historical issue** in RNA‑seq differential expression: longer genes tend to look more “significant” simply because they generate more fragments.  
* Intuition:  
  * If you randomly sample reads across the transcriptome, you’re more likely to see fragments from a long gene than from a short one.  
  * When you plot observed fold‑change versus gene length, you often see that **apparent fold‑change increases with gene length**, even when it shouldn’t.  
* Consequences:  
  * This creates **false positives**: long genes appear more differentially expressed just because of length, not biology.  
  * Proper **normalization** is required to reduce this bias (e.g., length‑aware measures, log‑transforming counts, using methods that adjust for gene length rather than just raw counts).

## **5\. Coverage bias along the gene body**

* Another bias is not just how long the gene is, but **where along the gene** reads tend to fall:  
  * Empirically, many RNA‑seq datasets show **higher coverage in the middle of transcripts** and lower coverage near the 5′ and 3′ ends.  
  * When you plot read coverage across exons from 5′ to 3′, you often see a “hump” in the center and drop‑offs at the ends.  
* Possible causes:  
  * Library prep and fragmentation protocols.  
  * Adapter ligation or priming biases.  
  * RNA degradation or selection steps that preferentially capture certain regions.  
* Why it matters:  
  * It complicates exon‑level analysis and isoform quantification, because not all exons are sampled equally.  
  * Downstream tools and QC plots (like the “gene body coverage” plots) are used to **detect and diagnose** these biases before you trust your DE results.

## **6\. Take‑home messages from this class segment**

* Always be clear on **which annotation/reference set** you’re using (Ensembl, RefSeq, etc.) and why.  
* Remember that annotations are **structured flat files**, not just raw sequences: they encode exon/intron boundaries, gene starts/stops, and strands.  
* Biases in RNA‑seq are real and have to be addressed:  
  * Longer genes tend to accumulate more reads and can inflate fold‑changes.  
  * Coverage across gene bodies is not uniform; ends often have lower coverage.  
* Modern pipelines (and the tools you’ll use in BIOL550) incorporate normalization and QC steps to **mitigate these issues**, but you should still understand the underlying problems so you can interpret results critically.

Here’s a summary of the BIOL550 Week 2 Material Overview, tailored to the course interests:

* The document deepens Week 1’s focus on **sequencing platforms** by analyzing **platform economics, real-world tradeoff**s, and hands-on data quality assessment using FastQC.  
    
* It highlights the dramatic drop in **sequencing costs** from $100,000/genome (2008) to $100/genome (2026), enabling population-scale studies but raising questions about global accessibility and fairness.  
    
* The 2020 **Illumina NovaSeq** vs. **BGI MGISEQ** study shows both platforms now offer comparable performance for mainstream applications (e.g., **single-cell RNA-seq)**, with **BGI providing a cost advantage.**  
    
* Platform selection is scenario-driven: Illumina/BGI for **SNV discovery**, **PacBio/Nanopore for assembly** or field diagnostics, with *tradeoffs in accuracy, cost, and portability.*  
    
* FastQC is introduced as a key tool for evaluating raw sequencing data quality, guiding decisions on trimming and downstream analysis.  
    
* The document integrates **fairness considerations,** emphasizing how platform choice affects representation, infrastructure bias, and equity in genomics research.  
    
* Connections to other courses (BIO630, ISTE780, IDAI700) are made, showing how **platform choice impacts algorithm selection and fairness audits**.  
    
* The overview prepares students for Week 3’s focus on **genome assembly algorithms**, directly linking platform characteristics to computational strategies.

In short, the paper provides a practical, fairness-aware framework for choosing sequencing platforms, interpreting data quality, and understanding the broader impact of these decisions in genomics research.

## 

## **02-05 Class Session: RNA-Seq Pipeline (FastQC, STAR, Server Load, Paired-End Alignment)**

## Date & Time: 2026-02-05 09:30:31

## **Knowledge Point Explanation**

### **FastQC Completion and Submission**

* ## Finish FastQC on assigned datasets, collect all HTML outputs, zip into one archive, and upload for review.

* ## Morning cohort feedback: “really good” with minor suggestions; grades for the first part of Trapnell will be posted after reviewing reports and FastQC results.

* ## Deliverable format is standardized to a single zip for completeness and ease of review.

### **Zip Packaging Requirements**

* ## Locate all FastQC HTML files and compress into one zip.

* ## Upload the zip to the designated platform; the instructor will review and provide feedback.

### **Feedback and Grading Process**

* ## Sequence: submission → review → feedback → grade posting.

* ## Criteria include completeness/quality of FastQC results and clarity/correctness of the written report.

### **Transition to STAR Aligner**

* ## Do not proceed to STAR until FastQC tasks are complete and submitted.

* ## Next step involves obtaining/installing STAR and preparing to run.

### **Server Load and Monitoring**

* ## Load average reflects composite busy-ness across CPU and I/O; monitor via top/htop and check who for user count.

* ## For TruSeq, keep load ≤15; if \~13, wait. If broader activities push load toward \~50, wait and lower threads.

### **FastQC Resource Profile**

* ## FastQC has modest load impact, primarily disk I/O; use as a monitoring demo before heavier STAR runs.

### **STAR Two-Stage Workflow**

* ## genomeGenerate: set output directory, \--genomeFastaFiles, annotation (GFF/GTF), increase LimitGenomeGenerateRAM to use available memory; runs \~15–20 minutes.

* ## Alignment: provide genomeDir from genomeGenerate, reuse same annotation, pass space-separated input files (include R1/R2 pairs), configure runThreadN based on current load.

### **Thread Management and Concurrency**

* ## If alone on server, runThreadN=4; if others are active, set runThreadN=1.

* ## Expect roughly linear increases in load with concurrent STAR users; delay jobs if load is high.

### **RAM Limits for genomeGenerate**

* ## STAR’s default RAM cap is strict; increase LimitGenomeGenerateRAM per instructions to prevent allocation failures and allow concurrent runs.

### **Reference Genome and Annotation Selection**

* ## Pick the correct reference based on dataset documentation; ensure annotation matches the chosen genome build.

* ## Maintain annotation consistency across both STAR steps to avoid mapping errors.

### **Paired-End Reads in TruSeq**

* ## Identify R1/R2 files and supply both to STAR; orientation should be inward-facing with a typical insert gap; STAR filters anomalous pairings.

### **Input File Organization**

* ## Structure inputs by condition (C1/C2) and replicates (R1–R3); align per replicate pair rather than batching all files.

### **nohup and Background Execution**

* ## Prefix long runs with nohup and append & to run in background and survive disconnections; monitor progress via top/htop.

### **Process Monitoring and Control**

* ## Use top/htop for real-time metrics; press Q to quit top.

* ## To stop runaway jobs, find PID and run kill (if you own the process).

### **Reference Genome Preparation (Part 1 of Step 2\)**

* ## Prepare genome indices/sub-sequences correctly; finishing this part fulfills the preparatory step before mapping.

* ## If runs stall or fail (e.g., “fatal input file error”), capture exact command and error for diagnosis.

### **STAR Genome Generation Parameters**

* ## Ensure adequate memory via LimitGenomeGenerateRAM; specify SJDB GTF/GFF with correct flags and paths.

* ## Errors like “could not open genome class file” indicate parameter/path issues; send exact commands and errors for help.

### **Command-Line Error Reporting in Lab Reports**

* ## Focus on program parameter errors (paired-end flags, memory settings, annotation inputs) with exact messages and commands.

* ## Exclude basic shell/path mistakes from reports.

### **Paired-End BAM Handling**

* ## Later steps require explicit paired-end specifications and proper BAM handling; omissions trigger program-level errors.

### **Performance and Threads**

* ## Inspect system resources with top before running multi-threaded jobs; adjust threads to avoid stalls.

### **Technical Support Protocol and Office Hours**

* ## Email detailed error reports (exact command \+ exact error); Slack is for IT/internal use.

* ## Attend 3 o’clock office hours for in-depth assistance; no time immediately after class.

### **Cufflinks/R Note**

* ## Avoid server-side Cufflinks due to R version conflicts; run locally if needed and document separately.

## **Homework**

* ## Finish FastQC for assigned datasets; collect all HTML reports; compress into a single zip; upload for review; address any minor feedback.

* ## Do not start STAR until FastQC submission is complete.

* ## Prepare the reference genome (part one of step two) using STAR genomeGenerate: select correct FASTA and matching GFF/GTF; set LimitGenomeGenerateRAM; consider nohup &; check top before using multiple threads.

* ## Align paired-end reads replicate-by-replicate (e.g., C1\_R1 R1/R2) with STAR: reuse the same annotation, tune runThreadN based on server load (4 if alone; otherwise 1); do not batch all files at once.

* ## Monitor server load with top/htop and user count with who; delay jobs if load average is high (TruSeq threshold ≤15).

* ## Document exact commands and program-level error messages in the weekly lab write-up; exclude general shell/path mistakes; include troubleshooting steps.

* ## If errors occur (e.g., “fatal input file error,” “could not open genome class file”), email the exact command and error message; attend the 3 o’clock office hour for support.

* ## If using Cufflinks/R, run locally and document results separately.

## 

## Date Time: 2026-02-05 09:30:31

## 

## **Summary**

## This series of sessions covers a bioinformatics analysis workflow, focusing on the STAR aligner. The instructor, Mr. Garcia, begins by addressing housekeeping for the FastQC assignment, reminding students to zip and upload their HTML files for review. The main topic then shifts to the two-step process of using the STAR aligner: first, generating a genome index from a reference genome and annotation file, and second, aligning paired-end TruSeq sequencing reads to this index. Throughout the technical guidance, instructors emphasize server etiquette, including monitoring system load with the top command and managing long-running processes with nohup and the & operator to avoid overburdening shared resources. A key rule is to keep the server's load average below 15 when running resource-intensive tasks.

## The sessions also involve hands-on work and troubleshooting. Instructors guide students on debugging STAR aligner errors, such as "fatal input file error" or issues opening genome files, and clarify the difference between reportable programmatic errors (like memory allocation) and non-reportable user syntax errors for lab write-ups. They advise on how to manage runaway processes using kill \[PID\] and the importance of providing specific error messages and commands when seeking help. Due to software conflicts on the server (specifically with R), students are advised against using Cufflinks on the shared system. 

## **Knowledge Points**

### **1\. Assignment Administration and Support**

* ## **FastQC Assignment Submission:** Students must complete the FastQC assignment, zip all generated HTML files, and upload the single zip file. The instructor has already reviewed morning submissions, which were of high quality, and will post grades after feedback is addressed.

* ## **Lab Report Guidelines:** For lab write-ups, students should document commands, outputs, and programmatic errors encountered (e.g., memory issues with LimitGenomeGenerateRAM). Basic user errors like typos or incorrect file paths are not to be reported.

* ## **Troubleshooting and Communication:** When seeking help via email, students must provide the exact command line used and the full error message. Vague descriptions are insufficient. Office hours are available for more in-depth support. The instructor uses Slack for internal IT matters only, not for student communication.

### **2\. Server and Process Management**

* ## **Monitoring System Load:** Before running resource-intensive tasks, students must check the server's load using the top command (or htop). The load average should not exceed 15 when running STAR for the TruSeq dataset.

* ## **Understanding System Load:** System load is a composite measure of server business, including CPU usage and drive access. The server has two CPUs, each with 12 threads.

* ## **Managing Long-Running Processes:** Use nohup at the beginning of a command to prevent termination upon network disconnection. Use an ampersand (&) at the end to run the process in the background and regain terminal access. This is recommended for the genome mapping step.

* ## **Managing Runaway Processes:** A process can be terminated using its Process ID (PID) with the kill \[PID\] command. PIDs for running processes can be found using top.

### 

### 

### **3\. STAR Aligner Workflow**

* ## **Two-Step Process:** The analysis involves two main steps: 1\) generating a genome index (\--runMode genomeGenerate), and 2\) aligning sequencing reads to that index.

* ## **Step 1: Genome Index Generation:**

  * ## This step creates a map of the reference genome using a FASTA file and an annotation file (GTF/GFF).

  * ## **Parameters:**

    * ## \--runMode genomeGenerate: Specifies the task.

    * ## \--genomeDir: Defines the output directory for the index.

    * ## \--genomeFastaFiles: Specifies the reference genome FASTA file.

    * ## \--sjdbGTFfile: Specifies the annotation file.

    * ## \--limitGenomeGenerateRAM: Must be increased from the default value to use available memory.

* ## **Step 2: Read Alignment:**

  * ## This step aligns paired-end sequencing reads against the pre-built genome index.

  * ## **Parameters:**

    * ## \--genomeDir: Points to the directory containing the genome index.

    * ## \--runThreadN: Controls the number of threads. Use 4 if the server is not busy; reduce to 1 if the load is high.

    * ## \--readFilesIn: Specifies the input read files (forward and reverse, separated by a space).

    * ## \--sjdbGTFfile: The same annotation file from step 1 must be used.

  * ## **Paired-End Data:** The TruSeq data is paired-end (\_1 and \_2 files). Each pair (e.g., for one replicate) must be aligned together in a single STAR run. The experiment consists of two conditions (C1, C2) with three replicates each, resulting in six separate alignment runs. STAR uses paired-end information for quality filtering. Students need to find an additional parameter in the documentation for this.

### **4\. Software and Environment Notes**

* ## **Cufflinks and R:** Students are advised not to use Cufflinks for this analysis due to conflicting versions of R on the server. Those wishing to experiment with Cufflinks or R should do so on their local machines.

* ## **Trap Analysis:** The trap analysis must be performed on all available samples.

## **Assignments**

* ## Complete the FastQC analysis, combine HTML files into a single zip file, upload it, and review instructor feedback.

* ## Run the first step of the STAR analysis: genomeGenerate. Determine the correct reference genome and annotation file.

* ##  Use nohup and & to run the genome generation process in the background.

* ## Before running alignments, monitor server load with top. If the load average is near 15, wait or reduce thread count.

* ## For the trap analysis, run the analysis for all samples.

* ## Perform the second STAR step: align the paired-end reads for each sample individually (six total runs). Use a low thread count (e.g., 1\) initially.

* ## Search the STAR aligner documentation for the correct parameter for handling paired-end reads.

* ## Proceed to step three (rest of "trapdoor stuff") after completing the alignments.

* ## For the lab write-up, document commands, outputs, and any programmatic error messages encountered and how they were resolved.

* ## Students needing help should attend office hours (3:00 PM on Feb 5, 2026\) or email the instructor with exact commands and full error messages.

# **Clarification on Assignment Submissions and Course Policies**

## A student, who was unable to complete work due to illness, meets with a professor to clarify submission requirements for FastQC HTML files and a weekly report. The professor details the specific instructions for each assignment, explains the course's flexible submission policy, and confirms that the two tasks are separate deliverables.

## 

## **Initial Query and Justification for Delay**

## The student initiated the conversation to check in with the professor, explaining that they had been unable to finish their work the previous day. They had to go to bed early after experiencing chills and taking Tylenol. Before proceeding with the work, the student wanted to ask a clarifying question to ensure they understood the assignment's requirements and could provide the correct deliverables.

## 

## **Task 1: HTML File Submission Guidelines**

## The professor clarified the requirements for submitting the FastQC analysis files, correcting the student's initial assumption that a written interpretation of the findings was needed for this part of the assignment. The instruction is to take all the HTML files generated by FastQC from the travel data, compile them into a single zip file, and upload that file to the "My Courses" platform.

## 

## **Task 2: Weekly Report Details and Policies**

## The professor explained that a separate written report was due that morning before the workshop, a deadline the student had missed. However, the professor noted that the student could treat this as a "gimme week," as submissions are not required every single week. For future reports, the content should include one example of a command line used, followed by a prose description of factual observations from the data. This analysis should emphasize quantitative details, such as the number of spots or data ranges, and highlight any interesting or unusual findings.

## The professor referenced the syllabus, explaining the overall course structure for these reports. Of a total of 12 possible weekly reports (including one for project picks and an optional one during spring break), students are required to submit 10\. With 11 weeks remaining, the student needs to complete another nine reports, affording them some flexibility. The professor also recommended submitting assignments before the night they are due.

## 

## **Confirmation of Separate Deliverables**

## The student sought final confirmation, asking if the zip file submission and the written report were separate tasks. The professor affirmed that they are two distinct deliverables to be submitted to two separate assignment boxes on the course platform. The FastQC HTML files could still be submitted, but the weekly written report has a fixed deadline each week before the morning workshop. This clarification resolved the student's misunderstanding.

## 

## **Action Items**

## **@Student**

* ## Compile all FastQC HTML files from the travel data into a zip file and upload it to My Courses \- \[TBD\]

* ## Ensure timely submission of the weekly written report for future weeks \- \[TBD\]

## **@Professor**

* ## Review the student's submissions in My Courses and provide brief feedback on any major issues \- \[TBD\]

## 

## 

## 

## **LAB INSTRUCTIONS**

## **Summary — FastQC run & delivery**

All set — we ran FastQC on the test FASTQs, fixed the missing stylesheet so the HTML renders like the instructor's examples, produced full FastQC outputs (HTML \+ images \+ zip) on the server, and copied a zip into your project folder for download. 

## **Step‑by‑step (commands & notes)**

1. Test FastQC (initial dry run)  
   * Ran the per‑user wrapper and/or direct FastQC on synthetic files:  
     * \~/starter\_pipeline/run\_prof\_fastqc.sh \-o \~/starter\_pipeline/test\_out \-t 4 \~/starter\_pipeline/test\_data/SRRtest  
     * or directly: /usr/local/bin/FASTQC\_12.1/fastqc \-o \~/starter\_pipeline/test\_out \-t 4 \~/starter\_pipeline/test\_data/\*.fastq  
   * Result: initial HTMLs generated in \~/starter\_pipeline/test\_out.  
2. Full FastQC re‑run (complete reports)  
   * Ran FastQC and saved full output to your home on the server:  
     * /usr/local/bin/FASTQC\_12.1/fastqc \-o \~/fastqc\_server\_out \-t 2 \~/starter\_pipeline/test\_data/\*.fastq  
   * Verified HTML, images and per‑sample zip output present in \~/fastqc\_server\_out.  
3. Copy into project and zip for transfer  
   * Copied outputs into a project folder and created a zip:  
     * mkdir \-p \~/starter\_pipeline/fastqc\_full\_output  
     * cp \-r \~/fastqc\_server\_out/\* \~/starter\_pipeline/fastqc\_full\_output/  
     * cd \~/starter\_pipeline && zip \-r \~/starter\_pipeline/fastqc\_full\_output/qc\_htmls\_full.zip fastqc\_full\_output  
4. Transfer to your Mac (you ran this)  
   * Downloaded via scp to your local project:  
     * scp pzg8794@sequoia:/home/pzg8794/starter\_pipeline/fastqc\_full\_output/qc\_htmls\_full.zip /Users/pitergarcia/DataScience/Semester5/BIOL550/group\_project/

FastQC produced full HTMLs and per-sample zips on the server. Below are server commands to reproduce the run, gather outputs, zip them, and place them on a shared/project location.

## **Step‑by‑step (run manually on the server)**

1. ***Confirm FastQC is available***  
   1. */usr/local/bin/FASTQC\_12.1/fastqc \--version*  
   2. *which fastqc || /usr/local/bin/FASTQC\_12.1/fastqc \--version*  
2. ***Create output directory***  
   1. *mkdir \-p \~/fastqc\_server\_out*  
   2. *Run FastQC on your FASTQs (adjust \-t threads and pattern as needed)*  
   3. */usr/local/bin/FASTQC\_12.1/fastqc \-o \~/fastqc\_server\_out \-t 4 /path/to/your\_fastqs/\*.fastq*   
   4. *(for gzipped reads) /usr/local/bin/FASTQC\_12.1/fastqc \-o \~/fastqc\_server\_out \-t 4 /path/to/\*.fastq.gz*  
4. ***Verify generated files (HTMLs, images, per-sample ZIPs)***  
   1. *ls \-lh \~/fastqc\_server\_out*  
   2. *ls \-lh \~/fastqc\_server\_out/\*.html*  
5. ***Copy outputs into a project folder (server side)***  
   1. *mkdir \-p \~/starter\_pipeline/fastqc\_full\_output*  
   2. *cp \-r \~/fastqc\_server\_out/\* \~/starter\_pipeline/fastqc\_full\_output/*  
6. ***Create one transfer ZIP (option A: keep folder structure; option B: flatten)***  
   1. Option A: *cd \~/starter\_pipeline && zip \-r \~/starter\_pipeline/fastqc\_full\_output/qc\_htmls\_full.zip fastqc\_full\_output*  
   2. Option B (flat zip of files): *zip \-j \~/starter\_pipeline/fastqc\_full\_output/qc\_htmls\_full.zip \~/fastqc\_server\_out/\**  
7. ***Move/put the zip on the shared/project drive (adjust target path)***  
   1. *cp \~/starter\_pipeline/fastqc\_full\_output/qc\_htmls\_full.zip /path/to/shared/BIOL550/*  
   2. *OR use scp to copy: scp \~/starter\_pipeline/fastqc\_full\_output/qc\_htmls\_full.zip user@remote:/path/to/dest/*  
8. ***(Local check) Download and open the HTMLs in a browser***  
   1. *On Mac: home/pzg8794/starter\_pipeline/fastqc\_full\_output/qc\_htmls\_full.zip /local/path/*  
   2. *unzip qc\_htmls\_full.zip && open \*.html*

### **FastQC quick checklist (server‑side)**

- [x]  **Confirm FastQC is available:** */usr/local/bin/FASTQC\_12.1/fastqc \--version*  
- [x]  **Create output dir:** *mkdir \-p \~/fastqc\_server\_out*  
- [x]  **Run FastQC:** */usr/local/bin/FASTQC\_12.1/fastqc \-o \~/fastqc\_server\_out \-t 4 /path/to/\*.fastq*  
- [x]  **Verify outputs:** *ls \-lh \~/fastqc\_server\_out and ls \-lh \~/fastqc\_server\_out/\*.html*  
- [x]  **Copy to project folder:**   
      - [x] *mkdir \-p \~/starter\_pipeline/fastqc\_full\_output && cp \-r \~/fastqc\_server\_out/\* \~/starter\_pipeline/fastqc\_full\_output/*  
- [x]  **Make transfer zip (Option A keep folder / Option B flat):**  
      - [x] *cd \~/starter\_pipeline && zip \-r \~/starter\_pipeline/fastqc\_full\_output/qc\_htmls\_full.zip fastqc\_full\_output*  
      - [x] *zip \-j \~/starter\_pipeline/fastqc\_full\_output/qc\_htmls\_full.zip \~/fastqc\_server\_out/\**  
- [x]  **Move/transfer to shared drive or local machine (adjust paths):**   
      - [x] *cp \~/starter\_pipeline/fastqc\_full\_output/qc\_htmls\_full.zip /path/to/shared/BIOL550/ or scp ... /local/path/*

## 

## /Users/pitergarcia/DataScience/.venv\_nb/bin/python \-m nbconvert \--to html \--no-input \--no-prompt \\

##   \--output BIOL550\_Lab2\_Report\_nocode.html \\

##   "/Users/pitergarcia/DataScience/Semester5/BIOL550/BIOL550-Lab/lab2/BIOL550\_Lab2\_Report.ipynb"

## 

## /Users/pitergarcia/DataScience/.venv\_nb/bin/python \-m nbconvert \--to pdf \--no-input \--no-prompt \\

##   \--TemplateExporter.exclude\_output=True \\

##   \--output BIOL550\_Lab2\_Report\_nocode\_nooutput.pdf \\

##   "/Users/pitergarcia/DataScience/Semester5/BIOL550/BIOL550-Lab/lab2/BIOL550\_Lab2\_Report.ipynb"

## 

## 

## 

## **PROJECT INSTRUCTIONS**

## 

## **Quick confirmation**

I double‑checked all six shortlist candidates. The three you quoted (**CPTAC TNBC**, **CPTAC Ovarian (HGSOC)**, **PsychENCODE**) are included — here’s a compact recap of all six I verified:

* **PRJNA1406761 — iPSC small‑intestine organoids**  
  * Samples: \~21 (meets ≥20) · **Read layout:** 2×150 bp · **Access:** Public · Example SRR: SRR36938303 (\~41M spots)  
* **PRJNA717662 — Long‑term blood transcriptome (post‑COVID)**  
  * Samples: 152 · **Read layout:** 2×150 bp · **Access:** Public · Example SRR: SRR15510543 (\~70M spots)  
* **PRJNA292477 — TOPMed / Framingham transcriptome**  
  * Samples: many · **Read layout:** 2×150 bp · **Access:** **Controlled (dbGaP)** for some metadata — raw runs may require approval  
* **PRJNA748788 — CPTAC TNBC (chemo response)** (one of the three you listed)  
  * Samples: \~135 experiments · **Read layout:** mostly 2×150 bp · **Access:** mixed (many raw runs public; clinical metadata may be dbGaP)  
* **PRJNA910283 — CPTAC Ovarian (HGSOC)** (one of the three you listed)  
  * Deep NovaSeq runs (many 60–150M spots); **note:** some runs are 2×100 bp — check per‑run metadata  
* **PsychENCODE umbrella (PRJNA308995 / PRJNA304334)** (one of the three you listed)  
  * Many brain RNA‑seq cohorts (high depth); **access/read length vary** by subproject — some are controlled

⚠️ Important: For **TOPMed** and certain **CPTAC** items, some clinical/metadata fields are dbGaP‑controlled (raw FASTQs are often available, but metadata or clinical access may require approval).

I pulled the BioProject/SRA pages and confirmed which studies fully meet the class constraints (public, ≥20 samples, typical 2×150 reads). Below are the direct links and a concise, copy‑paste set of steps to find and verify runs for each qualifying project.

## **Datasets that meet all requirements**

### **1\) PRJNA1406761 — iPSC small‑intestine organoids** 

* **BioProject:** [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1406761](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1406761)  
* **SRA Study (SRP):** [https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP665664](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP665664)  
* **Representative SRR:** SRR36938303 (example run; \~41M spots)  
* Quick verification: BioProject shows SRA experiments and run-level data consistent with **2×150** and per‑sample depth ≈30–50M.

How to find & verify runs (web \+ CLI):

1. Open the BioProject link → click **SRA** or **All experiments** → follow the SRA Run Selector.  
2. In Run Selector, click **Download** → **RunInfo Table (CSV)**. Inspect columns: Run, LibraryLayout (should be PAIRED), avgSpotLen / avgLength (\~300 for 2×150), spots, bases, Platform.  
3. (CLI) Run:  
   * esearch \+ efetch:  
     esearch \-db sra \-query "SRP665664" | efetch \-format runinfo \> PRJNA1406761\_runinfo.csv  
   * Inspect avgLength / LibraryLayout in the CSV.

### **2\) PRJNA717662 — Long‑term blood transcriptome after SARS‑CoV‑2**

* **BioProject:** [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA717662](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA717662)  
* **SRA Study (SRP):** [https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP312283](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP312283)  
* **Representative SRR:** SRR15510543 (example run; \~70M spots)  
* Verification: BioProject lists **152 SRA experiments**, **GEO: GSE169687**, and run info consistent with **2×150** deep runs.

How to find & verify runs:

1. Open the BioProject → click **SRA** / **All experiments** → use Run Selector → **Download RunInfo CSV**.  
2. Check LibraryLayout \= PAIRED and avgLength ≈300 / spots for depth.  
3. (CLI) Example: esearch \-db sra \-query "SRP312283" | efetch \-format runinfo \> PRJNA717662\_runinfo.csv

## 

## **Datasets that *mostly* meet constraints (need a quick run‑level check)**

### **PRJNA748788 — CPTAC TNBC (chemo response)**

* **BioProject:** [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA748788](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA748788)  
* **SRA Study (SRP):** [https://trace.ncbi.nlm.nih.gov/Traces?study=SRP387588](https://trace.ncbi.nlm.nih.gov/Traces?study=SRP387588)  
* **Representative SRR:** SRR20427233 (42.3M spots; NovaSeq run)  
* Note: SRA shows **135 experiments** and many **NovaSeq 6000** runs; most runs are suitable but check each run’s avgLength/Layout and dbGaP links (some clinical metadata are dbGaP‑linked).

### **PRJNA910283 — CPTAC Ovarian (HGSOC)**

* **BioProject:** [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA910283](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA910283)  
* **SRA Study (SRP):** [https://trace.ncbi.nlm.nih.gov/Traces?study=SRP422337](https://trace.ncbi.nlm.nih.gov/Traces?study=SRP422337)  
* **Representative SRR:** SRR23447671 (87M spots; **example appears to be 2×100** in metadata)  
* Note: many runs are very deep but some are **2×100** → requires run‑level filtering if 2×150 is strict.

### **PsychENCODE umbrella (PRJNA308995 / PRJNA304334) — brain RNA‑seq**

* **BioProject:** [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA308995](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA308995) (autism post‑mortem)  
* **Info:** SRA experiments present but **read length & access vary across subprojects**; many subprojects are controlled‑access. Check each subproject runinfo before selecting.

## **Exact stepwise checks**

1. Web (recommended for quick inspection):  
   * Open BioProject (example): https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1406761  
   * Click **SRA** → **All experiments / Run Selector** → click **Download** → **RunInfo (CSV)**.  
   * Inspect/Filter CSV: LibraryLayout \== PAIRED and avgLength \>= 300 (indicates \~2×150) and spots \>= target depth.  
2. CLI (Entrez / EFetch):  
   * esearch \+ efetch runinfo:  
     esearch \-db sra \-query "SRP665664" | efetch \-format runinfo \> SRP665664\_runinfo.csv  
   * Then inspect in shell or pandas: check LibraryLayout, avgLength, spots, platform.  
3. Access checks: on BioProject look for **dbGaP** links or "Genotype and Phenotype (dbGaP)" — if present, clinical metadata may require dbGaP approval even if raw runs are public.  
4. Download starter SRRs: use prefetch/fasterq-dump (or datasets CLI / cloud fastq links) but pre-check run IDs from the RunInfo table first.

I checked run‑level metadata and can confirm which projects satisfy the requirements. Below is a concise pass/fail check plus short next steps. 

## 

## **Quick pass/fail summary**

Requirements:

* Must be RNA‑Seq   
* ≥20 samples   
* ≥150 bp per fragment (i.e., paired 2×150 or single ≥150)  (must)  
* ≥40M fragments per sample (should) ⚠️ (soft)  
* Eukaryotic (human) 

**PRJNA1406761 — iPSC small‑intestine organoids**

* RNA‑Seq: **Yes**  
* Samples: **21**  
* Read length: **2×150 (avgLength≈300)**  
* Depth: **many runs ≈30–50M** → **Mostly meets (some runs \<40M)**  
* Organism: **Human**   
* Verdict: **Acceptable** (pick only runs with spots \>=40M if you want strict 40M cutoff)

**PRJNA717662 — Long‑term blood transcriptome**

* RNA‑Seq: **Yes**   
* Samples: **152**  
* Read length: **2×150**  
* Depth: **many runs ≥40M (e.g., SRR15510543 ≈70M)**  
* Organism: **Human**   
* Verdict: **Pass (meets all requirements)**

**PRJNA292477 — TOPMed / Framingham**

* RNA‑Seq: **Yes**  
* Samples: **many**  
* Read length: **2×150**  
* Depth: **typical 40–75M**  
* Organism: **Human**   
* Caveat: **dbGaP metadata restrictions** may apply for clinical fields.  
* Verdict: **Pass (requires dbGaP check for metadata use)**

**PRJNA748788 — CPTAC TNBC**

* RNA‑Seq: **Yes**  
* Samples: **\~135 experiments**  
* Read length: **mostly 2×150**  
* Depth: **many runs ≥40M (e.g., SRR20427233 ≈42M)**  
* Organism: **Human**   
* Verdict: **Pass (meets requirements)**

**PRJNA910283 — CPTAC Ovarian (HGSOC)**

* RNA‑Seq: **Yes**  
* Samples: **many**  
* Depth: **very deep (many \>40M)**  
* **Read length: many runs are 2×100 (not ≥150)**   
* Verdict: **Does NOT meet the 150 bp requirement unless you filter to only include 2×150 runs**

**PsychENCODE umbrella (PRJNA308995 / PRJNA304334)**

* RNA‑Seq: **Yes** (but *varies by subproject*)  
* Samples: **project/subproject dependent (some ≥20)**  
* Read length & depth: **mixed** (some runs 2×150 & deep; others are shorter or controlled)  
* Organism: **Human**   
* Verdict: **Mixed — needs subproject/run‑level filtering to ensure all requirements**

Important: For **TOPMed** and certain **CPTAC** items, some clinical/metadata fields are dbGaP‑controlled (raw FASTQs are often available, but metadata or clinical access may require approval).

I pulled the BioProject/SRA pages and confirmed which studies fully meet the class constraints (public, ≥20 samples, typical 2×150 reads). Below are the direct links and a concise, copy‑paste set of steps to find and verify runs for each qualifying project.

## **Datasets that meet all requirements**

### **1\) PRJNA1406761 — iPSC small‑intestine organoids**

* **BioProject:** [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1406761](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1406761)  
* **SRA Study (SRP):** [https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP665664](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP665664)  
* **Representative SRR:** SRR36938303 (example run; \~41M spots)  
* Quick verification: BioProject shows SRA experiments and run-level data consistent with **2×150** and per‑sample depth ≈30–50M.

How to find & verify runs (web \+ CLI):

1. Open the BioProject link → click **SRA** or **All experiments** → follow the SRA Run Selector.  
2. In Run Selector, click **Download** → **RunInfo Table (CSV)**. Inspect columns: Run, LibraryLayout (should be PAIRED), avgSpotLen / avgLength (\~300 for 2×150), spots, bases, Platform.  
3. (CLI) Run:  
   * esearch \+ efetch:  
     esearch \-db sra \-query "SRP665664" | efetch \-format runinfo \> PRJNA1406761\_runinfo.csv  
   * Inspect avgLength / LibraryLayout in the CSV.

### **2\) PRJNA717662 — Long‑term blood transcriptome after SARS‑CoV‑**

* **BioProject:** [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA717662](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA717662)  
* **SRA Study (SRP):** [https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP312283](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP312283)  
* **Representative SRR:** SRR15510543 (example run; \~70M spots)  
* Verification: BioProject lists **152 SRA experiments**, **GEO: GSE169687**, and run info consistent with **2×150** deep runs.

How to find & verify runs:

1. Open the BioProject → click **SRA** / **All experiments** → use Run Selector → **Download RunInfo CSV**.  
2. Check LibraryLayout \= PAIRED and avgLength ≈300 / spots for depth.  
3. (CLI) Example: esearch \-db sra \-query "SRP312283" | efetch \-format runinfo \> PRJNA717662\_runinfo.csv

## **Datasets that *mostly* meet constraints (need a quick run‑level check)**

### **PRJNA748788 — CPTAC TNBC (chemo response)**

* **BioProject:** [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA748788](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA748788)  
* **SRA Study (SRP):** [https://trace.ncbi.nlm.nih.gov/Traces?study=SRP387588](https://trace.ncbi.nlm.nih.gov/Traces?study=SRP387588)  
* **Representative SRR:** SRR20427233 (42.3M spots; NovaSeq run)  
* Note: SRA shows **135 experiments** and many **NovaSeq 6000** runs; most runs are suitable but check each run’s avgLength/Layout and dbGaP links (some clinical metadata are dbGaP‑linked).

### **PRJNA910283 — CPTAC Ovarian (HGSOC)**

* **BioProject:** [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA910283](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA910283)  
* **SRA Study (SRP):** [https://trace.ncbi.nlm.nih.gov/Traces?study=SRP422337](https://trace.ncbi.nlm.nih.gov/Traces?study=SRP422337)  
* **Representative SRR:** SRR23447671 (87M spots; **example appears to be 2×100** in metadata)  
* Note: many runs are very deep but some are **2×100** → requires run‑level filtering if 2×150 is strict.

### **PsychENCODE umbrella (PRJNA308995 / PRJNA304334) — brain RNA‑seq**

* **BioProject:** [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA308995](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA308995) (autism post‑mortem)  
* **Info:** SRA experiments present but **read length & access vary across subprojects**; many subprojects are controlled‑access. Check each subproject runinfo before selecting.

## **Exact stepwise checks (copy‑paste friendly)**

1. Web (recommended for quick inspection):  
   * Open BioProject (example): https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1406761  
   * Click **SRA** → **All experiments / Run Selector** → click **Download** → **RunInfo (CSV)**.  
   * Inspect/Filter CSV: LibraryLayout \== PAIRED and avgLength \>= 300 (indicates \~2×150) and spots \>= target depth.  
2. CLI (Entrez / EFetch):  
   * esearch \+ efetch runinfo:  
     esearch \-db sra \-query "SRP665664" | efetch \-format runinfo \> SRP665664\_runinfo.csv  
   * Then inspect in shell or pandas: check LibraryLayout, avgLength, spots, platform.  
3. Access checks: on BioProject look for **dbGaP** links or "Genotype and Phenotype (dbGaP)" — if present, clinical metadata may require dbGaP approval even if raw runs are public.  
4. Download starter SRRs: use prefetch/fasterq-dump (or datasets CLI / cloud fastq links) but pre-check run IDs from the RunInfo table first.

## **Datasets that meet all requirements**

### **1\) PRJNA1406761 — iPSC small‑intestine organoids**

* **BioProject:** [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1406761](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1406761)  
* **SRA Study (SRP):** [https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP665664](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP665664)  
* **Representative SRR:** SRR36938303 (example run; \~41M spots)  
* **Quick verification:** BioProject shows SRA experiments and run-level data consistent with **2×150** and per‑sample depth ≈30–50M.

*Find & verify runs (web \+ CLI):*

4. Open the BioProject link → click **SRA** or **All experiments** → follow the SRA Run Selector.  
5. In Run Selector, click **Download** → **RunInfo Table (CSV)**.   
6. Inspect columns: Run, LibraryLayout (should be PAIRED), avgSpotLen / avgLength (\~300 for 2×150), spots, bases, Platform.  
7. (CLI) Run:  
   * esearch \+ efetch:  
     esearch \-db sra \-query "SRP665664" | efetch \-format runinfo \> PRJNA1406761\_runinfo.csv  
   * Inspect avgLength / LibraryLayout in the CSV.

### **2\) PRJNA717662 — Long‑term blood transcriptome after SARS‑CoV‑**

* **BioProject:** [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA717662](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA717662)  
* **SRA Study (SRP):** [https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP312283](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP312283)  
* **Representative SRR:** SRR15510543 (example run; \~70M spots)  
* Verification: BioProject lists **152 SRA experiments**, **GEO: GSE169687**, and run info consistent with **2×150** deep runs.

*Find & verify runs:*

4. Open the BioProject → click **SRA** / **All experiments** → use Run Selector → **Download RunInfo CSV**.  
5. Check LibraryLayout \= PAIRED and avgLength ≈300 / spots for depth.  
6. (CLI) Example: esearch \-db sra \-query "SRP312283" | efetch \-format runinfo \> PRJNA717662\_runinfo.csv

## 

## 

## **Dataset Validation Example: PRJNA717662 (Manual Steps)**

Below is a step-by-step guide to manually validate and filter a public SRA dataset (PRJNA717662) for class requirements. This process is fully transparent and reproducible by anyone with basic command-line skills.

### 

### **1\. Download the SRA RunInfo Table (CSV)**

* **Install Entrez Direct** (if not already):  
  * macOS: brew install entrez-direct  
  * Linux: see [https://www.ncbi.nlm.nih.gov/books/NBK179288/](https://www.ncbi.nlm.nih.gov/books/NBK179288/)  
* **Download the RunInfo CSV:**

```shell
cd /Users/pitergarcia/DataScience/Semester5/BIOL550/BIOL550-Lab/project_datasets
esearch -db sra -query "PRJNA717662" | efetch -format runinfo > PRJNA717662_runinfo.csv
```

### 

### **2\. Inspect and Filter the CSV**

* **Open the CSV** in Excel, Google Sheets, or with pandas/csvkit to explore columns:  
  * Run (SRR ID)  
  * LibraryLayout (should be PAIRED)  
  * avgLength (should be ≥300 for 2×150)  
  * spots (should be ≥40,000,000)  
  * ScientificName (should be Homo sapiens)  
* **Manual filtering:**  
  * Keep only rows where:  
    * LibraryLayout \= PAIRED  
    * avgLength ≥ 300  
    * spots ≥ 40,000,000  
    * ScientificName \= Homo sapiens  
  * Randomly select 20 SRR IDs from the filtered list for downstream analysis.  
* **Automated filtering (optional, for reproducibility):**  
  * Use the provided Python script:

```py
python filter_PRJNA717662_runinfo.py PRJNA717662_runinfo.csv PRJNA717662_20srrs.txt
```

  * This will output a text file with 20 qualifying SRR IDs.

### 

### **3\. Document Your Filtering**

* Save the filtered CSV or SRR list as evidence of your selection.  
* Note the exact criteria used (see above) and the date of download.

### 

### **4\. Next Steps**

* Use the resulting SRR list for FASTQ download and FastQC analysis as described in the rest of this document.

Ran FastQC on the test FASTQs

## **Writeup: SRA Dataset Selection & Evaluation**

### **1\. PRJNA717662 — Long-term Blood Transcriptome after SARS-CoV-2**

* **Project Accession:** [PRJNA717662](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA717662)  
* **Description:** This study profiles the blood transcriptome of 152 individuals at multiple time points after SARS-CoV-2 infection, using Illumina NovaSeq 6000 (paired-end, 2×150 bp). *The goal is to understand long-term immune and gene expression changes post-infection.*  
* **Sample Size:** 152 SRA runs (all human, paired-end).  
* **Read Depth:** Most samples have 40–70 million fragments (spots), with an average spot length of \~300 (2×150 bp). This meets the class requirement for depth and read length.  
* **Case/Control:** The dataset includes both post-infection and control samples, with metadata indicating time since infection and clinical status.  
* **Strengths:**  
  * Large sample size and deep sequencing.  
  * Publicly available, no access restrictions.  
  * Well-annotated with clinical metadata.  
* **Weaknesses:**  
  * Some samples may have lower depth (\<40M), so filtering is needed.  
  * Case/control definitions may require careful review of metadata.  
    

### **2\. PRJNA292477 — TOPMed / Framingham Heart Study Transcriptome**

* **Project Accession:** [PRJNA292477](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA292477)  
* **Description:** This project is part of the NHLBI TOPMed program, profiling the transcriptome of Framingham Heart *Study participants to investigate genetic and environmental influences on cardiovascular health.*  
* **Sample Size:** Hundreds of samples (exact number depends on filtering).  
* **Read Depth:** Most samples have 40–75 million fragments, paired-end 2×150 bp reads.  
* **Case/Control:** The study includes a range of phenotypes (e.g., cardiovascular disease, controls), but some clinical metadata may be dbGaP-controlled.  
* **Strengths:**  
  * Large, well-characterized cohort with deep sequencing.  
  * Rich phenotype and longitudinal data.  
* **Weaknesses:**  
  * Some metadata is controlled-access (dbGaP), which may limit analysis.  
  * Requires careful selection of samples to match case/control definitions.

## **Questions**

1. **Metadata Access:** For datasets with dbGaP-controlled metadata (like PRJNA292477), what level of clinical information do we need for the assignment? Is it OK to proceed with just the public run-level data?  
2. **Case/Control Definitions:** How strict should we be in defining case and control groups? Is it acceptable to use broad categories if detailed metadata is unavailable?  
3. **Sample Filtering:** Is it better to maximize sample size (even if some have lower depth) or to strictly filter for depth/read length at the cost of fewer samples?  
4. **Downstream Analysis:** Are there specific analysis steps or deliverables you expect beyond FastQC (e.g., alignment, quantification, differential expression)?  
5. **Alternative Datasets:** If one dataset turns out to be problematic (e.g., access issues), is it acceptable to switch to another, or should we prepare both in parallel?  
6. **Team Collaboration:** Any advice on dividing work or reporting for group assignments?  
7. **Submission Format:** Should we include the filtered SRR lists and scripts as part of our submission, or just the writeup and summary tables?

## **Validating Chosen Datasets**

Validation criteria used here (no Human/Public requirement):

* RNA-Seq (LibraryStrategy)  
* ≥20 samples (runs)  
* LibraryLayout \= PAIRED  
* avgLength ≥ 150 bp  
* spots ≥ 40,000,000 (fragments)


**PRJNA1184725**

* BioProject: [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1184725](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP312283)  
* SRA Study (SRP544461): [https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP544461](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP312283)  
* Project Accession: PRJNA1184725  
* Description: QKI dysregulation induces extensive splicing changes in T-Cell Acute Lymphoblastic Leukemia (T-ALL).  
* Sample Size: 40 runs (total)  
* Valid samples (meet criteria above): 40/40  
* Organism (info): Homo sapiens  
* Read Depth: avgLength 297–301; spots 57.9M–221.4M  
* Strengths:  
  * Consistent, long reads (spot length \~300).  
  * All runs exceed the 40M fragment threshold.  
* Weaknesses: Disease-specific context (T-ALL) may constrain topic choices.


**PRJNA1164690**

* BioProject: [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1164690](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP312283)  
* SRA Study (SRP534424): [https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP534424](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP312283)  
* Project Accession: PRJNA1164690  
* Description: Hyperactive PI3K-delta in Th1 and Th2 differentiation (RNA-seq).  
* Sample Size: 42 runs (total)  
* Valid samples (meet criteria above): 42/42  
* Organism (info): Mus musculus (mouse)  
* Read Depth: avgLength 202; spots 123.4M–231.1M  
* Strengths:  
  * Very deep sequencing across all runs.  
  * Clean, uniform run-level metadata (paired layout, consistent length).  
* Weaknesses: Mouse model; direct translation to human biology may be limited.


**PRJNA1277581**

* BioProject: [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1277581](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP312283)  
* SRA Study (SRP592470): [https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP592470](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP312283)  
* Project Accession: PRJNA1277581  
* Description: Müller glia–microglia cross talk reprograms the Müller glia transcriptome during retina regeneration.  
* Sample Size: 30 runs (total)  
* Valid samples (meet criteria above): 30/30  
* Organism (info): Danio rerio (zebrafish)  
* Read Depth: avgLength 302; spots 50.9M–173.3M  
* Strengths:  
  * Strong depth and long reads across all runs.  
  * Clear biological focus (retina regeneration) with many samples.  
* Weaknesses: Zebrafish model; may not fit projects requiring mammalian/human context.

**PRJNA1222833**

* BioProject: [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1222833](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP312283)  
* SRA Study (SRP563445): [https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP563445](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP312283)  
* Project Accession: PRJNA1222833  
* Description: Systemic lupus cutaneous photoresponses show dysregulated epidermal inflammation and inflammatory myeloid cell infiltration.  
* Sample Size: 30 runs (total)  
* Valid samples (meet criteria above): 30/30  
* Organism (info): Homo sapiens  
* Read Depth: avgLength 179–302 (mixed); spots 98.6M–271.0M  
* Strengths:  
  * Very deep sequencing; all runs exceed 40M fragments.  
  * Good sample count for group comparisons.  
* Weaknesses:  
  * Mixed read length suggests multiple sequencing setups; can complicate uniform processing.

**PRJNA1331709**

* BioProject: [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1331709](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP312283)  
* SRA Study (SRP622479): [https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP622479](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP312283)  
* Project Accession: PRJNA1331709  
* Description: Pulmonary fibrosis after COVID-19 is characterized by airway abnormalities and elevated club cell secretory protein-16.  
* Sample Size: 34 runs (total)  
* Valid samples (meet criteria above): 34/34  
* Organism (info): Homo sapiens  
* Read Depth: avgLength 222–322; spots 66.8M–485.9M  
* Strengths:  
  * All runs exceed 40M fragments; wide depth range supports robust analyses.  
  * Good sample count (≥20) and paired layout.  
* Weaknesses:  
  * Large variability in depth (66.8M–485.9M) may require normalization/stratification decisions.

**PRJNA292477**

* BioProject: [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA292477](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP312283)  
* SRA Study (SRP058181): [https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP058181](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP312283)  
* Project Accession: PRJNA292477  
* Description: NHLBI TOPMed: The Framingham Heart Study.  
* Sample Size: 73 runs (in our downloaded RunInfo table)  
* Valid samples (meet criteria above): 34/73  
* Organism (info): Homo sapiens  
* Read Depth: avgLength 202; spots 10.0M–83.5M  
* Strengths:  
  * Large cohort context; many potential downstream phenotype-related questions.  
  * Subset of runs meets the 40M fragment depth threshold.  
* Weaknesses:  
  * Many runs are shallow (\<40M): 39/73 fail the depth cutoff.  
  * Some phenotype/clinical metadata may be linked to dbGaP (access/availability can vary).

**PRJNA717662**

* BioProject: [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA717662](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP312283)  
* SRA Study (SRP312283): [https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1184725](https://trace.ncbi.nlm.nih.gov/Traces/study/?acc=SRP312283)   
* Project Accession: PRJNA717662  
* Description: Long-term perturbation of the blood transcriptome months after SARS-CoV-2 infection.  
* Sample Size: 152 runs (total)  
* Valid samples (meet criteria above): 152/152  
* Organism (info): Homo sapiens  
* Read Depth: avgLength 287–300; spots 43.8M–108.3M  
* Strengths:  
  * Large sample size with consistent run characteristics.  
  * All runs pass the ≥40M fragment cutoff.  
* Weaknesses:  
  * Study focus is post-COVID immune/blood transcriptome; may not align with unrelated topics.

**Summary Table**

| BioProject | Organism (info) | Total Runs | Valid Runs (≥150bp, ≥40M, paired, RNA-Seq) | ≥20 Samples | ≥150bp | ≥40M Fragments | RNA-Seq | Passes All? |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| PRJNA1184725 | Homo sapiens | 40 | 40 | Yes (40) | Yes | Yes | Yes | Yes |
| PRJNA1164690 | Mus musculus | 42 | 42 | Yes (42) | Yes | Yes | Yes | Yes |
| PRJNA1277581 | Danio rerio | 30 | 30 | Yes (30) | Yes | Yes | Yes | Yes |
| PRJNA1222833 | Homo sapiens | 30 | 30 | Yes (30) | Yes | Yes | Yes | Yes |
| PRJNA1331709 | Homo sapiens | 34 | 34 | Yes (34) | Yes | Yes | Yes | Yes |
| PRJNA292477 | Homo sapiens | 73 | 34 | Yes (73) | Yes | Partial (34/73) | Yes | Partial |
| PRJNA717662 | Homo sapiens | 152 | 152 | Yes (152) | Yes | Yes | Yes | Yes |

# 

# **Write-up Feedback**

Verifying the two specific dataset claims (sample count, depth range, read length) directly from the RunInfo CSVs I downloaded, then verfied accuracy and fixes in the write-up.

* The two chosen projects/titles are correct:  
  * Mouse axon regeneration study is BioProject **PRJNA1017789**.  
  * Zebrafish retina regeneration study is BioProject **PRJNA1277581**.  
* **PRJNA1017789 (mouse)**: your write-up is *close*.  
  * Sample count: **26** (correct).  
  * “Fragments between 40 and 60M”: **almost** — RunInfo shows **40.1M–65.4M spots** (upper end is \~65M, not 60M).  
  * “Average fragment length 302 bp”: RunInfo shows **avgLength \= 302** (correct value, but see terminology note below).  
* **PRJNA1277581 (zebrafish)**: your write-up is **wrong on read depth range**.  
  * Sample count: **30** (correct).  
  * “Fragments between 40 and 60M”: **incorrect** — RunInfo shows **50.9M–173.3M spots** (many runs are far above 60M, up to \~173M).  
  * “Average fragment length 302 bp”: RunInfo shows **avgLength \= 302** (correct value, terminology note below).  
* **Terminology/interpretation fix (important):**  
  * In SRA RunInfo, **spots** is what you’ve been calling “fragments.” For paired-end data, a “spot” is typically a **read pair**.  
  * avgLength in RunInfo is **average spot length** (sum across reads in the spot). So avgLength ≈ 302 implies paired-end reads of roughly **2×151 bp**, not a physical DNA/RNA “fragment length” in the library-prep sense.

Change the two dataset summaries to report **spots** exactly as:

* PRJNA1017789: **40.1M–65.4M**  
* PRJNA1277581: **50.9M–173.3M**

**Week 5 Work Overview for BIOL550**  
Based on the files in local storage, Week 5 of BIOL550 (High Throughput Sequencing Analysis) focuses on **RNA-Seq experimental design considerations**, specifically addressing critical methodological issues in tissue sampling and mapping strategies.

## **Course Context**

According to the syllabus, Week 5 (February 9-13, 2026\) occurs after students have completed the Trapnell data set quality control and alignment exercises. During this week, students continue working on their **first stage analyses** while engaging with two key research papers.

## **Required Readings**

## **1\. Composite Structures Paper**

**"The importance of tissue specificity for RNA-seq: highlighting the errors of composite structure extractions"** by Johnson et al. (2013) examines how using composite biological structures (like whole body segments) in RNA-seq studies can lead to significant errors.  
**Key findings:**

* **False negatives are common**: 754 out of 932 genes (80.9%) differentially expressed in honey bee sting glands were not detected when analyzing whole abdomens  
* **Cross-tissue interference**: When genes show different expression patterns in multiple tissues within a composite structure, signals can "wash out" or produce misleading results  
* **Small structures are particularly problematic**: Specialized small structures like glands within larger body segments are especially prone to having their expression signals diluted  
* **Transcription factors**: 20 out of 26 differentially expressed transcription factors in sting glands were missed in whole abdomen analysis

**Practical implications**: The study strongly recommends tissue-specific extractions whenever possible, as composite extractions can obscure biologically important expression patterns.

## **2\. Combined Analysis for Dual RNA-Seq**

**"The combined analysis as the best strategy for Dual RNA-Seq mapping"** by Espindula et al. (2019) compares sequential versus combined mapping approaches when analyzing transcriptomes from two interacting organisms.  
**Key findings:**

* **Sequential analysis bias**: The first genome used in sequential mapping consistently receives more reads due to cross-mapping, leading to overestimation  
* **Combined analysis advantages**: Aligning reads to a concatenated reference genome (combining both organisms' genomes) reduces cross-mapping errors and provides more accurate read attribution  
* **Accuracy metrics**: Combined analysis showed higher accuracy and precision compared to sequential "eukaryote-first" approaches  
* **Prokaryotic data loss**: When eukaryotic genomes are mapped first (common practice), significant prokaryotic information is lost to cross-mapping

**Methodological recommendation**: Use combined reference genomes for Dual RNA-Seq experiments to minimize false assignments and preserve data from both organisms.

## **Learning Objectives**

These Week 5 readings emphasize:

* Understanding how experimental design choices (tissue selection, extraction methods) fundamentally impact RNA-seq results  
* Recognizing technical artifacts and biases in mapping strategies  
* Appreciating the importance of methodological rigor in drawing biological conclusions from sequencing data

## **Assignments**

Students are expected to:

* Submit **weekly lab reports** covering progress on first-stage quality control analyses  
* Participate in the **Thursday workshop** (February 13, 9:30-11:20 AM via Zoom) to discuss these methodological considerations  
* Continue work on their group research projects with proper consideration of tissue specificity and mapping strategy issues

## **Connection to Course Goals**

Week 5 materials bridge the gap between technical pipeline execution (quality control, alignment) and critical evaluation of experimental design, preparing students to make informed decisions about their own project analyses.

**Comprehensive Review: "The Importance of Tissue Specificity for RNA-seq"**

## **Publication Details**

**Authors:** Johnson BR, Atallah J, Plachetzki DC (University of California, Davis)  
**Journal:** BMC Genomics, 2013, 14:586  
**Article Type:** Research article

## **Research Question and Motivation**

This study addresses a critical but under-examined methodological question in RNA-seq research: **Do composite biological structures (e.g., whole body segments) provide accurate gene expression measurements, or should researchers perform tissue-specific extractions?**  
The motivation stems from the widespread practice of using composite extractions in RNA-seq studies of small organisms like insects, primarily due to logistical convenience and unawareness of potential errors. While technically easier, the authors hypothesized that this approach could lead to systematic errors in differential expression analysis.

## **Experimental Design**

## **Model System**

The researchers used honey bees (*Apis mellifera*) to compare three levels of tissue complexity:

1. **Sting gland** \- A small, specialized structure with predicted high expression of venom-related genes  
2. **Digestive tract** \- A large structure with more general functions  
3. **Whole abdomen** \- The composite structure containing both of the above plus additional organs

## **Biological Comparison**

Two developmental castes were compared:

* **Nurse bees** \- Young workers that care for brood  
* **Forager bees** \- Older workers that collect food

This caste comparison was chosen because it represents a well-characterized biological transition with known gene expression differences.

## **Technical Specifications**

**Sample preparation:**

* Two biological replicates from separate colonies  
* 30 individuals pooled per sample  
* Sting glands: Direct dissection (stinger pulls away cleanly)  
* Digestive tracts: 30 tracts pooled, then subsampled  
* Whole abdomens: Ground in liquid nitrogen, 75 mg sampled

**Sequencing:**

* Illumina HiSeq 2000, 100 bp paired-end  
* 12 million quality-controlled reads per sample  
* TruSeq v2 library preparation  
* Alignment to *Apis mellifera* genome v4 using TopHat

**Statistical analysis:** Three software packages used to ensure robustness:

* NOISeq (main results)  
* EdgeR  
* DESeq

All three methods produced consistent results, demonstrating that findings were not artifacts of analytical choices.

## **Key Findings**

## **1\. Transcriptome Coverage Problems**

The sting gland showed **larger transcriptome size than the whole abdomen** despite being contained within it. This paradox indicates that composite extractions suffer from insufficient sequencing depth to capture genes from small internal structures. The authors conclude that unless saturation analysis is performed, composite extractions will inevitably miss genes with tissue-specific or low-level expression.

## **2\. Missing Genes Due to Sampling Stochasticity**

**Cross-mapping analysis revealed:**

* Genes highly expressed in sting glands (\>100 RPKM) were completely absent from whole abdomen libraries  
* This cannot be explained by insufficient sequencing depth  
* **Cause:** Incomplete homogenization during tissue grinding

Even liquid nitrogen grinding—the standard method—produces powder grains that may still be large relative to small glands like the sting gland. This creates stochastic sampling where small structures are under-represented or entirely missed in the RNA extraction.  
**Proposed solution:** Extract RNA from much larger samples, pool the RNA, then subsample for library preparation.

## **3\. Massive False Negative Problem**

The most striking finding: **80.9% of genes differentially expressed in sting glands were not detected as differentially expressed in whole abdomens** (754 out of 932 genes).  
For digestive tracts, the problem was somewhat less severe but still substantial: **69.0% false negatives** (340 out of 493 genes).  
**Mechanistic explanation:**

* Genes differentially expressed in small structures get "diluted" by expression from surrounding tissues  
* 68.9% of sting gland genes showed higher expression ratios relative to abdomen vs. only 40.0% for digestive tract genes  
* The smaller the structure, the more severe the dilution effect

## **4\. Conflicting Differential Expression Signals**

A particularly troubling finding: **25 genes in sting glands and 7 in digestive tracts showed opposite patterns of differential expression** in composite vs. tissue-specific analyses.  
For example, a gene might be:

* Upregulated in nurses vs. foragers in the sting gland  
* Downregulated in nurses vs. foragers in the whole abdomen

This suggests complex, tissue-specific regulation that composite extractions cannot resolve. The composite signal may reflect whichever tissue contributes the most RNA, making biological interpretation essentially impossible.

## **5\. Transcription Factors Especially Affected**

**Of 26 differentially expressed transcription factors in sting glands:**

* 20 (77%) were not detected in whole abdomen analysis  
* 1 showed opposite directionality (the *Dorsal* gene)

This is particularly concerning because transcription factors control many downstream genes. Missing transcription factor expression changes could lead to fundamentally incorrect models of gene regulatory networks.  
For digestive tract: Only 8 transcription factors were differentially expressed, with 5 of 8 also detected in abdomen, and none showing opposite patterns. The smaller sample size limits conclusions, but suggests larger structures may be less problematic.

## **Strengths of the Study**

## **1\. Rigorous Experimental Design**

* Multiple biological replicates  
* Multiple analytical methods (NOISeq, EdgeR, DESeq) all showing concordant results  
* Appropriate choice of structures (small vs. large within same composite)  
* Well-characterized biological system with expected expression differences

## **2\. Comprehensive Analysis**

The authors didn't just count differential expression but investigated:

* Transcriptome coverage saturation  
* Expression level distributions  
* Gene specialization ratios  
* Specific analysis of transcription factors

## **3\. Clear Quantification of Error Rates**

Rather than just demonstrating that errors exist, the study quantifies their magnitude (80.9% false negatives for small structures), making the practical impact clear.

## **4\. Reproducible Research**

* Raw data deposited in NCBI SRA (SRP020361)  
* Detailed methods allowing replication  
* Extensive supplementary materials with gene lists

## **Limitations and Considerations**

## **1\. Single Organism Model**

The study focuses only on honey bees. While the principles should generalize, the specific error rates may vary with:

* Organism size and complexity  
* Tissue differentiation patterns  
* Sequencing depth

## **2\. Limited to Differential Expression**

The study doesn't examine:

* Alternative splicing detection  
* Novel transcript discovery  
* Other RNA-seq applications that might be differentially affected

## **3\. No Systematic Depth Analysis**

While the authors note insufficient depth, they don't systematically vary sequencing depth to determine what coverage would be needed to overcome the problems.

## **4\. Sample Size**

Only two biological replicates were used. While the high correlation (mean 98.3%) between replicates suggests consistency, more replicates would strengthen conclusions.

## **5\. Limited Exploration of Solutions**

The paper identifies problems clearly but provides limited empirical testing of solutions (e.g., they propose pooled RNA extractions but don't test this approach).

## **Biological and Technical Implications**

## **For Study Design**

**Immediate recommendations:**

* Avoid composite extractions whenever tissue-specific dissections are feasible  
* If composite extractions must be used, validate that genes of interest don't show the documented error patterns  
* For small organisms where whole-body extraction seems necessary, acknowledge substantial false negative rates

## **For Data Interpretation**

**Caution needed when:**

* Interpreting negative results (non-significant differential expression)  
* Building gene regulatory networks from composite tissue data  
* Comparing studies using different tissue extraction strategies  
* Meta-analyzing datasets with mixed approaches

## **Technical Solutions Suggested**

1. **Improved homogenization**: Multiple extraction-pooling cycles  
2. **Increased sequencing depth**: Though authors show this alone is insufficient  
3. **Validation approaches**: Demonstrate saturation of transcriptome detection

## **Broader Context and Impact**

## **Relationship to RNA-seq Best Practices**

This paper contributes to the evolving understanding of RNA-seq experimental design, complementing work on:

* Sequencing depth requirements  
* Biological replication needs  
* Batch effect management  
* Sample quality assessment

## **Relevance to Other Fields**

The principles extend beyond insect research to:

* **Developmental biology**: Where tissue interactions are studied  
* **Plant biology**: Complex organs like flowers or roots  
* **Clinical research**: Tumor samples with heterogeneous cell types  
* **Microbiome studies**: Host-microbe samples (connects to Week 5's second reading on Dual RNA-seq)

## **Methodological Evolution**

The paper represents part of the field's maturation from "RNA-seq is better than microarrays" to nuanced understanding of when and how to apply the technology appropriately.

## **Critical Assessment**

## **What the Paper Proves**

The study **definitively demonstrates** that composite structure RNA-seq:

* Generates high false negative rates for genes in small structures  
* Can produce opposite differential expression signals  
* Fails to capture complete transcriptomes from internal organs

## **What Remains Uncertain**

* **Generalizability**: Do all organisms/tissue types show similar patterns?  
* **Threshold effects**: At what structure size do problems become negligible?  
* **Solution efficacy**: Would proposed fixes actually work?  
* **Cost-benefit**: When is tissue-specific extraction worth the effort?

## **Alternative Interpretations**

One could argue that composite extraction results are "correct" in that they represent the average across all tissues. However, the authors convincingly counter that this "average" obscures biologically meaningful tissue-specific patterns and creates false negatives that mislead biological interpretation.

## **Pedagogical Value for BIOL550**

This paper is excellent for Week 5 because it:

1. **Reinforces upstream decision importance**: Shows that methodological choices made during sample collection fundamentally constrain downstream analysis  
2. **Demonstrates critical thinking**: Students learn to question "standard practices" and evaluate whether convenience-driven approaches compromise scientific validity  
3. **Connects to ongoing work**: Students working on RNA-seq projects can immediately apply these lessons to their own experimental design decisions  
4. **Illustrates technical-biological integration**: Shows how technical artifacts (incomplete homogenization, sequencing depth) create biological interpretation errors

## **Conclusions and Recommendations**

The Johnson et al. paper makes a **compelling, quantitative case against composite structure extractions** in RNA-seq. The 80.9% false negative rate for small structures is simply too high to ignore, especially given that structure-specific dissections are typically feasible with appropriate training.  
**The paper's core message is clear:** Methodological convenience should not trump scientific accuracy. When tissue-specific extraction is possible, it should be the default approach.  
**For BIOL550 students:** This paper should prompt careful consideration of tissue sampling strategies in your own projects, recognition that negative results may reflect technical limitations rather than biological reality, and appreciation that experimental design decisions have cascading effects throughout analysis and interpretation.[BIOL550-Syllabus-High-Throughput-Sequencing-Analysis.pdf+1](https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_416f7a35-e40e-4375-a80e-9a5ae07af411/9237f744-6ecd-4a66-bd1f-2b9ca9d13ea2/BIOL550-Syllabus-High-Throughput-Sequencing-Analysis.pdf)

# **Comprehensive Review: "The Combined Analysis as the Best Strategy for Dual RNA-Seq Mapping"**

## **Publication Details**

**Authors:** Espindula E, Sperb ER, Bach E, Passaglia LMP (Universidade Federal do Rio Grande do Sul, Brazil)  
**Journal:** Genetics and Molecular Biology, 2019, 42(4):e20190215  
**Article Type:** Original research article

## **Research Question and Context**

This study addresses a critical bioinformatics challenge in **Dual RNA-Seq experiments**: When RNA is extracted from two interacting organisms simultaneously (e.g., host and pathogen, plant and symbiont), how should researchers computationally separate reads belonging to each organism?  
The paper compares two mapping approaches:

1. **Sequential analysis** \- Map reads to one genome first, then map unmapped reads to the second genome  
2. **Combined analysis** \- Map all reads to a concatenated reference (both genomes merged), then sort by attribution

**Why this matters:** Dual RNA-Seq enables simultaneous study of both partners in biological interactions, but computational read assignment directly impacts which genes appear expressed and at what levels. Methodological choice fundamentally shapes biological conclusions.

## **Experimental Design**

## **Simulated Dual RNA-Seq Experiment**

The researchers created a "Chimera Library" by mixing RNA-seq data from two independent experiments:  
**Bacterial component:**

* *Herbaspirillum seropedicae* (nitrogen-fixing bacterium)  
* \~44 million reads after filtering

**Eukaryotic component:**

* *Zea mays* (maize) endosperm tissue  
* \~22 million reads after filtering

**Combined Chimera Library:** \~66 million reads total  
This approach is elegant because the researchers knew the "ground truth" \- which reads actually belong to which organism \- allowing precise measurement of mapping errors.

## **Real Dual RNA-Seq Validation**

To confirm simulated results, they analyzed two authentic Dual RNA-Seq experiments:

1. **Soybean-*Bradyrhizobium* symbiosis** (authors' unpublished data)  
   * Two *Glycine max* varieties (EMBRAPA 48, BR 16\)  
   * Symbiotic bacterium *Bradyrhizobium elkanii* SEMIA 587  
   * 5-9 million reads per library  
   * Ion Torrent single-end sequencing  
2. **Maize-*Fusarium* pathogen interaction** (Lanubile et al., 2014 data)  
   * *Zea mays* susceptible variety CO354  
   * Fungal pathogen *Fusarium verticillioides*  
   * 74-83 million reads per library  
   * Illumina paired-end sequencing

## **Mapping Strategies Compared**

**Sequential Analysis \- Eukaryote 1st** (Figure 1A):

1. Map reads to maize genome  
2. Count reads that map → "maize library"  
3. Take unmapped reads → map to bacterial genome  
4. Count reads that map → "bacterial library"

**Sequential Analysis \- Prokaryote 1st** (Figure 1B):

1. Map reads to bacterial genome first  
2. Then map unmapped reads to maize genome  
   (Reverse order to test order-dependency)

**Combined Analysis** (Figure 1C):

1. Concatenate both reference genomes into single file  
2. Map all reads to this "Combined Reference"  
3. Extract reads attributed to each genome into separate files  
4. Count reads for each organism using appropriate annotations

## **Technical Parameters**

* CLC Genomics Workbench 8.0 for all analyses  
* Mapping parameters: 0.8 minimum length fraction, 0.8 minimum similarity fraction  
* Also tested more stringent: 0.9 minimum length fraction  
* Maximum 5 mapping hits allowed  
* Intergenic regions excluded from counting

## **Key Findings**

## **1\. Massive Cross-Mapping Problem**

When individual libraries were mapped to the wrong genome to quantify cross-mapping:  
**Bacterial reads mapping to maize genome:**

* **13,847,693 reads** (\~31% of bacterial library\!)  
* These reads "look like" maize genes to the aligner

**Maize reads mapping to bacterial genome:**

* 7,659 reads (\<0.03% of maize library)  
* Much less severe due to maize's larger, more complex genome

**Critical insight:** Bacteria suffer disproportionately from cross-mapping because their smaller genomes have conserved metabolic genes similar to eukaryotic homologs.

## **2\. Combined Reference Dramatically Reduces Cross-Mapping**

When the same libraries were mapped to the Combined Reference (both genomes present):  
**From bacterial library:**

* Only **779,556 reads** misassigned to maize (94% reduction\!)  
* 43,661,668 reads correctly assigned to bacteria

**From maize library:**

* Only **394 reads** misassigned to bacteria (95% reduction)  
* 22,200,465 reads correctly assigned to maize

**Explanation:** When both genomes are present, the aligner can compare alignment quality to both references simultaneously and assign reads to the genome with better matches. Sequential analysis lacks this comparison ability.

## **3\. Sequential Analysis Order Massively Affects Results**

Using the Chimera Library with sequential approaches:  
**Eukaryote 1st (standard practice):**

* Maize: 36,048,568 reads (should be \~22 million)  
* Bacteria: 30,621,615 reads (should be \~44 million)  
* **Result:** Maize inflated by 63%, bacteria deflated by 31%

**Prokaryote 1st:**

* Bacteria: 44,476,967 reads (correct\!)  
* Maize: 22,193,216 reads (correct\!)  
* **Result:** Accurate when bacteria mapped first

**Combined Analysis:**

* Bacteria: 43,662,066 reads (99.8% accurate)  
* Maize: 22,980,017 reads (103.5% \- slight over-attribution)  
* **Result:** Intermediate, unbiased by order

**Critical finding:** The first genome in sequential analysis receives ALL cross-mapping reads. Since most studies map eukaryote first (the "organism of interest"), prokaryotic information is systematically lost.

## **4\. Cross-Mapped Reads Hit Real Genes**

The \~6 million bacterial reads incorrectly mapped to maize didn't just hit random regions:

* **23,216 maize CDS (coding sequences)** received bacterial reads  
* These included kinases, phosphatases, ribosomal proteins  
* Many hypothetical/uncharacterized proteins also affected

**Biological implication:** These are real, potentially important genes being inflated (in eukaryote) or lost (from prokaryote) due to methodology.  
When combined reference was used:

* Only **531,276 reads** cross-mapped (92% reduction)  
* Only **3,298 maize CDS** affected (86% reduction)

## **5\. Accuracy Metrics Favor Combined Analysis**

The authors calculated sensitivity, specificity, accuracy, and precision for each method:  
**Sequential \- Eukaryote 1st:**

* Accuracy: 0.7923 (79.2%)  
* Precision: 0.6159 (61.6%)  
* **Worst performance**

**Sequential \- Prokaryote 1st:**

* Accuracy: 0.9999 (99.99%)  
* Precision: 1.0000 (100%)  
* **Excellent, but order-dependent**

**Combined Analysis:**

* Accuracy: 0.9883 (98.8%)  
* Precision: 0.9661 (96.6%)  
* **Nearly as good, but order-independent**

**Interpretation:** While "Prokaryote 1st" achieved highest accuracy, this approach is counterintuitive (researchers typically care more about the host) and inconsistent across the field. Combined analysis provides nearly equivalent accuracy without order bias.

## **6\. Real Experiments Confirm Simulated Results**

**Soybean-*Bradyrhizobium* experiment**:  
When eukaryote mapped first:

* \<2% of reads attributed to bacteria

When prokaryote mapped first:

* 3% of reads attributed to bacteria

Combined analysis:

* Intermediate (\~2-3%), consistent across both soybean varieties

**Maize-*Fusarium* experiment**:  
Results less dramatic due to paired-end sequencing (both organisms eukaryotic), but combined analysis still showed intermediate values between the two sequential approaches.  
**Key validation:** Real biological data behaves exactly like simulated data, confirming that cross-mapping artifacts are genuine experimental concerns, not simulation artifacts.

## **7\. Multi-Mapped Reads Differ by Organism**

Reads mapping to multiple locations within their genome:  
**Bacteria (*Herbaspirillum*):**

* \<1% of CDS reads are multi-mapped  
* Small, streamlined genome with few duplications

**Eukaryotes (Maize, Soybean):**

* 4-7% of CDS reads are multi-mapped  
* Large genomes with gene families, duplications, repeats

**Soybean (extreme case):**

* Up to **96% multi-mapped reads** in some replicates\!  
* Polyploid genome (recent whole-genome duplication)

This highlights additional complexity in eukaryotic RNA-seq beyond cross-organism mapping.

## **Methodological Strengths**

## **1\. Clever Experimental Design**

Using separately sequenced organisms mixed *in silico* creates perfect "ground truth" for measuring error rates—impossible with real Dual RNA-seq where true organism assignment is unknown.

## **2\. Multiple Validation Levels**

* Simulated data (known truth)  
* Two real experiments (biological validation)  
* Different sequencing technologies (Ion Torrent vs. Illumina)  
* Different interaction types (symbiosis vs. pathogenesis)  
* Different organism combinations (plant-bacteria, plant-fungus)

This multi-level validation strongly supports generalizability.

## **3\. Bidirectional Sequential Analysis**

Testing both "Eukaryote 1st" and "Prokaryote 1st" definitively proves order-dependency rather than one method being universally better.

## **4\. Quantitative Error Characterization**

The paper doesn't just say "combined is better"—it quantifies:

* Exact numbers of cross-mapped reads  
* Specific genes affected  
* Accuracy/precision metrics  
* Percentage reductions in errors

## **5\. Practical Implementation Guide**

The authors provide step-by-step instructions for CLC Genomics Workbench, making the method accessible to researchers without advanced bioinformatics skills. They even include supplementary Figure S3 showing the exact interface steps.

## **6\. Appropriate Statistical Framework**

Using sensitivity, specificity, accuracy, and precision (Table S1) applies diagnostic test metrics to bioinformatics, providing standardized performance measures.

## **Limitations and Considerations**

## **1\. Limited Sample Sizes**

* Soybean-*Bradyrhizobium*: Only 2 biological replicates per variety  
* Authors acknowledge this limitation and note that Schurch et al. (2016) recommend ≥3 replicates  
* More replicates might reveal statistically significant differences obscured by high variance

## **2\. Software-Specific Implementation**

* Analysis performed exclusively in CLC Genomics Workbench  
* Other popular tools (STAR, HISAT2, Salmon) not tested  
* Combined analysis feasible in any aligner supporting custom references, but specific error rates may vary

## **3\. Parameter Exploration Limited**

* Tested only two parameter sets (0.8/0.8 and 0.9/0.8 min length/similarity)  
* More stringent parameters (0.9/0.8) reduced overall mapped reads by \~3 million, decreasing CDS detection  
* Optimal parameters for different organism pairs not systematically explored

## **4\. Eukaryote-Prokaryote Focus**

* All experiments involved bacteria or fungi with plants/animals  
* Virus-host, eukaryote-eukaryote, or bacteria-bacteria interactions not tested  
* Principles should generalize, but error magnitudes may differ

## **5\. Genome Similarity Not Systematically Varied**

* Maize and *Herbaspirillum* are quite divergent  
* Would closer relatives (e.g., parasitic protists and animal hosts) show worse cross-mapping?  
* What about endosymbionts with highly reduced genomes containing many horizontally transferred host genes?

## **6\. Annotation Quality Not Addressed**

* Assumes both organism genomes are well-annotated  
* Poorly annotated genomes might behave differently  
* Novel transcripts, non-coding RNAs not examined

## **7\. Computational Cost Not Discussed**

* Combined analysis requires merging genomes and additional extraction steps  
* Time/memory requirements vs. sequential not compared  
* For large eukaryotic genomes, computational demands may matter

## **8\. Ambiguous Read Handling**

* Reads aligning equally well to both genomes are removed  
* Could these contain biological signal (e.g., horizontally transferred genes, convergent evolution)?  
* No exploration of retaining/analyzing ambiguous reads separately

## **Biological and Technical Implications**

## **For Dual RNA-Seq Study Design**

**Immediate recommendations:**

1. **Always use combined analysis** when studying eukaryote-prokaryote interactions  
2. **If using sequential analysis**, map prokaryote first (but acknowledge this counterintuitive choice)  
3. **Report methodology clearly**: State which genome was mapped first and whether cross-mapping was assessed  
4. **Consider paired-end sequencing**: Appears to reduce cross-mapping issues (Fusarium-maize results)

## **For Data Interpretation**

**Reading existing literature critically:**

* **Papers mapping eukaryote first:** Prokaryotic expression likely underestimated by \~30%  
* **Negative prokaryotic results:** May be false negatives due to read loss  
* **Strongly expressed eukaryotic genes:** May be artificially inflated by prokaryotic reads  
* **Cross-study comparisons:** Methodological differences confound biological differences

**Genes at highest risk of artifacts:**

* Conserved metabolic enzymes (glycolysis, TCA cycle, translation machinery)  
* Ribosomal proteins  
* Kinases/phosphatases  
* Stress response genes

## **Relationship to Week 5's First Paper**

**Complementary Lessons:**  
Johnson et al. (2013) showed **spatial** complexity (composite vs. tissue-specific extraction) causes errors.  
Espindula et al. (2019) showed **computational** complexity (multi-organism read assignment) causes errors.  
**Unified message:** Biological complexity requires methodological sophistication. Convenience-driven shortcuts (composite extraction, sequential mapping) introduce systematic biases that obscure biological truth.  
**For BIOL550 students:** Week 5 emphasizes that RNA-seq accuracy depends on choices made both in the lab (tissue selection) and at the computer (mapping strategy).

## **Technical Evolution Implications**

**Field standards needed:**

* Westermann et al. (2012) originally suggested combined analysis, yet sequential remains common  
* This paper provides quantitative justification for methodological standardization  
* Journals should require Dual RNA-seq papers to report and justify mapping strategy

**Tool development needs:**

* Dedicated Dual RNA-seq aligners could automate combined analysis  
* Better handling of ambiguous reads  
* Built-in cross-mapping diagnostics  
* Visualization tools for dual-organism data

## **Connection to Broader RNA-seq Issues**

**Parallelsto other mapping challenges:**

* **Alternative splicing:** Multiple isoforms create ambiguous read assignments  
* **Allele-specific expression:** Distinguishing maternal vs. paternal transcripts in diploids  
* **Paralog discrimination:** Gene families with high similarity  
* **Metatranscriptomics:** Dozens to thousands of organisms in microbial communities

All share the core challenge: **Assigning reads to the correct biological source when multiple similar sequences exist**.

## **Practical Workflow Recommendations**

## **For Students Conducting Dual RNA-Seq (BIOL550 context)**

**Step-by-step combined analysis:**

1. **Obtain reference genomes** for both organisms (NCBI, JGI, Ensembl)  
2. **Concatenate genomes** (Linux: cat genome1.fasta genome2.fasta \> combined.fasta)  
3. **Index combined reference** in your aligner (Bowtie2, STAR, etc.)  
4. **Map reads** to combined reference  
5. **Extract organism-specific reads** (use SAM flags, contig names, or CLC's interface)  
6. **Count reads separately** for each organism using appropriate annotations  
7. **Report cross-mapping statistics** in your paper/report

**Diagnostic checks:**

* Count reads that map equally well to both genomes → remove or analyze separately  
* Identify top genes receiving cross-mapped reads → verify biological plausibility  
* Compare combined vs. sequential results → quantify bias magnitude  
* Check if key findings depend on methodology → red flag if they do

## **Red Flags in Published Papers**

When reading Dual RNA-seq literature, be skeptical if:

* Mapping methodology not described  
* Only eukaryote results discussed (prokaryote data "not shown")  
* Sequential analysis used without justification  
* Cross-mapping not assessed  
* Unexpectedly low prokaryotic read counts without explanation  
* No discussion of methodological limitations

## **Critical Assessment**

## **What the Paper Proves**

The study **definitively demonstrates** that:

1. **Sequential analysis is order-biased**: First genome receives cross-mapping reads  
2. **Combined analysis reduces cross-mapping**: \~90-95% reduction in errors  
3. **Standard practice is suboptimal**: "Eukaryote 1st" systematically underestimates prokaryotes  
4. **Problem is generalizable**: Consistent across multiple organism pairs and sequencing platforms

## **What Remains Uncertain**

* **Optimal parameters**: Best alignment stringency for different organism pairs  
* **Genome quality effects**: How incomplete assemblies affect results  
* **Computational efficiency**: Speed/memory trade-offs of combined vs. sequential  
* **Ambiguous read biology**: Whether equally-mapping reads contain signal vs. noise  
* **Eukaryote-eukaryote interactions**: Whether similar magnitude errors occur

## **Alternative Perspectives**

**Devil's advocate arguments:**

1. **"Sequential Prokaryote 1st works great"**: True, but requires researchers to prioritize microbe over host—rarely the biological question  
2. **"Cross-mapped reads are real contamination"**: Possible, but authors show they map to functionally relevant genes (kinases, ribosomal proteins), not random junk  
3. **"Combined analysis is just harder"**: Authors counter by providing user-friendly CLC workflow. Yes, it's one extra step, but scientific accuracy merits the effort  
4. **"Differences are small"**: 30% underestimation of prokaryotic transcriptome is NOT small—it fundamentally alters biological interpretation

## **Pedagogical Value for BIOL550**

This paper is excellent for Week 5 because it:

## **1\. Reinforces Computational Rigor**

Students learn that bioinformatics choices aren't arbitrary—they have measurable, quantifiable consequences for biological conclusions.

## **2\. Demonstrates Scientific Method**

* Hypothesis: Sequential analysis causes order-dependent bias  
* Prediction: First genome will receive more reads  
* Test: Compare all combinations systematically  
* Validation: Confirm with real data  
* Classic hypothesis-driven science applied to bioinformatics

## **3\. Connects to Ongoing Projects**

Students working on RNA-seq projects (per syllabus Week 5 activities) can:

* Evaluate whether their data involves multiple organisms  
* Assess cross-mapping in their own datasets  
* Apply combined analysis if relevant  
* Report methodology rigorously in final papers

## **4\. Critical Literature Consumption**

Students learn to:

* Question methodological details in papers  
* Recognize that "standard practice" may be flawed  
* Evaluate whether authors adequately justify their choices  
* Distinguish technical artifacts from biological phenomena

## **5\. Complements First Paper Beautifully**

Together, Johnson et al. (composite structures) and Espindula et al. (Dual RNA-seq mapping) teach that **errors can occur at every step**:[BIOL550-Week5\_CompositeStructures.pdf+1](https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_416f7a35-e40e-4375-a80e-9a5ae07af411/be043332-5598-426b-bf98-1da5c7b541b4/BIOL550-Week5_CompositeStructures.pdf)

* Sample collection (tissue choice)  
* RNA extraction (homogenization)  
* Library preparation (rRNA depletion, mRNA enrichment)  
* Sequencing (depth, read length, paired vs. single)  
* **Bioinformatics (mapping strategy)**

Students gain a holistic view of RNA-seq vulnerabilities.

## **Conclusions and Recommendations**

The Espindula et al. paper makes a **compelling, quantitative case for combined analysis in Dual RNA-Seq experiments**. The 30% loss of prokaryotic information when using standard "Eukaryote 1st" sequential mapping is scientifically unacceptable, especially given that combined analysis is straightforward to implement.  
**The paper's core messages:**

1. **Methodology profoundly shapes results**: 13 million bacterial reads can disappear based solely on computational workflow choice  
2. **Standard practice isn't always best practice**: The field's convention (eukaryote-first sequential mapping) is demonstrably suboptimal  
3. **Validation matters**: Simulated and real data agreement proves these aren't theoretical concerns—they affect actual biological experiments  
4. **Transparency is essential**: Authors must report and justify mapping strategies so readers can assess result validity

**For BIOL550 students:**  
This paper should prompt you to:

* **Carefully consider** how your project's bioinformatics choices affect results  
* **Report methodology transparently** in your final papers (due Week 16\)  
* **Validate computational approaches** when possible (e.g., try multiple methods, compare results)  
* **Think critically** about whether observed patterns reflect biology or technical artifacts  
* **Appreciate** that bioinformatics is not a "black box"—understanding the algorithms matters for interpreting results

Together with the composite structures paper, this week's readings establish that **experimental design and computational methodology are inseparable**. Quality RNA-seq science requires rigor at every step, from tissue dissection through final statistical analysis.[BIOL550-Week5\_CompositeStructures.pdf+2](https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_416f7a35-e40e-4375-a80e-9a5ae07af411/be043332-5598-426b-bf98-1da5c7b541b4/BIOL550-Week5_CompositeStructures.pdf)

---

## Trapnell final — differential expression results

Reference audio (lab session):  
- `Semester5/2026-02-12 09_37_36.mp3` → `output/transcribe/biol550_2026-02-12_09-37-36.txt` (and `output/transcribe/biol550_2026-02-12_09-37-36.json`)  
- `Semester5/2026-02-12 09_35_11.mp3` → `output/transcribe/biol550_2026-02-12_09-35-11.txt` (and `output/transcribe/biol550_2026-02-12_09-35-11.json`)

### What to submit (practical “differential expression results” package)

The lab session mostly emphasized **getting alignments + cuffdiff finished**, not an exact file-by-file “submit list”. Based on the Trapnell Step 3 workflow in `Semester5/BIOL550/BIOL550-Lab/task_n_desc.md`, a safe submission bundle for “differential expression results” is:

1. **Your cuffdiff output folder** (zip it if needed), including at minimum:
   - `gene_exp.diff` (primary)
   - `isoform_exp.diff` (if requested / if you ran it)
2. **Your exact cuffdiff command(s)** used (copy/paste), including labels/replicate grouping and reference FASTA+GTF paths.
3. **A small results summary** (1 page is usually enough):
   - What comparison you ran (e.g., `C1 vs C2`)
   - How you defined significance (typically `q_value <= 0.05`)
   - Count of significant genes + top ~10 genes (with `log2(fold_change)`, `q_value`)
   - One visualization (volcano or MA plot) and 2–3 sentences interpreting it

If the myCourses prompt is stricter than this, paste it here and I’ll map it to the exact outputs.

### Lab session summary (Feb 12, 2026)

- **Library type gotcha:** for stranded RNA-seq, specify `--library-type fr-firststrand` where relevant (they discussed this as a common fix when tools complain / results look wrong).
- **Server/tooling gotcha (Tuxedo suite):** due to Python version conflicts, use the wrapper scripts ending in `_ENV` (e.g., for `cuffmerge`) rather than the plain command when both exist.
- **Deadlines mentioned (relative → absolute):**
  - Alignments: “done by next week Thursday” → **Thu, Feb 19, 2026**
  - Differential expression (cuffdiff): “ideally done next week” → **week of Feb 16, 2026** (practically, aim for **Feb 19, 2026**)
- **Project dataset selection heuristics (from breakout-room guidance):**
  - Class baseline requirement discussed: **≥20 runs** and **≥40M reads per sample** (but he noted these can flex depending on dataset/storage).
  - For DE, **≥3 samples per condition** is the minimum to estimate variance (so ≥6 total if 2 conditions).
  - Time-series / many-condition designs are harder; consider **subsetting** to a simpler comparison if needed.

---

## Class prep — Wed, Feb 18, 2026

**Before class (15–30 min)**
- Skim `Semester5/BIOL550/BIOL550-Lab/task_n_desc.md` and note where you are in the Trapnell workflow (alignment → cuffmerge → cuffquant → cuffdiff).
- Be ready to explain (1–2 sentences each) what each output represents:
  - STAR: where BAMs come from and why `XS` tags matter for `cuffdiff`
  - cuffdiff: where `gene_exp.diff` lives and what `q_value` means (FDR-adjusted)
- Re-open the “Trapnell final — differential expression results” section above and confirm you know exactly what you’re submitting (zip of `cuffdiff` output + command + short summary).

**Bring to class (so you can get useful feedback fast)**
- Your current submission artifact name/path (e.g., `lab3/cuffdiff_results.zip`) and the key result file you’re summarizing (`gene_exp.diff`).
- 2–3 questions you want answered (e.g., “Is `q_value <= 0.05` the expected cutoff?”, “Which plot do you prefer for the report?”, “Any must-include cuffdiff outputs besides `gene_exp.diff`?”).
- If you’re still selecting a project dataset: the candidate dataset(s) + run count + rough read depth per sample + conditions/replicates you plan to compare.
