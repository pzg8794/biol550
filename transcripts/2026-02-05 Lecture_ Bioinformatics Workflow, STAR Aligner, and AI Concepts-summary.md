# 02-05 Lecture  Bioinformatics Workflow, STAR Aligner, and AI Concepts

**Source:** `transcripts/02-05 Lecture_ Bioinformatics Workflow, STAR Aligner, and AI Concepts-transcript.txt`  
**Date (from filename):** 02-05

## Summary (course notes)
- **Main focus:** Lecture notes focused on the RNA-seq workflow and interpretation of key analysis/QC outputs.
- **Key takeaways:**
  - Server etiquette: coordinate concurrency, monitor load (e.g., `who`, `top`), and prefer shared/group directories to reduce duplication and permission issues.
  - FastQC deliverables should be organized for review (HTML/ZIP per mate); interpret PASS/WARN/FAIL as triage signals, not automatic accept/reject rules.
  - STAR is resource-heavy; plan runs around shared usage and use STAR summary outputs (unique/multi/unmapped) as alignment QC metrics.
  - For differential expression, use multiple-testing correction (q-value/FDR); interpret results with both effect size (log2FC) and significance (adjusted p).
- **Action items / follow-ups:**
  - Package/retain FastQC outputs in a consistent structure and record the top recurring WARN/FAIL modules for the weekly report.
  - Coordinate downloads/alignments so the group is not saturating bandwidth/CPU at the same time; document who is running what.
  - Capture STAR mapping summary metrics (unique/multi/unmapped) for downstream interpretation and troubleshooting.

## Themes detected (quick scan)
- FastQC; STAR aligner; Tuxedo (cufflinks/cuffdiff); server coordination; system load; weekly report

## Transcript highlights (auto-extracted)
- Hmm, all right, we should get started.
- So a bunch of new things we're gonna play with. So at this point, I think, At least the majority of the class is all set with FastQC. If you have not finished FastQC, absolutely should be working on that and trying to get your zip files together. From there, someone just came in. There's Sam. Again, if you have not finished FastQC, let me put share up. Why is it hiding it from me?
- There we go. So if you have not finished it, please do. Make sure you take all the HTML files created by FastQC, put them into a single zip file, and upload that, and I'll take a look at them. Those that were in this morning, I took a look and gave feedback. The vast majority were looking really good. Minor suggestion here and there. So just make sure you follow up on that and finish that up, a…
- All right, the next thing we're going to do, though, is we're going to start pulling the star aligner. Before we jump ahead and do this.
- Okay. Yes. Yep. Okay. So before you jump ahead with the aligner, this is where you have to start having a conversation about system usage and what are any of you – actually, how many of you – step back. I know some of you are familiar with what the idea of a system load is. Who's seen a system load before? System what? In terms of servers. System load in terms of servers. I got a thumbs up. One…
- I'm going to run you through it. Yeah. So let me go back one more. All right. If we're on the system, I can get a list of who's there. Actually, it's okay. None of you are in right now. That's fine. But if you're on the server, I can see who's there with the who command. We also get this thing called a load average. We're looking at how busy is the system. And this is a composite measure. It's …
- and tells me what's changed. It also has information up top, like what is the current time in the system, which is correct. I try to keep the system clocks on track there. How long it's been up? It's been 25 days since the last restart. That was a systems update restart. Let's see. Oh, it's been 25 days and three hours and 20 minutes it's been up. We have five users on now. See somebody's come …
- But we also get this load average again. Oops, I didn't mean to scroll that. We also get this load average. What this a composite measure, and the numbers change over time. I believe the numbers on the left are the immediate snapshots, a short period, and you get longer periods as you go. Again, what this a composite of all the different activities going on in the system. There are different bo…
- What we do is very intensive on the hard drive usage as well as the CPU. So okay, I'm gonna open a second window here. I'm gonna start something up. Just give me a minute. All right. Oops, I got to move around so I can see what I'm doing.
- I'm going to start FastQC on, oops, wait a minute. I got to get into the right directory. There we go. I'm going to run FastQC, and watch what happens on top as I do it. Let's see, I'm going to pick one of them. Let's pick 6, 1, there it goes.

## Definitions (optional, add if used in your write-ups)
- **FastQC module:** A named QC check (PASS/WARN/FAIL) computed per FASTQ file.
- **Adapter signal:** Evidence read-through captured adapter/technical sequence; typically requires adapter clipping (not quality trimming).
- **Duplication levels:** Fraction of reads that are duplicates; in RNA-seq this can reflect high expression, not just PCR artifacts.
- **q-value / FDR:** Multiple-testing–adjusted significance metric; use with a cutoff (e.g., 0.05) for DE calls.
