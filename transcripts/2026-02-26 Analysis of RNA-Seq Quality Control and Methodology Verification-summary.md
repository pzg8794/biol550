# 02-26 Analysis of RNA-Seq Quality Control and Methodology Verification

**Source:** `transcripts/02-26 Analysis of RNA-Seq Quality Control and Methodology Verification-transcript.txt`  
**Date (from filename):** 02-26

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
- FASTX / FASTX-Toolkit; FastQC; STAR aligner; Tuxedo (cufflinks/cuffdiff); adapter signal / trimming; duplication levels; fastp; poly-G tails; server coordination; system load

## Transcript highlights (auto-extracted)
- Yeah, we should be done. Theum, the last step was like visualization or just the output for diff uh cuffdiff. So, that's over with. So I'm guessing we're mimicking the same ones for our data set. Did he give us like a.
- Let me make a sheet of all of them and then all the categories, and then look at what categories fail and then make sure to put all the runs in in order or at least in pairs. So that way we can see any trends. Let me start from there.
- We we do have the data in the server. I'm saying in the driveum just to make sure that we have all the HTMLs in there in the drive, but we do have it in server. Yeah, all of it.
- Let's. I still think we should view them like all together as a group, but we can start doing like an analysis based on like their conditions. Yeah,
- I don't think we should spend time on like doing the heat maps ourselves. I like the idea of compiling all this information. But even then, I don't know if he's expecting that much. I think he's still just wanting us to like look through and make notes of anything important rather than compiling everything. I really think we need to start looking through the fast QC files.
- Which ones do we want to start with then?
- I think he wanted to look at the fastQC outputs like the little HTML files.
- If we're looking at the duplication ones and we have odd ones where everyone else only had G's. But we also had T's and I know one of our samples has likeum a duplication of like an actual sequence, not just oneum nucleotide. So. We should look for those and see which ones they were and understand why. I also think we need to confirm that the sequencing tech that was actually used was, um, the …
- If you want to pull up the individual runs and start screen sharing, I think that's a good idea. Yeah. Um, in the meantime, I can try and hunt around to see what sequencing machine was used.
- Yeah, let me download the the sheet.

## Definitions (optional, add if used in your write-ups)
- **FastQC module:** A named QC check (PASS/WARN/FAIL) computed per FASTQ file.
- **Adapter signal:** Evidence read-through captured adapter/technical sequence; typically requires adapter clipping (not quality trimming).
- **Duplication levels:** Fraction of reads that are duplicates; in RNA-seq this can reflect high expression, not just PCR artifacts.
- **q-value / FDR:** Multiple-testing–adjusted significance metric; use with a cutoff (e.g., 0.05) for DE calls.

> Tooling note (2026-03-05): FASTX is the legacy “class” trimmer. For targeted trimming of known end-sequences (adapter remnants) on paired-end reads, prefer `fastp`; for primer/amplicon trimming, use `cutadapt`. See `Semester5/BIOL550/BIOL550-Notes.md` (“fastp vs FASTX Toolkit”).
