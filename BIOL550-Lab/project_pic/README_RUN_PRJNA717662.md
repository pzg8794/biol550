Purpose
-------
This file explains how to copy the improved script to `sequoia` and run the PRJNA717662 (3 SRR) test there.

Steps to run on sequoia
-----------------------
1. Copy the script to sequoia (run from your Mac):
   scp ~/DataScience/Semester5/BIOL550/BIOL550-Lab/run_PRJNA717662_improved.sh pzg8794@sequoia:/home/pzg8794/BIOL550-Lab/

2. SSH into sequoia (you're already logged in):
   ssh -X pzg8794@sequoia.rit.edu

3. Make it executable and run in background:
   chmod +x ~/BIOL550-Lab/run_PRJNA717662_improved.sh
   nohup ~/BIOL550-Lab/run_PRJNA717662_improved.sh > ~/BIOL550-Lab/PRJNA717662_run.log 2>&1 &

4. Monitor progress:
   tail -f ~/BIOL550-Lab/PRJNA717662_run.log
   (or) tail -n 40 ~/BIOL550-Lab/PRJNA717662_run.log

5. When finished, check outputs:
   ls -lh ~/BIOL550-Lab/fastqc_output/PRJNA717662/
   unzip -l ~/BIOL550-Lab/fastqc_output/PRJNA717662/qc_PRJNA717662.zip

Notes
-----
- The script uses `fasterq-dump` if available, otherwise `/usr/local/bin/datasets`.
- We observed that the installed `datasets` CLI on sequoia may not support the `sra` download subcommand; in that case the newer `datasets` or `sra-tools` may not be available.
- The `run_PRJNA717662_fixed.sh` script includes a **ENA HTTPS fallback** (downloads reads directly from ENA) so you do not need `sra-tools` or the `datasets` SRA subcommand to run the test.
- Don’t paste passwords here. If you want me to continue after you run the script, paste the last log lines and I’ll verify and prepare MultiQC / a final small hand-in ZIP.
