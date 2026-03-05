# 02-18 Lecture  SRA Toolkit Workflows, FastQC, Server Coordination, and Alignment Deliverables

**Source:** `transcripts/02-18 Lecture_ SRA Toolkit Workflows, FastQC, Server Coordination, and Alignment Deliverables-transcript.txt`  
**Date (from filename):** 02-18

## Summary (course notes)
- **Main focus:** Lecture notes focused on the RNA-seq workflow and interpretation of key analysis/QC outputs.
- **Key takeaways:**
  - Download strategy matters: use a consistent SRA Toolkit command, keep paired-end mates split, and avoid redundant downloads across teammates.
  - Server etiquette: coordinate concurrency, monitor load (e.g., `who`, `top`), and prefer shared/group directories to reduce duplication and permission issues.
  - FastQC deliverables should be organized for review (HTML/ZIP per mate); interpret PASS/WARN/FAIL as triage signals, not automatic accept/reject rules.
  - STAR is resource-heavy; plan runs around shared usage and use STAR summary outputs (unique/multi/unmapped) as alignment QC metrics.
- **Action items / follow-ups:**
  - Package/retain FastQC outputs in a consistent structure and record the top recurring WARN/FAIL modules for the weekly report.
  - Coordinate downloads/alignments so the group is not saturating bandwidth/CPU at the same time; document who is running what.
  - Capture STAR mapping summary metrics (unique/multi/unmapped) for downstream interpretation and troubleshooting.

## Themes detected (quick scan)
- FastQC; SRA Toolkit; STAR aligner; server coordination; system load; weekly report

## Transcript highlights (auto-extracted)
- I know. Let me put it another way. If you're working for a research lab or you're working for a company, are you the only person who needs to know? No. In fact, in a company, The expectation is that you'll have to document it and explain it to your boss. So how many friends do you have? So it needs to be efficient and well written. It's not trivial. What happens the last time? All right, we nee…
- Okay. All right. Let's get started. So, differential expression. How many of you finished it? It.
- No, Are you talking about the weekly report or the technical blog? Oh, I'm talking about the weekly report. Yeah, the weekly report's different. And actually we'll come back to that. Thank you. That is a good point. Um For the differential expression of the third stage, submitting that single file that has differential expression results, haven't you submitted that? Awesome Good Again it's not …
- I'm going to put this in discussion. They have a bunch of examples on this one. And this will get you started, but basically I guess I can broadcast this.
- This is what I just posted to discussion. They do a pretty good job. Oh, why are these files here? There we go. And there's a bunch of terms you can do a search if you want. The basic thing is, okay, you've got a bunch of SRR files you're looking for. You're not going to do it for a whole project, You'll do it for your individual SRR files, and you might have a list- -. There's different ways t…
- The bin directory. In where? The bin directory. Which bin directory? Where we have. Yeah, where we have FastQC also.
- So slash bin, where is it? User/ local/ bin User/ local/ bin Yeah Yep Just the common place where you have all these/ user/ local/ bin, Slash SRA toolkit, I believe. Yeah. And then there's the fastq dump. You're basically telling it to split files. And here's the reason: if you go to a single sample, when you have an SRR number, if they're paired end they have a forward and reverse, right? They…
- So you can do a split file, so it makes the two files from this download. Uh, don't worry about the origin format. It's going to have them gzipped and for the SRR. Um, There is I was just wondering what version of fastq dump because there's many on the server in user tools here. You see?
- I see SRA_ 3. 0. 0 Yes, I don't see another one in there Well, that's so under SRA 3. 0. 0 That's a directory And. If you go in the back of the program, There's three Oh You're seeing the links Yes Yes So, It's Basically going to be that command The fastq dump. And the reason is The others are links to that same file. Okay. It's all the same program that you're running. Okay. Yep. Thank you. Ye…
- Now, what happens if you all do this at the same time? It will crash the server, but it gets ugly. It uses up your network bandwidth also.

## Definitions (optional, add if used in your write-ups)
- **FastQC module:** A named QC check (PASS/WARN/FAIL) computed per FASTQ file.
- **Adapter signal:** Evidence read-through captured adapter/technical sequence; typically requires adapter clipping (not quality trimming).
- **Duplication levels:** Fraction of reads that are duplicates; in RNA-seq this can reflect high expression, not just PCR artifacts.
- **q-value / FDR:** Multiple-testing–adjusted significance metric; use with a cutoff (e.g., 0.05) for DE calls.
