# 02-20 Meeting  Bioinformatics Workflow, FastQC, and Team Coordination

**Source:** `transcripts/02-20 Meeting_ Bioinformatics Workflow, FastQC, and Team Coordination-transcript.txt`  
**Date (from filename):** 02-20

## Summary (course notes)
- **Main focus:** Team coordination + status update on the pipeline and deliverables.
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
- Improve that structure that we already started working on. Like we already had a discussion and we already have a structure, and I think it's working right. Don't you think the the conversations in Slack are a lot more productive now.
- I understand that we were just doing the SRA download and the fast QC. So yeah,
- Wednesday. I did, I did. Oh, you did. I put, I actually did not sleep. That's why my medication was off because I put a document in GitHub just for you to review as like what we started doing. And then, you know, And then you basically, you came up with the same the same thing that I put on the on the GitHub document, You came up with the same thing to split the data right? But um, but yeah, bu…
- No, no, I know. I meant like, I had to read a whole document to understand what I'm doing, and my alternative was like, you know what? I'm just going to ask Nikki or Doctor Oger give me two like give me just like a quick rundown. Yeah. Um, like once I saw the GitHub, I was like, I don't want to read this right now because I was just like so caught up. Twitch. I did read it eventually. I just li…
- No, I know. I am just. I was going to make a point that like there is like, so there is multiple folders in here. And it's like I do see thezebra fast QC download step by step. But like it's it's not to the level of self explanatory that it would be easy enough to go in there and be like, oh, this is what I missed. It's more of like oh this document has like a million things.
- So now that brings me to the decision making group decision making right? So we agree, that we were gonna run, right Those at least three, right As per professor assignment to run QC. And that's what I did, right Out of the three of us. And when I told you to wait, It wasn't because I didn't wanna do it. And, then when you asked me why I said I'd rather finish the the, the the download and do t…
- Right. Mhm. It wasn't because I was being stubborn, it's because of what happened that I told you and Gijo. One of them is corrupted, right? So we cannot run QC again because when I move everything, it didn't find where to load, right? Um Because it has temp files that it runs off, right? So yeah It brings me to this point, right If we decided as a team to do something, Why, do you think we sho…
- I got it, I got it. Okay, that's fine. Soum maybe like I don't know, maybe just like for like I'm, trying to think of like structure that would help us to avoid this in the future, right? Because we don't want to have something running, right. And then in the middle of something running when the professor assigns something expecting us to have some because he was monitoring us right? So we didn…
- And you tell me if if you think of a different way that would work better. Has an assignment is like I expect you guys to download, you know, a couple of files and run QC in there. Uh and then we, you know, and then we talk about it. I think that should be the focus and then everything else taken. What do you think?
- I'll be honest with you. I'm starting to understand the professor and how he wants you guys to learn, right? He purposely does not provide certain information because he wants you guys to try different things and explore. But this is what I ask him, right? I ask him, Do you expect us to perform alignment right after QC? He said, hold on to it. Hold on to it. Yes.

## Definitions (optional, add if used in your write-ups)
- **FastQC module:** A named QC check (PASS/WARN/FAIL) computed per FASTQ file.
- **Adapter signal:** Evidence read-through captured adapter/technical sequence; typically requires adapter clipping (not quality trimming).
- **Duplication levels:** Fraction of reads that are duplicates; in RNA-seq this can reflect high expression, not just PCR artifacts.
- **q-value / FDR:** Multiple-testing–adjusted significance metric; use with a cutoff (e.g., 0.05) for DE calls.
