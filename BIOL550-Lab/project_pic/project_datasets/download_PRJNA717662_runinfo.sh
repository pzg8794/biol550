# Download PRJNA717662 RunInfo CSV
# This script downloads the RunInfo CSV for PRJNA717662 (Long-term blood transcriptome after SARS-CoV-2) from NCBI SRA using Entrez Direct.
# Output: PRJNA717662_runinfo.csv in the project_datasets directory

# Usage: bash download_PRJNA717662_runinfo.sh

esearch -db sra -query "PRJNA717662" | efetch -format runinfo > PRJNA717662_runinfo.csv
