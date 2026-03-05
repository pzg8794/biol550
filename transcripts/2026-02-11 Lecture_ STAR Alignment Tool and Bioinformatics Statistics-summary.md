# 02-11 Lecture  STAR Alignment Tool and Bioinformatics Statistics

**Source:** `transcripts/02-11 Lecture_ STAR Alignment Tool and Bioinformatics Statistics-transcript.txt`  
**Date (from filename):** 02-11

## Summary (course notes)
- **Main focus:** Lecture notes focused on the RNA-seq workflow and interpretation of key analysis/QC outputs.
- **Key takeaways:**
  - STAR is resource-heavy; plan runs around shared usage and use STAR summary outputs (unique/multi/unmapped) as alignment QC metrics.
- **Action items / follow-ups:**
  - Capture STAR mapping summary metrics (unique/multi/unmapped) for downstream interpretation and troubleshooting.

## Themes detected (quick scan)
- STAR aligner; weekly report

## Transcript highlights (auto-extracted)
- Information you can get there from star. Including mapped to multiple loci, what does that look like? What does it mean if it's mapped to multiple loci? What do we call it? It's multi-read. Yep, that's how many multi-reads we had, 84,000. Which is only 0.73%, that's pretty good. That's also because this is a synthetic dataset. In reality we never get that. Mapped to too many loci is a smaller p…
- That might be something good for your weekly reports. All right, we are getting down to the last five minutes for today. How are we doing? For uh Tom, Q just press Q and it'll quit out. It's real easy. Yep. How to run the next alignment? Oh, I wouldn't run until after the first one finishes. Oh, it doesn't. But if you talk, You can look to see which process has your user ID on the left and matc…
- That's probably your process. It won't tell you what percent from this, but it'll tell you the product. And, it should take about the same amount of time as the previous one did. So, on the right hand side you should see start. And try to run on the left hand side here is something else. There you go. So I'm going to go back here and bring up.

## Definitions (optional, add if used in your write-ups)
- **FastQC module:** A named QC check (PASS/WARN/FAIL) computed per FASTQ file.
- **Adapter signal:** Evidence read-through captured adapter/technical sequence; typically requires adapter clipping (not quality trimming).
- **Duplication levels:** Fraction of reads that are duplicates; in RNA-seq this can reflect high expression, not just PCR artifacts.
- **q-value / FDR:** Multiple-testing–adjusted significance metric; use with a cutoff (e.g., 0.05) for DE calls.
