# 02-19 Lecture  Server Load Management, FastQC Workflow, and RNA-Seq Project Subsetting

**Source:** `transcripts/02-19 Lecture_ Server Load Management, FastQC Workflow, and RNA‑Seq Project Subsetting-transcript.txt`  
**Date (from filename):** 02-19

## Summary (course notes)
- **Main focus:** Lecture notes focused on the RNA-seq workflow and interpretation of key analysis/QC outputs.
- **Key takeaways:**
  - Server etiquette: coordinate concurrency, monitor load (e.g., `who`, `top`), and prefer shared/group directories to reduce duplication and permission issues.
  - FastQC deliverables should be organized for review (HTML/ZIP per mate); interpret PASS/WARN/FAIL as triage signals, not automatic accept/reject rules.
  - STAR is resource-heavy; plan runs around shared usage and use STAR summary outputs (unique/multi/unmapped) as alignment QC metrics.
- **Action items / follow-ups:**
  - Package/retain FastQC outputs in a consistent structure and record the top recurring WARN/FAIL modules for the weekly report.
  - Coordinate downloads/alignments so the group is not saturating bandwidth/CPU at the same time; document who is running what.
  - Capture STAR mapping summary metrics (unique/multi/unmapped) for downstream interpretation and troubleshooting.

## Themes detected (quick scan)
- FastQC; STAR aligner; server coordination; system load

## Transcript highlights (auto-extracted)
- All right, there we go. Excellent. Most of you are getting started on the fast QC.
- That's good. Again, keep an eye on top and how busy things are. So I'm going to share screen. We'll look at a couple of different things on the server. So yeah, just make sure that load stays below 15 if you can. Oops, Move this over here, we go see again, I'm going to keep that system load under. If we can. Also, the system load doesn't necessarily count for network bandwidth. Try to make sure…
- All the stuff going on there. I know there's some other analyses happening there. I see a couple different running. Earlier we had a starter running. Other thing you got to look at is keep track of your group's dry space, right? I'm going to pick on one group, um, sorry, It's like ten frogs in your group because that's the first one I saw there as the list. I'm going to look at the dry space us…
- It's not going to make a huge difference. Most of the data is going to be in your project files. If you're finding you have a lot of disk space you need, You may want to think about subsetting your data, and instead of doing everything in that project, just do a part of it and doing certain analyses. So we can talk about that. Now, to see how much space you're using in any given directory, use …
- It's going to take more and more space. It's not just simply doubling or something. It's actually going to be probably four or five times as much space. So, just keep an eye on your drive space usage. Um, I will be running a script that will check automatically every so often. Um, I don't think any group is currently at risk right now. I'll just double check this afternoon. Um, but I'll let you…
- We had about seven and a half terabytes available. So I split that equally among the five groups, and if I did my math right, that's one and a half terabytes per group. Did I do my math right? Seven and a half five ways? We got one couple nods. Okay good. I gotta ask, I've had a cold for a couple of days so I'm not positive. My head's a little foggy. So definitely call me out if you get the mat…
- It creates some conflicts for some of the essential system tasks, and it'll shut down until I can get in, clean up delete files on the drive somewhere, and then restart it. So please be careful that keep an eye on that every so often. Run that df i n k every so often to see what's going on. All right. Any questions so far?
- Not related to drive space? Yeah. If the server is dead like dad dead? Dead Well like, If you're the only person on, if you're the only person on, how long would it take to download roughly an NSR file?
- I don't build on the Adam sorry. I don't have those data files there. Um, I know I downloaded something a couple days ago. You can see when they started it, but I can't see when they finished. Um, I want to say my guess is 15 minutes. Does anyone have a hard number? You kept an eye on how long it takes to do a download?
- But that's with everybody else running at the same time. Yeah. Yeah. So, yeah, Monica you're seeing the same thing? Yeah. With everybody else running right now, the bandwidth gets split up. It should be a lot faster than that. Um, Max has been in an hour? Okay, but he started at the beginning of class, then next to yeah, yeah. So it's probably slowed down with everybody else on there. Uh, you c…

## Definitions (optional, add if used in your write-ups)
- **FastQC module:** A named QC check (PASS/WARN/FAIL) computed per FASTQ file.
- **Adapter signal:** Evidence read-through captured adapter/technical sequence; typically requires adapter clipping (not quality trimming).
- **Duplication levels:** Fraction of reads that are duplicates; in RNA-seq this can reflect high expression, not just PCR artifacts.
- **q-value / FDR:** Multiple-testing–adjusted significance metric; use with a cutoff (e.g., 0.05) for DE calls.
