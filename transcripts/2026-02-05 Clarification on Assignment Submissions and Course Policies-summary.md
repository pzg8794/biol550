# 02-05 Clarification on Assignment Submissions and Course Policies

**Source:** `transcripts/02-05 Clarification on Assignment Submissions and Course Policies-transcript.txt`  
**Date (from filename):** 02-05

## Summary (course notes)
- **Main focus:** Course logistics: submissions, expectations, and grading/workflow rules.
- **Key takeaways:**
  - Server etiquette: coordinate concurrency, monitor load (e.g., `who`, `top`), and prefer shared/group directories to reduce duplication and permission issues.
  - FastQC deliverables should be organized for review (HTML/ZIP per mate); interpret PASS/WARN/FAIL as triage signals, not automatic accept/reject rules.
- **Action items / follow-ups:**
  - Package/retain FastQC outputs in a consistent structure and record the top recurring WARN/FAIL modules for the weekly report.
  - Coordinate downloads/alignments so the group is not saturating bandwidth/CPU at the same time; document who is running what.

## Themes detected (quick scan)
- FastQC; system load; weekly report

## Transcript highlights (auto-extracted)
- but just take all the html files from fastqc yep from the travel data yeah, Take those HTML files, put them into a zip file, upload that to my courses.
- So, let me see if I understand correctly. So, the report of the FastQC, right? It's in the morning.
- I would recommend submitting it before the night before. Yep. You could submit it a day before that even. But you'll see we have these weekly reports. The first one was actually the project pics, the data sets you're thinking of. And that was due earlier in the week. And then you have all these others, including an optional one if you wanted to work during spring break at all. So, I believe tha…
- All right. So. So right now, when I send the zip files, you don't want me to write the report. They're separate. Oh, they're separate things. Oh, that's the weekly report.

## Definitions (optional, add if used in your write-ups)
- **FastQC module:** A named QC check (PASS/WARN/FAIL) computed per FASTQ file.
- **Adapter signal:** Evidence read-through captured adapter/technical sequence; typically requires adapter clipping (not quality trimming).
- **Duplication levels:** Fraction of reads that are duplicates; in RNA-seq this can reflect high expression, not just PCR artifacts.
- **q-value / FDR:** Multiple-testing–adjusted significance metric; use with a cutoff (e.g., 0.05) for DE calls.
