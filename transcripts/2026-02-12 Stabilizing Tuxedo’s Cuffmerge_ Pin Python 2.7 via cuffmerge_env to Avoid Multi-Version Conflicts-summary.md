# 02-12 Stabilizing Tuxedo’s Cuffmerge  Pin Python 2.7 via cuffmerge env to Avoid Multi-Version Conflicts

**Source:** `transcripts/02-12 Stabilizing Tuxedo’s Cuffmerge_ Pin Python 2.7 via cuffmerge_env to Avoid Multi-Version Conflicts-transcript.txt`  
**Date (from filename):** 02-12

## Summary (course notes)
- **Main focus:** Lecture notes focused on the RNA-seq workflow and interpretation of key analysis/QC outputs.
- **Key takeaways:**
  - Server etiquette: coordinate concurrency, monitor load (e.g., `who`, `top`), and prefer shared/group directories to reduce duplication and permission issues.
  - For differential expression, use multiple-testing correction (q-value/FDR); interpret results with both effect size (log2FC) and significance (adjusted p).
- **Action items / follow-ups:**
  - Coordinate downloads/alignments so the group is not saturating bandwidth/CPU at the same time; document who is running what.

## Themes detected (quick scan)
- Tuxedo (cufflinks/cuffdiff); server coordination

## Transcript highlights (auto-extracted)
- The version of Python. That's it, yeah. So remember I was telling you there's sometimes versioning issues. Uh, There are multiple versions of Python on the server, and we're getting conflicts sometimes to keep the Tuxedo package running uh because cuffmerge specifically works with Python 2. 7 does not work with newer versions. Um doesn't work with older versions. I had to explicitly tell it whe…
- Perl does the same thing. All your Perl scripts, you can actually explicitly tell it where to find Perl. Partly, that's because there might be multiple versions on the server, and you might not be running the version you think you are. So that's been resolved. When you go to run cuffmerge, this is what I was posting about this morning. Again, you'll see there's two. Run the one with the undersc…
- So, just make sure you're using the correct file. It was sort of a fix to make things work for the tuxedo package on the server and to keep it limping along. It's unlike support at this point, so that's where we are. All right, I got some chats in here. So vent oh.

## Definitions (optional, add if used in your write-ups)
- **FastQC module:** A named QC check (PASS/WARN/FAIL) computed per FASTQ file.
- **Adapter signal:** Evidence read-through captured adapter/technical sequence; typically requires adapter clipping (not quality trimming).
- **Duplication levels:** Fraction of reads that are duplicates; in RNA-seq this can reflect high expression, not just PCR artifacts.
- **q-value / FDR:** Multiple-testing–adjusted significance metric; use with a cutoff (e.g., 0.05) for DE calls.
