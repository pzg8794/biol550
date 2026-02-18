# Starter Pipeline — Quick test + Snakemake workflow 🔧

This folder contains two ways to run a small reproducible RNA-seq starter pipeline for 3–5 SRR samples: a simple Bash script for quick tests and a Snakemake workflow for reproducible runs.

Contents
- `run_quick.sh` — quick Bash script: download SRRs, run `fastp` → `FastQC` → `MultiQC` → `salmon` quant.
- `Snakefile` — Snakemake workflow to run the same steps reproducibly.
- `config.yaml` — sample SRR list used by the Snakefile.
- `envs/environment.yml` — Conda environment (recommended for Snakemake runs).

Requirements
- sra-tools (`prefetch`/`fasterq-dump`) or `ascp` configured
- fastp
- fastqc
- multiqc
- salmon (>=1.0)
- snakemake (if running the workflow)

Quick (Bash) usage (fast, good for 3–5 SRRs)
1. Make script executable: `chmod +x run_quick.sh`
2. Run: `./run_quick.sh SRR36938303 SRR15510543 SRR20427233`
3. Output directories: `data/fastq`, `qc/fastp`, `qc/fastqc`, `quant/salmon`

Snakemake usage (reproducible)
1. Create conda env: `conda env create -f envs/environment.yml` (or install tools with conda)
2. Activate env with `conda activate snakemake` or ensure `snakemake` is on PATH
3. Run: `snakemake -j 4 --use-conda`

Notes
- The pipeline can build a Salmon index automatically. Provide a transcriptome FASTA by setting `transcriptome_fasta: /path/to/transcripts.fa` in `config.yaml` and Snakemake will build the index as part of the workflow (if the index directory does not already exist):

  ```bash
  snakemake -j 4 --use-conda --config transcriptome_fasta=/path/to/transcripts.fa
  ```

  Alternatively, build the index manually with the included helper script:

  ```bash
  bash build_index.sh /path/to/transcripts.fa [index_dir]
  # default index_dir: data/salmon_index
  ```

- The `run_quick.sh` script uses `fasterq-dump` from SRA Toolkit; if you prefer ENA/Cloud reads, replace download steps with direct URLs.

If you'd like, I can: create an automatic index-build rule in the Snakefile and/or add a small Jupyter notebook that runs the pipeline and summarizes QC plots. Which would you prefer next? (automatic index build / notebook / both)