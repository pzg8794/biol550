Purpose
-------
Small, reproducible test SRR lists (3 runs each) and a portable script to download runs and run FastQC for quick verification.

Notes
-----
- The server may not have `fasterq-dump` (sra-tools) or `ncbi-datasets` installed. The script attempts sensible fallbacks and will tell you what to install if nothing is found.
- All SRR lists contain runs that meet the course constraints where possible (paired, ~2×150, ≥40M spots when available).

Files
-----
- `*_test_srlist.txt` — one SRR per line (3 SRRs chosen as representative).
- `download_and_run_fastqc.sh` — download SRRs, run FastQC, and create a zip of FastQC outputs.

Quick example
-------------
# Download & FastQC for PRJNA717662
./download_and_run_fastqc.sh PRJNA717662_test_srlist.txt -o ~/starter_pipeline/test_out -t 4

If you want, I can run these on `sequoia` for you (I previously ran FastQC on synthetic test files). If the server lacks `fasterq-dump` I can either install it into a per-user conda env or use `ncbi-datasets` if present.
