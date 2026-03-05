# 02-02 Class Review  Genome Assembly Evaluation, Sequencing Technologies, and Project QC Guidance

**Source:** `transcripts/02-02 Class Review_ Genome Assembly Evaluation, Sequencing Technologies, and Project QC Guidance-transcript.txt`  
**Date (from filename):** 02-02

## Summary (course notes)
- **Main focus:** Review of prior material with emphasis on sequencing technologies and QC framing.
- **Key takeaways:**
  - Server etiquette: coordinate concurrency, monitor load (e.g., `who`, `top`), and prefer shared/group directories to reduce duplication and permission issues.
  - FastQC deliverables should be organized for review (HTML/ZIP per mate); interpret PASS/WARN/FAIL as triage signals, not automatic accept/reject rules.
  - STAR is resource-heavy; plan runs around shared usage and use STAR summary outputs (unique/multi/unmapped) as alignment QC metrics.
- **Action items / follow-ups:**
  - Package/retain FastQC outputs in a consistent structure and record the top recurring WARN/FAIL modules for the weekly report.
  - Coordinate downloads/alignments so the group is not saturating bandwidth/CPU at the same time; document who is running what.
  - Capture STAR mapping summary metrics (unique/multi/unmapped) for downstream interpretation and troubleshooting.

## Themes detected (quick scan)
- FastQC; STAR aligner; system load; weekly report

## Transcript highlights (auto-extracted)
- Hi, sequencing gets so much cheaper now. It's cheaper, it's faster. You can get really fast turnaround depending on who you are working with. And from there, You are just picking what technology is best. If you are working with viruses or phage, s ; just use Illumina because they're shorter genomes. If you are doing with the eukaryote, You probably want P ac B io ;. You want those large fragmen…
- Additional computational complexities. Um, sometimes you'll see it referenced as these being the same thing. They're they're actually different. Um, so the first one, the overlap is where we're talking about you're looking from the ends, right? How much does this overlap? The more it overlaps, the more I trust this overlap. If, it's four bases. Yeah, that's a clue because the odds of having any…
- Doing the graph where you're looking at those overlaps and saying, all right, i'm going to see how the a, b and c go together. You're not just looking at b and c. You're saying, look, i got these. I'm going to look, is there anything else here that we can pull in here? It's easy to do the lookup with the key first that speeds up that part. Uh, those who have taken programming classes, we talked…
- Yeah, it takes a big beefy computer to manage that. So, what else we got? We're getting a little low on time too. So, when you're working your projects, I don't think we're going to do an assembly here. There's some overlap between when you do alignments and assemblies. Oftentimes with alignment, you're saying where do these fragments line up against the reference? And, then you're verifying th…
- Start to sink in. It takes a lot of time. Any of you ever done tissue culture? That's worse, but not by a lot. So Oh, the battery's dying. Okay.
- But you're pick two and compare them. Two and compare them. Sorry. What's good and bad about this? Uh for Thursday, remember the weekly reports the regular ones? You can do some optionally that you can skip one or maybe two, uh, depending if you count the optional during spring break, but with that one. The trap build the quality control. Go through, talk about you know all those different thin…
- If you seriously did not find any major issues, that's fine. If you tell me every week you didn't have any major issues, I am going to be skeptical. Everybody in here has. I had issues doing trap build recently. I was like, "Oh, I forgot that parameter. " Because you'll find there is a lot of parameters you have to mess with, especially with the aligners. We'll talk about those on Thursday. So,…
- So the fastqce, you should be running those. Try to get all of them if you can by Thursday. Okay. Uh and then once you're done, zip up all the HTML files, nothing else, just the HTML files and upload that to the sandbox. If you don't get it done by this Thursday it's okay, You get a little bit of grace, but I recommend doing it sooner rather than later. So you don't fall behind. Awesome Thank Y…

## Definitions (optional, add if used in your write-ups)
- **FastQC module:** A named QC check (PASS/WARN/FAIL) computed per FASTQ file.
- **Adapter signal:** Evidence read-through captured adapter/technical sequence; typically requires adapter clipping (not quality trimming).
- **Duplication levels:** Fraction of reads that are duplicates; in RNA-seq this can reflect high expression, not just PCR artifacts.
- **q-value / FDR:** Multiple-testing–adjusted significance metric; use with a cutoff (e.g., 0.05) for DE calls.
