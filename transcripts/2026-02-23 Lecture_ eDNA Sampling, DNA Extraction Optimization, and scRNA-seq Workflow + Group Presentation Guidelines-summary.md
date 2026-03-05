# 02-23 Lecture  eDNA Sampling, DNA Extraction Optimization, and scRNA-seq Workflow + Group Presentation Guidelines

**Source:** `transcripts/02-23 Lecture_ eDNA Sampling, DNA Extraction Optimization, and scRNA-seq Workflow + Group Presentation Guidelines-transcript.txt`  
**Date (from filename):** 02-23

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
- He was one of the two sides of the Human Genome Project. And he made his many millions of dollars off of that and wound up buying a yacht, went out to the Sargasso Sea where he started doing this sort of stuff. He actually would take these plastic containers that they sterilized, They had holes in the bottom, but they put paper filters in the bottom of it. And literally pull it behind the yacht…
- Sometimes that happens. A lot of labs will try a kit out to see how well it works before they start doing a large scale. Like, hey, here's a new kit. Let's try it out. And then if it doesn't work, okay, they go back to what they were doing before. I believe that the kits of the kit ones are more expensive than the eliva biotech ones. Yeah, most price.
- For PCI, it started out pretty high. It.
- Everyone else is going to try their own different ways. Like I mean, each each of these, if we change, if we start dealing with a different type of water from Dallas, it was. Yeah. If we drove five hours that way, could it be different?
- Thatum for an internship would be tough to get that you might be able to depends on where you're going. They might have a secondary machine. All right. So we got this separation. You can actually do the single cell RNA seq on them. Basically, there's special kits. It'll take these cells and it'll separate them out. I want to see magnetic beads in there. Somehow. Depends on which kit you're deal…
- Expression profiles. If you look at their RNA seq results for these individual cells, this is a massive experiment. You have how many different cells? Thousands, right? And each one has its own RNA seq results. And, then you're going to take these and look at them to see where they cluster based on the profiles. And sure enough, they do break down by tissue type. This is huge and this is awesom…
- Well, buddy if it's. It's not connected to the internet right now, and it's trying to download a file.
- Oh, you're trying to download something? Yeah, it's kind of stuck. Sorry. It'll probably time out. Yeah, we'll see. It should come back up. Sorry, there were some. It was not playing nice this morning. Um.
- Single- cell RNA seq make sense? It's really powerful. I remember again, folks at U of R, so I do this with blood cell development. White blood cells go through a whole long process of development and differentiation. There's lots of different types of white blood cells, right? They're able to actually look at the gene expression at different stages because there was an unknown at that point 10…
- Group presentations, right? Make sure you're ready to go. We'll start off. I'll ask for a victim, I mean volunteer first thing. Uh, whoever wants to go first will be able to if you want to set up on the projection, go for it, otherwise where I'm just going to sit in the desk and and talk with y'all, You said five minute, five minutes each. Uh, we're gonna set a time limit for each group. And if…

## Definitions (optional, add if used in your write-ups)
- **FastQC module:** A named QC check (PASS/WARN/FAIL) computed per FASTQ file.
- **Adapter signal:** Evidence read-through captured adapter/technical sequence; typically requires adapter clipping (not quality trimming).
- **Duplication levels:** Fraction of reads that are duplicates; in RNA-seq this can reflect high expression, not just PCR artifacts.
- **q-value / FDR:** Multiple-testing–adjusted significance metric; use with a cutoff (e.g., 0.05) for DE calls.
