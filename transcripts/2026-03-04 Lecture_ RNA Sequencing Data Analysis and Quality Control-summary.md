# 03-04 Lecture  RNA Sequencing Data Analysis and Quality Control

**Source:** `transcripts/03-04 Lecture_ RNA Sequencing Data Analysis and Quality Control-transcript.txt`  
**Date (from filename):** 03-04

## Summary (course notes)
- **Main focus:** Lecture notes focused on the RNA-seq workflow and interpretation of key analysis/QC outputs.
- **Key takeaways:**
  - Server etiquette: coordinate concurrency, monitor load (e.g., `who`, `top`), and prefer shared/group directories to reduce duplication and permission issues.
  - FastQC deliverables should be organized for review (HTML/ZIP per mate); interpret PASS/WARN/FAIL as triage signals, not automatic accept/reject rules.
  - Quality trimming improves tail quality but does **not** remove adapters; adapter clipping is a separate step (and should be validated by rerunning FastQC).
  - When adapter/overrepresented-sequence signals persist after quality trimming, the next move is explicit adapter clipping (or a modern trimmer like `fastp`) and then re-QC.
  - High duplication can be expected in RNA-seq (highly expressed transcripts); focus on outliers and whether duplication correlates with other QC failures.
- **Action items / follow-ups:**
  - Package/retain FastQC outputs in a consistent structure and record the top recurring WARN/FAIL modules for the weekly report.
  - If adapters/overrepresented sequences are flagged, schedule an adapter-clipping pass + rerun FastQC to verify the fix.
  - Coordinate downloads/alignments so the group is not saturating bandwidth/CPU at the same time; document who is running what.
  - Capture STAR mapping summary metrics (unique/multi/unmapped) for downstream interpretation and troubleshooting.

## Themes detected (quick scan)
- FASTX / FASTX-Toolkit; FastQC; STAR aligner; adapter signal / trimming; duplication levels; fastp; poly-G tails; server coordination; system load

## Transcript highlights (auto-extracted)
- Let me upload this first. And then we're going to go second.
- Where Our data set was originally doing single cell rna sequencing, and that requires like different tools to use to complete analysis and a bunch of extra stuff. So we just decided to stray away from them, find a new data set. So our new dataset is um no longer on zebrafish, which is funny since that's our name. So we're now working with mice. Um, and we found a different dataset that still me…
- So, we've been running the code for it for the past two days, trying to like stay caught up. So we literally, I think only finished running the code last night. So I didn't have a chance to do an in-depth. Uh like we didn't have a chance to do an in-depth analysis of the fastQC files, but when doing a brief look, I just tapped into like a couple of those HTML files. Um We had some uh overrepres…
- Um, so we I so I mean, at least now we know that's not an issue, and we did seeum adapter sequences again, So we're just going to take a look after trimming and see if it cuts those out. A weird thing we noticed when we ended up running FastQC on the last dataset is that for some reason, it didn't remove the adapters. We're not quite sure what that's about, and we're hoping that's just an issue…
- But yeah, I mean, The only thing I can think of that I can highlight in terms of analysis is that. When we compared the fastQC results outputs with the trim outputs, uh just like Nikki was saying, we didn't really see much change at all. Uh, the only thing that we saw change was in the length distribution, which makes sense. Um, we did actually see something that might be worth looking into in …
- So the the raw one is the fastqcm.
- That's adapter content.
- What do you think just out of curiosity after you. Ran fastx, did your overrepresented sequence flag go away? Because I'm wondering if that might be connected to the term just like poly G.
- Like are you talking about like our original run of fastx?
- Like when you originally ran fastx, Did you have a poly G overrepresented sequence? And then after you ran fastx, did it go away?

## Definitions (optional, add if used in your write-ups)
- **FastQC module:** A named QC check (PASS/WARN/FAIL) computed per FASTQ file.
- **Adapter signal:** Evidence read-through captured adapter/technical sequence; typically requires adapter clipping (not quality trimming).
- **Duplication levels:** Fraction of reads that are duplicates; in RNA-seq this can reflect high expression, not just PCR artifacts.
- **q-value / FDR:** Multiple-testing–adjusted significance metric; use with a cutoff (e.g., 0.05) for DE calls.

> Tooling note (2026-03-05): FASTX is the legacy “class” trimmer. For targeted trimming of known end-sequences (adapter remnants) on paired-end reads, prefer `fastp`; for primer/amplicon trimming, use `cutadapt`. See `Semester5/BIOL550/BIOL550-Notes.md` (“fastp vs FASTX Toolkit”).
