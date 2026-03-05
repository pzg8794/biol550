# 02-12 Lecture  RNA-seq Project Setup, Dataset Selection (Zebrafish Retina), and Cufflinks Cuffmerge Troubleshooting

**Source:** `transcripts/02-12 Lecture_ RNA-seq Project Setup, Dataset Selection (Zebrafish Retina), and Cufflinks_Cuffmerge Troubleshooting-transcript.txt`  
**Date (from filename):** 02-12

## Summary (course notes)
- **Main focus:** Lecture notes focused on the RNA-seq workflow and interpretation of key analysis/QC outputs.
- **Key takeaways:**
  - Download strategy matters: use a consistent SRA Toolkit command, keep paired-end mates split, and avoid redundant downloads across teammates.
  - Server etiquette: coordinate concurrency, monitor load (e.g., `who`, `top`), and prefer shared/group directories to reduce duplication and permission issues.
  - STAR is resource-heavy; plan runs around shared usage and use STAR summary outputs (unique/multi/unmapped) as alignment QC metrics.
  - For differential expression, use multiple-testing correction (q-value/FDR); interpret results with both effect size (log2FC) and significance (adjusted p).
- **Action items / follow-ups:**
  - Coordinate downloads/alignments so the group is not saturating bandwidth/CPU at the same time; document who is running what.
  - Capture STAR mapping summary metrics (unique/multi/unmapped) for downstream interpretation and troubleshooting.

## Themes detected (quick scan)
- SRA Toolkit; STAR aligner; Tuxedo (cufflinks/cuffdiff); system load

## Transcript highlights (auto-extracted)
- The Python environment is what's happening. Um, let's see. Yep, there we go. I think that's everything with the chat messages. So, so yeah, just keep an eye out for that when you get to Cuff merge. Uh, anyone having issues with Cuff links before that? Or, is it just you got to find time to do it? And that's okay? I remember what Lily and I talked to you about yesterday. It was pretty seamless.
- If you folks want to share that in discussion, that'd be awesome. Help out the other folks that are catching up with you. Cool? Oh, there we go. Chat is good too. All right, so let's see. Given where we are, so there's two things I want to do for the rest of the period. One I want to set up some breakout rooms for a short amount of time to talk about which data set you're picking. Um, Let me se…
- Discuss that. Discuss which one you'd prefer or if neither of them is good, what you might do. Um, I'm going to cycle through the breakout rooms. And we'll just do this really quickly, Five or ten minutes total uh, to make sure your group is really solidifying one, because next week, we're going to start working on the projects. We'll start doing our downloading and our.
- So start playing with the.
- SRA toolkit and stuff like that.
- Think about what you want to call your team because I'll start calling you by your team names going forward once.
- Yeah, two two, And we can start discussing how you guys want to analyze this. We can start looking, and these are just ideas, um, at the data. What, how the data is, how complex it is. And also we can also make decisions based on the data complexity as well. Um yeah share it in there so.
- It could be, yeah, yeah, that could be an issue. I mean, there may be a way to analyze it, but then you're putting a lot of extra load on yourself. Maybe it's a time series. Those are trickier to analyze. Um, so you know, think about what it is you're looking at the data set. If there'd be any challenges that are not in the list.
- Perfect. Downloaded or I I don't know last time it worked, but now it didn't.
- Let me pull up the syllabus. Share screen and talk about where we're going just so we all have context here. Share. Got it. Oh, I can move that. All right, there we go. And I gotta move this. Okay, so yeah, We're gonna finish up practicals. If you have not finished your labs, absolutely, you want to try to finish those worst case by next week Thursday. It shouldn't take terribly long to differe…

## Definitions (optional, add if used in your write-ups)
- **FastQC module:** A named QC check (PASS/WARN/FAIL) computed per FASTQ file.
- **Adapter signal:** Evidence read-through captured adapter/technical sequence; typically requires adapter clipping (not quality trimming).
- **Duplication levels:** Fraction of reads that are duplicates; in RNA-seq this can reflect high expression, not just PCR artifacts.
- **q-value / FDR:** Multiple-testing–adjusted significance metric; use with a cutoff (e.g., 0.05) for DE calls.
