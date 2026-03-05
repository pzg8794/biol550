# 02-24 Weekly Meeting  RNA-seq Pipeline Update, FastQC Findings, Literature Verification, and Slide Deck Plan

**Source:** `transcripts/02-24 Weekly Meeting_ RNA-seq Pipeline Update, FastQC Findings, Literature Verification, and Slide Deck Plan-transcript.txt`  
**Date (from filename):** 02-24

## Summary (course notes)
- **Main focus:** Team coordination + status update on the pipeline and deliverables.
- **Key takeaways:**
  - Server etiquette: coordinate concurrency, monitor load (e.g., `who`, `top`), and prefer shared/group directories to reduce duplication and permission issues.
  - FastQC deliverables should be organized for review (HTML/ZIP per mate); interpret PASS/WARN/FAIL as triage signals, not automatic accept/reject rules.
  - Quality trimming improves tail quality but does **not** remove adapters; adapter clipping is a separate step (and should be validated by rerunning FastQC).
  - High duplication can be expected in RNA-seq (highly expressed transcripts); focus on outliers and whether duplication correlates with other QC failures.
  - STAR is resource-heavy; plan runs around shared usage and use STAR summary outputs (unique/multi/unmapped) as alignment QC metrics.
- **Action items / follow-ups:**
  - Package/retain FastQC outputs in a consistent structure and record the top recurring WARN/FAIL modules for the weekly report.
  - Coordinate downloads/alignments so the group is not saturating bandwidth/CPU at the same time; document who is running what.
  - Capture STAR mapping summary metrics (unique/multi/unmapped) for downstream interpretation and troubleshooting.

## Themes detected (quick scan)
- FASTX / FASTX-Toolkit; FastQC; STAR aligner; duplication levels; q-value / FDR; server coordination; system load; weekly report

## Transcript highlights (auto-extracted)
- Oh nice. Um like I'm checking right now, the downloads on the server and see how we're doingum.
- Yeah, that's what I was thinking because soum and let me give you a little bit of insight of my head. So you guys can pick, you know my brain. So I was thinking thatum sinceum you actually deal with the headache of of the uh dumps. Uh Samuel there is uh there's like there's a slide in there that talks about the downloads, right? Um the fastq dumps. Even the examples in there, and also the fastQ…
- The fastQC yeah dump dumps.
- Run s uh download fast or uh gzip and then fast faster or fast. Actually I don't think we should say that we use faster Q C just because he said, not or he didn't say we can. So we can just say, fast Q C I mean,
- Reasonable. Um, Let me check while you guysum like you guys can start picking stuff in there. Um, let me just check how we're doing in this server. Uh,
- The Server is busy. Oh,
- I'm Moving. I'm I started moving some things over. Oh, sounds good.
- Let's see. Oh, they have some downloads in here.
- Which is ridiculous. Like, you had to find a paper outside to be able to find that in there. Like, what's the logic around that? This is cool. I'm going to download it. Did you, um, you want me to put it in the drive or you already put it? The PDF?
- Um, no, I didn't put it in the drive yet. Okay. I'm downloading it. Um, if you want, I can let me download those.

## Definitions (optional, add if used in your write-ups)
- **FastQC module:** A named QC check (PASS/WARN/FAIL) computed per FASTQ file.
- **Adapter signal:** Evidence read-through captured adapter/technical sequence; typically requires adapter clipping (not quality trimming).
- **Duplication levels:** Fraction of reads that are duplicates; in RNA-seq this can reflect high expression, not just PCR artifacts.
- **q-value / FDR:** Multiple-testing–adjusted significance metric; use with a cutoff (e.g., 0.05) for DE calls.
