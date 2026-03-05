# 02-19 Lecture  Sequencing Data QC Workflow with FastQC and FASTX-Toolkit

**Source:** `transcripts/02-19 Lecture_ Sequencing Data QC Workflow with FastQC and FASTX-Toolkit-transcript.txt`  
**Date (from filename):** 02-19

## Summary (course notes)
- **Main focus:** Lecture notes focused on the RNA-seq workflow and interpretation of key analysis/QC outputs.
- **Key takeaways:**
  - Download strategy matters: use a consistent SRA Toolkit command, keep paired-end mates split, and avoid redundant downloads across teammates.
  - Server etiquette: coordinate concurrency, monitor load (e.g., `who`, `top`), and prefer shared/group directories to reduce duplication and permission issues.
  - FastQC deliverables should be organized for review (HTML/ZIP per mate); interpret PASS/WARN/FAIL as triage signals, not automatic accept/reject rules.
  - Quality trimming improves tail quality but does **not** remove adapters; adapter clipping is a separate step (and should be validated by rerunning FastQC).
  - When adapter/overrepresented-sequence signals persist after quality trimming, the next move is explicit adapter clipping (or a modern trimmer like `fastp`) and then re-QC.
- **Action items / follow-ups:**
  - Package/retain FastQC outputs in a consistent structure and record the top recurring WARN/FAIL modules for the weekly report.
  - If adapters/overrepresented sequences are flagged, schedule an adapter-clipping pass + rerun FastQC to verify the fix.
  - Coordinate downloads/alignments so the group is not saturating bandwidth/CPU at the same time; document who is running what.
  - Capture STAR mapping summary metrics (unique/multi/unmapped) for downstream interpretation and troubleshooting.

## Themes detected (quick scan)
- FASTX / FASTX-Toolkit; FastQC; SRA Toolkit; STAR aligner; adapter signal / trimming; server coordination; system load

## Transcript highlights (auto-extracted)
- Yep, I think we're pretty good there on the breakout rooms. Awesome. All right, how's everybody doing? Good? Okay. We're just over a week from break. No celebrations? Okay. Okay. Um, we're basically going to continue on the project today. So we're going to do this with breakout rooms in a little bit. Uh, first we're just going to talk briefly about FastQC, um, FastX. And we'll talk about next w…
- Let's start out with so FastQC you should be pretty comfortable with it. All you're going to do today is, as you have some of your data down, start playing, oop lost somebody. I just got a beep somebody disappeared uh oh. Um Oh.
- Okay I think I know what it was. Um we're going to do is as you start getting your data files down, start playing with those fastq files.
- And start running FastQC on them and seeing what kind of things you're getting. And start tabulating if you can. Oh, there we go. Someone had to swap off and back on. There we go. Start tabulating the results you're seeing. What are some consistent issues that you're seeing? What are some maybe individual data files that look like they may have problems? And we'll start playing around with that…
- To clean up your raw data files. So, we're not going to worry too much about the statistics unless you want to. You can play with their FastQ information. It's a little different than FastQC, I don't like it as much, But you can always use that as another way of checking the quality of your data. But also these other things like Trimmomatic. So if we have barcodes or noise, like we're getting l…
- Let's see. Anything else? There's a quality filter and quality trimmer. There we go. Quality trimmer is going to look for where there are segments and shorten it. Quality filter will say, what is the average quality of this read? If it's below some threshold, we'll throw it out. You have to be careful with paired - end sequences on some of these, because if the quality filter removes one end of…
- Some thumbs up, so okay, I'm going to take that as a good thing. Now let's see, do we have everybody here yet? No, we're still missing one. Okay, but I got the breakout rooms. So, oh, one other thing. As you're putting all these results together from FastQC, be prepared for next week on Wednesday. What we're going to do is do team reports. It doesn't have to be formal. You don't need PowerPoint…
- And then as I cycle through, just tell me about how the downloads are going and where you're at. Excellent. I'm going to open them up now.
- Sam, We also have a shared folder now in the in theum server for our project.
- Who who made that? The professor. I see. So do we, so we don't individually all download it. I just go into the, that folder. Um You should be able to.

## Definitions (optional, add if used in your write-ups)
- **FastQC module:** A named QC check (PASS/WARN/FAIL) computed per FASTQ file.
- **Adapter signal:** Evidence read-through captured adapter/technical sequence; typically requires adapter clipping (not quality trimming).
- **Duplication levels:** Fraction of reads that are duplicates; in RNA-seq this can reflect high expression, not just PCR artifacts.
- **q-value / FDR:** Multiple-testing–adjusted significance metric; use with a cutoff (e.g., 0.05) for DE calls.
