# 02-04 Addressing Biases in RNA-Seq Data Analysis

**Source:** `transcripts/02-04 Addressing Biases in RNA-Seq Data Analysis-transcript.txt`  
**Date (from filename):** 02-04

## Summary (course notes)
- **Main focus:** Lecture notes focused on the RNA-seq workflow and interpretation of key analysis/QC outputs.
- **Key takeaways:**
  - When adapter/overrepresented-sequence signals persist after quality trimming, the next move is explicit adapter clipping (or a modern trimmer like `fastp`) and then re-QC.
- **Action items / follow-ups:**
  - If adapters/overrepresented sequences are flagged, schedule an adapter-clipping pass + rerun FastQC to verify the fix.

## Themes detected (quick scan)
- adapter signal / trimming

## Transcript highlights (auto-extracted)
- What's the problem? The edge axes is just the length of the gene. As you're moving across this sequence, we get an increase in fragments in the middle and a decrease at the end. What's going on? You need some bias at the beginning and end, right? Why are we getting that? Are you using it when you send yRNA adapter?
- No, because the adapters aren't across the whole gene. They're across the whole fragment. So each little fragment that aligns here has its own adapter. So that's not it, unfortunately. This is easy. Actually, no, this is easy. Any idea how we collect the RNAs? What's the easiest way to identify a code in mRNA from other RNAs, PRNAs and ribosomal RNAs? you can't tell if the proteins are not poly…

## Definitions (optional, add if used in your write-ups)
- **FastQC module:** A named QC check (PASS/WARN/FAIL) computed per FASTQ file.
- **Adapter signal:** Evidence read-through captured adapter/technical sequence; typically requires adapter clipping (not quality trimming).
- **Duplication levels:** Fraction of reads that are duplicates; in RNA-seq this can reflect high expression, not just PCR artifacts.
- **q-value / FDR:** Multiple-testing–adjusted significance metric; use with a cutoff (e.g., 0.05) for DE calls.
