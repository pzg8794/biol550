# 02-11 Lecture  RNA-seq Pipeline Progress, Differential Expression, and Server Operations

**Source:** `transcripts/02-11 Lecture_ RNA-seq Pipeline Progress, Differential Expression, and Server Operations-transcript.txt`  
**Date (from filename):** 02-11

## Summary (course notes)
- **Main focus:** Lecture notes focused on the RNA-seq workflow and interpretation of key analysis/QC outputs.
- **Key takeaways:**
  - Server etiquette: coordinate concurrency, monitor load (e.g., `who`, `top`), and prefer shared/group directories to reduce duplication and permission issues.
  - STAR is resource-heavy; plan runs around shared usage and use STAR summary outputs (unique/multi/unmapped) as alignment QC metrics.
  - For differential expression, use multiple-testing correction (q-value/FDR); interpret results with both effect size (log2FC) and significance (adjusted p).
- **Action items / follow-ups:**
  - Coordinate downloads/alignments so the group is not saturating bandwidth/CPU at the same time; document who is running what.
  - Capture STAR mapping summary metrics (unique/multi/unmapped) for downstream interpretation and troubleshooting.

## Themes detected (quick scan)
- STAR aligner; Tuxedo (cufflinks/cuffdiff); q-value / FDR; server coordination

## Transcript highlights (auto-extracted)
- One that is really due tomorrow. Like, That's really you got to have it done by tomorrow. If you haven't done that one last week. Oh, okay. Yeah, I know. Okay. It's not the whole test, just the past few C parts. Step one. Yeah, yeah. So you're good? You're good? So everyone's finished the past few C stuff? All right, how many people have finished all the alignments? Is that less than. That one,…
- It should generate some output files for you from the expression after you do cuffmerge and cuffdiff. Oh, I didn't do that yet. You didn't do that yet? Okay. Yep. So how many of you have done cuffdiff? Nobody. Okay, that's fine. I want to talk about it briefly anyways. So cuffdiff, You may see that there's a third part in these cytosboxes It should be. So there's the three cytosboxes The first …
- They do some weird stuff with our licensing because Adobe has gotten greedy. Okay, in all seriousness, a lot of these companies are being greedy. VMware, all kinds of stuff. The licensing has changed. Dell is not honoring their quotes anymore. Quotes they made before a week ago that still don't expire for like three weeks, they're not honoring them because the person never showed up so much. Th…
- With step three is you go through the rest of the steps, you got count matrix and all these other things. cuffdiff is going to output a bunch of files. You need to look through those files, see what's in them, explore. You're not going to break anything unless you. right? You can't break anything if you want to repeat the analysis. Um look through the data files, See what's in them and look for…
- So you find the gene identifiers that are from your GTF file. So maybe gene ABC, and I think that's a real gene in Arabidopsis. ABC1, I think is a real gene. It'll have a log fold change. What else will it have though? We want to know which genes are significantly differentially expressed. P-values? Simple, yep, we expect to find p-values. There's also something here seen there called a q-value…
- There are other things like false discovery rates and things like that. A q-value is one way of doing this correction for multiple testing. So, you can use cuffdiff to give you a q-value. Use the q-values, add a cutoff of 0.05 or maybe even 0.01 to determine which genes look to be differentially expressed. So, You want to look through your cuffdiff results when you get there and look for which …
- That's the other one. I got a thing for it. I'll show you in a second. But one of the files actually, every time you run STAR, it'll tell you how many mapped uniquely, how many multi-reads, how many are unmapped. You might also if you specify correctly, I don't know if you read this. See those last files? You can actually tell STAR to keep your unmapped reads and separate them out so you can do…
- Oh, um, I was going to say when you have these two reference. If you would always all of those and then have the unmapped reads. Yep, absolutely. So we do the sequential approach. Absolutely. So the first alignment, You get the unmapped reads and then aligning on the map reads to your second channel. Uh, so it will give that to you if you want to do a combined reference, You just literally conc…
- Where is the top step in the top list for this server? Where might they be? I searched and didn't see it, but I thought they might help teach me on a session. Is that right? Let's see.
- That's it. It turns out they're all part of the same package. All the cuffs belong together in the Celaeno place. So they go under cuff links, even though they're separate programs within the Celaeno package. So yeah, it's a little weird the way they do that. That's just the way they did the Celaeno package. So yeah, user local bin couplings will have all the couplings in there. Cool. Okay, I s…

## Definitions (optional, add if used in your write-ups)
- **FastQC module:** A named QC check (PASS/WARN/FAIL) computed per FASTQ file.
- **Adapter signal:** Evidence read-through captured adapter/technical sequence; typically requires adapter clipping (not quality trimming).
- **Duplication levels:** Fraction of reads that are duplicates; in RNA-seq this can reflect high expression, not just PCR artifacts.
- **q-value / FDR:** Multiple-testing–adjusted significance metric; use with a cutoff (e.g., 0.05) for DE calls.
