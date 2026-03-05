# 03-02 Weekly Meeting  Bulk RNA-seq Dataset Selection, Access Permissions, and QC (Adapters Duplication)

**Source:** `transcripts/03-02 Weekly Meeting_ Bulk RNA-seq Dataset Selection, Access Permissions, and QC (Adapters_Duplication)-transcript.txt`  
**Date (from filename):** 03-02

## Summary (course notes)
- **Main focus:** Team coordination + status update on the pipeline and deliverables.
- **Key takeaways:**
  - Server etiquette: coordinate concurrency, monitor load (e.g., `who`, `top`), and prefer shared/group directories to reduce duplication and permission issues.
  - When adapter/overrepresented-sequence signals persist after quality trimming, the next move is explicit adapter clipping (or a modern trimmer like `fastp`) and then re-QC.
  - High duplication can be expected in RNA-seq (highly expressed transcripts); focus on outliers and whether duplication correlates with other QC failures.
  - STAR is resource-heavy; plan runs around shared usage and use STAR summary outputs (unique/multi/unmapped) as alignment QC metrics.
- **Action items / follow-ups:**
  - If adapters/overrepresented sequences are flagged, schedule an adapter-clipping pass + rerun FastQC to verify the fix.
  - Coordinate downloads/alignments so the group is not saturating bandwidth/CPU at the same time; document who is running what.
  - Capture STAR mapping summary metrics (unique/multi/unmapped) for downstream interpretation and troubleshooting.

## Themes detected (quick scan)
- STAR aligner; adapter signal / trimming; duplication levels; server coordination; system load

## Transcript highlights (auto-extracted)
- Started getting reported about. It's not maybe it is this machine. Unless there's like one that just came out recently, Butum we still have not done a deep enough analysis of theum pass keys files I think. So I think we should do is we should talk to him and just mention. Show him the protocol so he also has idea. We can confirm if someone else is concerned as well. And, then we really need to …
- So then, assuming that we're all set after we look at the five fifty files, we can start adding like what's our timeline. We.
- Actually, uh, the fast PC train train results is in the server. Yeah, whenever we're ready, I can I can migrate it.
- It's there just it's just loading.
- I mean, regardless of the design, I don't know if we should probably just. It just like let's just see how it goes. We really don't want to do that. That was definitely something that we were going to see over the weekend. This then work colleagues get back together and still have the item, so should we go back and add more? Check the documentation for S P C. If you can make your own database a…
- It's nice to have a room. It's just that duplication. I'm sure there's something. What was that? This is password. I've never. Yeah. Okay, there's the adapters. Okay, so yeah, okay, so you see the naming?
- Yeah, this is what. I was just kind of concerned because I saw that little X there, Yeah, that's fine. Okay, so then this is why I was like, That's unusual to be that good. So. And then my next question is we were we still had issues with sequence duplication levels. Um. So again, this was an overrepresented sequence for this. And then after trimming it, we still had that oops. No. Uh, I read t…
- That's an sequencing error adapter It didn't come out interesting.
- Oh, you're just starting out as you started. Okay. But uh, He had a course built in here, and we realized look, this is different skills for a biotech team. Uh G was doing um cloud mapping to do transformation of the data. Uh. But but the cool thing about this course was we started out with a class. And then you had to build through this entire process because all web apps, yeah, the problems t…
- I'd rather have something with a here at the end, but works better with people that parties can also from having experience it twice to have peace, it'll help. Okay. I agree. If you want to try this one, go for it. If you want to look for other things, let me know and we'll try to figure out something. We have a list of datasets that we can use, and then we just pick one and start doing researc…

## Definitions (optional, add if used in your write-ups)
- **FastQC module:** A named QC check (PASS/WARN/FAIL) computed per FASTQ file.
- **Adapter signal:** Evidence read-through captured adapter/technical sequence; typically requires adapter clipping (not quality trimming).
- **Duplication levels:** Fraction of reads that are duplicates; in RNA-seq this can reflect high expression, not just PCR artifacts.
- **q-value / FDR:** Multiple-testing–adjusted significance metric; use with a cutoff (e.g., 0.05) for DE calls.
