# BIOL550 Week 2 Material Overview
## Advanced NGS Platforms & Cost-Performance Analysis (Continuing Weeks 1–2 Content)
### Following Academic Plan for Spring 2026

---

## Document Purpose

This document provides a **comprehensive Week 2 material overview** for BIOL550 (High Throughput Sequencing Analysis), continuing the Weeks 1–2 combined platform and cost analysis unit. Week 2 deepens Week 1 concepts by examining real-world platform selection tradeoffs, cost trends from 2008–2026, hands-on data quality analysis (FastQC), and integration with your DSCI601 + BIOL550 fairness-aware project.

**Format:** Markdown (.md) | Downloadable as PDF or DOCX  
**Total Reading Time:** 4–5 hours (shorter than Week 1; focus is on consolidation + tools)

---

## Course Context: Weeks 1–2 as Unified Unit

| Aspect | Week 1 | Week 2 |
|--------|--------|--------|
| **Focus** | Platform fundamentals; SBS chemistry | Platform economics; real-world tradeoffs; hands-on QC |
| **Learning Arc** | "What exists and why?" | "How to choose? What are the costs and limits?" |
| **Lecture** | Mon 11:00, Wed 11:00, Thu 9:30 Zoom (same slides as W1) | Same schedule; continued platform discussion |
| **Materials** | Mardis (2008) seminal review | Optional 2020 Illumina vs. BGI study + FastQC tutorial |
| **Deliverables** | Lab report (reflection on platforms) | Lab report (platform choice analysis + FastQC interpretation) |

**Instructor Note:** Weeks 1–2 use the same lecture slides ("HTS Week 1 and 2 Tech Analysis"); content scaffolds from foundational concepts → application-driven decisions.

---

## Week 2 Learning Outcomes

By the end of Week 2, students will:

1. **Evaluate platform economics** (cost per genome, cost per base, time-to-result) and understand cost trends from 2008–2026
2. **Compare real-world platform performance** using the 2020 Illumina NovaSeq vs. BGI MGISEQ single-cell RNA-seq study
3. **Use FastQC** to analyze raw sequencing data and interpret quality metrics (per-base Q-scores, quality by cycle, base composition)
4. **Make data-driven platform decisions** for specific research scenarios (balancing cost, read length, accuracy, turnaround time)
5. **Recognize fairness implications** of platform choice (which platforms better serve underrepresented populations?)
6. **Understand when each platform is appropriate** (short-read SNV calling vs. long-read assembly vs. portable field diagnostics)
7. **Connect Week 2 to Week 3** (assembly algorithms depend on read length/quality from Week 2 platform choice)

---

## Week 2 Required Materials

### Primary Reading (Recommended, Not Required)

**2020 Platform Comparison Study** – "Illumina NovaSeq vs. BGI MGISEQ for Single-Cell RNA-Seq"

| Attribute | Details |
|-----------|---------|
| **Type** | Peer-reviewed platform performance study |
| **Length** | ~12–15 pages (shorter than Mardis; focused comparison) |
| **Difficulty** | Intermediate (practical; fewer theory sections) |
| **Time to Read** | 45 minutes – 1 hour |
| **Availability** | Referenced in BIOL550 syllabus; check myCourses or RIT library |
| **Why This Paper** | Modernizes Mardis (2008); shows that multiple vendors now produce equivalent quality; demonstrates current cost parity |
| **Key Finding** | MGISEQ-2000 detected comparable genes and barcodes to Illumina NovaSeq for single-cell libraries, suggesting vendor consolidation hasn't reduced platform options |

---

### Lecture Materials (Provided by Instructor)

**Slides:** "HTS Week 1 and 2 Tech Analysis" (same as Week 1; continued discussion)

| Attribute | Details |
|-----------|---------|
| **Format** | PowerPoint slides (available on myCourses) |
| **Content** | Extended platform economics, cost curves, performance benchmarks, case studies |
| **Use** | Reference during class; key figures show cost trajectories |
| **Timing** | Available by Monday, Jan 27 (Week 2 continuation) |

---

### Hands-On Tools & Tutorials (Optional but Recommended)

**FastQC Quality Control Tool**

| Tool | Purpose | Time |
|------|---------|------|
| **FastQC v0.11.9+** | Interpret raw FASTQ quality metrics | 30–45 min to learn |
| **Available at:** | https://www.bioinformatics.babraham.ac.uk/projects/fastqc/ | Free; command-line or GUI |
| **What to Learn** | Per-base quality scores, quality by cycle, base composition, adapter contamination | Directly applies Week 2 concepts |
| **Example Dataset** | Instructor may provide sample FASTQ file (from Week 1 real sequencing run) | Practice on actual data |

---

## Week 2 Core Content: Detailed Breakdown

### Part 1: NGS Platform Economics (2008 → 2026 Reality Check)

**The Cost Curve: From Thousands to Hundreds**

Mardis (2008) predicted: Cost will drop exponentially. By 2026, this prediction has been **fully realized**:

| Year | $/Genome (Illumina) | Sequencer Cost | Read Output | Event |
|------|-------------------|-----------------|------------|-------|
| 2008 | $100,000 | $500k–$1M | 1–2 Gb/run | Mardis paper; NGS nascent |
| 2012 | $4,000 | $200k | 100–200 Gb/run | HiSeq emergence |
| 2015 | $1,000 | $125k | 400–600 Gb/run | NovaSeq development begins |
| 2020 | $300 | $100k | 2–4 Tb/run | NovaSeq mainstream |
| 2024–2026 | $100–300 | $100k+ | 1–6 Tb/run | Current pricing; BGI competitive |

**What This Means:**
- A human genome went from $100k (2008) → $100 (2026) in ~18 years
- Cost reduction enabled **population-scale studies** (1000 Genomes, GTEx, etc.)
- **Bottleneck shifted** from sequencing cost → computational storage and interpretation
- Multiple vendors (Illumina, BGI, not to mention PacBio, Nanopore) now competitive

**Fairness Implication:** 
Lower costs mean more labs globally can perform sequencing. However, **who benefits from the cost drop?** Developed countries with research infrastructure adopted NGS earlier and built expertise. Developing regions are catching up but may be over-represented by older, cheaper platforms or underfunded.

---

### Part 2: Real-World Platform Performance (2020 Study)

**Study Design:** 2020 benchmark comparing Illumina NovaSeq and BGI MGISEQ-2000 using **identical single-cell RNA-seq libraries** (10x Genomics standard).

**Key Findings:**

| Metric | Illumina NovaSeq | BGI MGISEQ-2000 | Conclusion |
|--------|-----------------|-----------------|-----------|
| **Genes per cell detected** | Median 3,000 | Median 2,950 | Comparable (~1% difference) |
| **Barcodes per cell (multiplexing)** | ~96–384 | ~96–384 | Same |
| **Sequencing depth** | 50k–100k reads/cell | 50k–100k reads/cell | Equivalent |
| **Cost per run** | Higher (Illumina premium) | ~20–30% cheaper | BGI advantage |
| **Turnaround time** | 1–2 days | Similar | Parity |
| **Error rate** | 0.1% | 0.1% | Equivalent |

**What This Study Teaches:**
1. **Market Shift:** By 2020, multiple vendors achieved **functional equivalence** for mainstream applications (RNA-seq)
2. **Cost Pressure:** BGI's competitive pricing forced Illumina to justify premium (reputation, software ecosystem)
3. **Application-Dependent:** For RNA-seq, either platform works. For niche applications (ancient DNA, ultra-high accuracy), platforms differ more
4. **Vendor Consolidation Risk:** Over-reliance on one vendor (Illumina) has decreased; now labs have real options

---

### Part 3: Cost-Benefit Analysis Across Platforms (Real Scenarios)

**Scenario 1: Population Variant Discovery (1,000 individuals, $150k budget)**

| Platform | Coverage | Total Cost | $/Genome | Pros | Cons |
|----------|----------|-----------|----------|------|------|
| **Illumina 30×** | 30× WGS | $150k (~$150/ind) | $150 | High accuracy; reference genome ecosystem | Structural variants missed |
| **BGI 20×** | 20× WGS | $150k (~$150/ind) | $150 | Cost parity; competitive | Slightly lower coverage per person |
| **PacBio 20×** | 20× CLR | $200k (over budget) | $200 | Structural variants captured | Cost prohibitive for 1000 individuals |

**Decision:** Illumina or BGI 30–40× WGS. Tradeoff: miss rare structural variants to enable population-scale SNV discovery.

---

**Scenario 2: De Novo Genome Assembly (Single organism, $10k budget)**

| Platform | Read Length | Run Cost | Coverage Needed | Total Cost | Outcome |
|----------|------------|----------|-----------------|-----------|---------|
| **Illumina 250 bp** | 150 bp paired | $3k | 100× short | $3k | Draft genome; gaps at repeats |
| **PacBio HiFi** | 15 kb | $10k | 30–40× long | $10k | Near-complete; few gaps |
| **Nanopore** | 50+ kb | $2k device | 20–30× long | $4k (device) | Rapid assembly; higher error |

**Decision:** PacBio HiFi or Nanopore. Tradeoff: higher per-run cost, but long reads solve the repeat problem that plagued short-read assembly.

---

**Scenario 3: Field Diagnostics in Developing Region (rapid pathogen detection)**

| Platform | Portability | Cost per Run | Turnaround | Accuracy | Suitable? |
|----------|------------|-------------|-----------|----------|-----------|
| **Illumina** | Lab-only | $3k–5k | 1–2 days | 0.1% | No (infrastructure required) |
| **Nanopore MinION** | Handheld | $200–500 (per device) | Hours | 5–15% raw | **YES** (field-ready) |
| **BGI** | Lab-only | Similar to Illumina | Similar | Equivalent | No (infrastructure required) |

**Decision:** Nanopore. Tradeoff: higher per-base error (mitigated by consensus basecalling), but portability enables rapid diagnostics in remote settings.

---

### Part 4: Quality Metrics & FastQC (Hands-On Introduction)

**What FastQC Does:**

FastQC analyzes raw FASTQ files and produces visualizations of:

1. **Per-base quality score distribution** (what we discussed in Week 1)
2. **Quality scores by position** (cycle-by-cycle degradation)
3. **Per-base nucleotide content** (are we seeing expected %A, C, G, T?)
4. **GC content distribution** (biased samples show abnormal peaks)
5. **Adapter contamination** (residual sequencing adapters?)
6. **Duplicate reads** (PCR bias?)
7. **Overrepresented sequences** (contaminants or polyA tails?)

**Example FastQC Report Interpretation:**

**Report Section: Quality by Cycle**
```
Cycles 1–50:    Green zone (Q30–40)      ✓ Good
Cycles 51–100:  Yellow zone (Q20–25)     ⚠ Acceptable (expect this)
Cycles 101–150: Red zone (Q15–20)        ⚠ Consider trimming
```

**Action:** Trim reads to cycle 100–120 for downstream analysis (retain high-confidence bases).

**Report Section: Per-Base Nucleotide Content**
```
Position 1–20:  Abnormally high A+T content  ⚠ Check for adapter/bias
Position 21–150: Balanced (25% A, C, G, T)   ✓ Good
```

**Action:** Investigate positions 1–20; may indicate adapter contamination.

---

### Part 5: Platform Selection Framework (Decision Tree)

**Question 1: What is your research question?**
- Variant discovery in coding regions? → Short-read SNV calling (Illumina/BGI)
- Structural variations / genome assembly? → Long-read (PacBio/Nanopore)
- Metagenomics / unknown organisms? → Long-read or short-read high-throughput (Illumina)
- Field diagnostics? → Nanopore (portable)
- Ancient/degraded DNA? → Short reads OK; long reads better if available

**Question 2: What is your budget?**
- $100–300/genome? → Illumina or BGI WGS
- $1–3k/sample? → PacBio or deep Illumina
- <$1k total budget? → Nanopore device + runs

**Question 3: What is your timeline?**
- Need results in weeks? → Illumina (mature pipeline)
- Can wait months? → PacBio (higher quality but slower)
- Need results in hours? → Nanopore (real-time sequencing)

**Question 4: Do fairness considerations matter?**
- Is my model trained on biased data? → Choose platform used in training (for consistency)
- Am I studying underrepresented populations? → Ensure platform covers ancestry diversity in databases
- Do I need replicates across platforms? → Mix platforms to validate findings

---

## Week 2 Grading & Deliverables

### BIOL550 Grading (Continued from Week 1)

Same structure applies; Week 2 is second of 10 weekly lab reports.

### Week 2 Specific Deliverables

**1. Attendance & Participation** (→ 90 pts participation pool)
- Attend Mon 11:00, Wed 11:00, Thu 9:30 Zoom
- Ask ≥1 question about platform economics or tradeoffs
- Engage in Q&A about FastQC interpretation

**2. Platform Economics Reflection** (1–2 pages, if assigned)
- Reflect on cost curve from Mardis (2008) predictions → 2026 reality
- Discuss one scenario where cheaper sequencing enables a study that wouldn't have been possible in 2008
- Connect to fairness: who benefits from the cost drop? Who might be left behind?

**3. FastQC Hands-On (Optional Exercise)**
- Download sample FASTQ from instructor (or public dataset)
- Run FastQC
- Interpret results (quality by cycle, GC content, adapters)
- Write 1-paragraph summary: "What does this data quality tell me about the sequencing run?"

**4. Second Weekly Lab Report** (2–3 pages, due Sunday Feb 2, 11:59 PM)
- Summarize Week 2 concepts (platform economics, real-world tradeoffs)
- Solve one platform selection scenario (from your project context)
- Interpret a FastQC output (or hypothetical)
- Connection to your BIOL550 project: "Which platform would I choose for my RNA biomarker dataset, and why?"

---

## Week 2 & Your Integrated Project (BIOL550 + DSCI601)

### How Week 2 Platform Knowledge Informs Your Project

**Your Project:** Fair RNA Biomarker Discovery

**Week 2 → Week 3 Transition:**

Week 2 determines: **Which platform produced my dataset?**
- If **Illumina**: Expect short, accurate reads; good for splice site detection; assembly will show fragmentation at repeats
- If **BGI**: Similar to Illumina; no major downstream differences
- If **PacBio**: Long reads can detect full-length isoforms; assembly is better but data rarer (smaller ecosystem)
- If **Nanopore**: Very long reads; higher error (need polishing); strong for isoform detection but less common in public datasets

**Example:** If your RNA-seq dataset is Illumina:
- You'll use TopHat/HISAT (Week 4) optimized for short paired-end reads
- You'll struggle with full-length isoform assembly (expected limitation)
- In Week 11 fairness audit, you'll check: "Do Illumina's short reads + splice site detection bias certain isoforms?"

**Fairness Angle (ISTE780 integration):**
- Week 2 Platform Choice → Week 11 Fairness Audit
- "Our RNA-seq is Illumina 75 bp paired-end. Does this short read length systematically miss isoforms in certain populations?"
- Spine Ledger Entry: "Decision: Use Illumina data as-is; acknowledge limitation that long-read isoforms may be underdetected globally."

---

## Integration with BIO630 / ISTE780 / IDAI700

### BIO630 Connection (Algorithms Depend on Data)

**Week 1–2 Platform Characteristics → Week 3 Assembly Algorithms**

In BIO630, you learned de Bruijn graphs and OLC assembly. Now you understand **why each algorithm was designed for specific read lengths:**

- **de Bruijn graphs** (Velvet) work for **short reads** (35–50 bp) by finding k-mer overlaps
- **OLC** works for **long reads** (>1 kb) by finding suffix-prefix overlaps
- **Hybrid methods** (MaSuRCA) need mixed read lengths to maximize contiguity

**Example:** If Week 2 platform analysis shows your data is Illumina 150 bp reads, then Week 3 assembly will use **de Bruijn graphs** (like Velvet), not OLC. Understanding the platform choice → understanding the algorithm choice.

---

### ISTE780 Connection (Fairness in Data Generation)

**Week 2 Platform Selection = First Fairness Decision**

ISTE780 taught fairness metrics. Now apply it to **data generation:**

- **Disparate Impact in Infrastructure:** Which populations have access to which sequencing platforms?
  - Illumina is dominant in developed countries; BGI strong in Asia
  - Nanopore is cheaper but less supported in some regions
  - Is your research inadvertently studying only Illumina-sequenced genomes?

**Spine Ledger Entry (Week 2):**
```
Decision: Use public RNA-seq data (available source)
Rationale: Study depends on available public data
ISTE780 fairness lens: "Are public datasets biased toward certain populations?"
Finding: Public GEO/SRA data skews toward Illumina + Caucasian-derived samples
Mitigation: Explicitly acknowledge in Methods; flag as limitation
```

---

### IDAI700 Connection (Procedural Justice in Data Selection)

**IDAI700 teaches: Decisions about data are not neutral; they reflect power dynamics.**

**Week 2 Procedural Justice Question:**
"Who decided that THIS dataset would be sequenced? Whose interests are served by sequencing this particular population/tissue/disease?"

**Example:** If studying a disease rare in wealthy countries but common in low-income regions:
- Sequencing may be under-resourced (fewer labs, older platforms)
- Resulting datasets may use older, less mature platforms
- Your fairness audit (Week 11) must account for this **data generation disparity**

---

## Week 2 Study Resources & Tools

### Online Resources

| Resource | Type | Link | Use |
|----------|------|------|-----|
| **FastQC** | Tool | https://www.bioinformatics.babraham.ac.uk/projects/fastqc/ | Quality control (hands-on) |
| **FastQC Manual** | Documentation | https://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/ | Learn all report sections |
| **Illumina Platform Guide** | Vendor docs | https://www.illumina.com/systems/sequencing-platforms.html | Platform specs + cost references |
| **BGI Platform Info** | Vendor docs | https://www.bgigenomics.com/ | Alternative platform reference |
| **PacBio Specs** | Vendor docs | https://www.pacb.com/ | Long-read platform reference |
| **Nanopore Tech** | Vendor docs | https://nanoporetech.com/ | Field-sequencing platform |
| **2020 Platform Study** | Journal paper | myCourses BIOL550 | Real-world benchmark |
| **RNA-Seqlopedia** | Conceptual guide | http://rnaseq.uoregon.edu/ | Practical RNA-seq decisions |

---

## Week 2 Learning Checklist

Before moving to Week 3, verify you can:

- [ ] **Explain** cost trajectory from $100k/genome (2008) → $100 (2026)
- [ ] **Interpret** the 2020 platform comparison: what does "comparable gene detection" mean?
- [ ] **Calculate** cost per genome for a hypothetical project (budget, depth, platform)
- [ ] **Describe** FastQC output: quality by cycle, GC content, adapters
- [ ] **Recommend** a platform for three different scenarios (SNV discovery, assembly, field diagnostics)
- [ ] **Evaluate** fairness implications of platform choice (infrastructure bias, ancestry representation)
- [ ] **Connect** platform choice to downstream Week 3 assembly algorithm selection
- [ ] **Use** FastQC to analyze a real or hypothetical FASTQ file
- [ ] **Discuss** how platform selection is not neutral (connects to IDAI700)

---

## Discussion Prompts & Reflection Questions

### Prompt 1: Platform Economics & Accessibility

**Scenario:** You are establishing a genomics lab in a low-income country with a $50k annual budget for sequencing.

**Questions:**
1. Which platform would you prioritize? (Consider cost, support, ecosystem)
2. How would you offset the infrastructure costs (instrument purchase, reagents, personnel training)?
3. What fairness considerations arise? (Will your lab primarily serve local populations or wealthy international clients?)

**Expected Answer Sketch:**
- **Platform:** BGI or Nanopore device (lower initial cost than Illumina)
- **Offset:** Consortium partnerships, grant funding, shared lab model
- **Fairness:** Risk is that cheaper platform = lower-quality data for local populations; solution is building local expertise + validation pipelines

---

### Prompt 2: FastQC Interpretation in Practice

**Scenario:** You receive FastQC results showing:
- Cycles 1–60: Q32–35 (green)
- Cycles 61–120: Q22–25 (yellow)
- Cycles 121–150: Q8–12 (red)
- GC content: Abnormally high (60% instead of 50%)
- Overrepresented sequences: "AAAAAAA..." (polyA tail contamination)

**Questions:**
1. What does this quality pattern suggest?
2. Should you trim? If so, where?
3. What might explain the high GC content?
4. How would you proceed with analysis?

**Expected Answer Sketch:**
- **Pattern:** Typical Illumina degradation + adapter contamination
- **Trimming:** Cut to cycle 100–110 (Q20 is acceptable for most applications)
- **GC bias:** Likely mRNA polyA contamination (RNA-seq artifact); not an error, just a characteristic
- **Proceed:** Trim to Q20, remove polyA if possible, then proceed to alignment

---

### Prompt 3: Platform Choice for Your Project

**Scenario:** Your BIOL550 project uses published RNA-seq data. You discover the data was generated on BGI MGISEQ (which you didn't expect).

**Questions:**
1. Does this change your analysis plan? Why or why not?
2. How would you verify the data quality?
3. What fairness questions does this raise? (Who has access to BGI sequencing? Geographic bias?)

**Expected Answer Sketch:**
- **Analysis Plan:** BGI reads are short and accurate like Illumina; methods don't change, but you note platform in Methods
- **Quality:** Run FastQC on a sample; compare to your expectations from Week 1–2
- **Fairness:** BGI data is prevalent in Asia-Pacific region; if your dataset is BGI, consider whether it skews geographic/ancestry representation

---

## Troubleshooting & Common Questions

### Q: Do I need to run FastQC myself, or is it optional?

**A:** Optional, but **strongly recommended**. FastQC is a standard tool in any genomics workflow. By Week 3, you'll understand why read quality matters for assembly. Running it once cements that understanding.

### Q: The 2020 platform study says Illumina and BGI are equivalent. So why does Illumina still dominate?

**A:** Great question! Reasons include:
1. **Network effects:** Illumina ecosystem is larger (more tools, more documentation, more trained personnel)
2. **Inertia:** Labs invested in Illumina infrastructure; switching costs are high
3. **Brand trust:** Illumina has longer track record (reputation)
4. **Regulatory:** In clinical contexts, Illumina has more FDA approvals
5. **Politics/trade:** BGI has geopolitical concerns in some Western countries

**Fairness angle:** This market concentration may disadvantage researchers in regions where BGI is more available.

### Q: If sequencing costs dropped so much, why aren't my grad student stipends dropping too?

**A:** Economics of sequencing ≠ economics of genomics research. Costs for storage, computation, bioinformatics training, and statistical analysis are rising. "Cheap sequencing, expensive interpretation."

### Q: Should I choose a platform based on cost alone?

**A:** No. Cost is one factor. Others: accuracy for your application, platform maturity (software ecosystem), availability in your region, fairness implications (who benefits from this choice?).

---

## Week 2 Study Tips & Time Management

### Reading Approach (For 2020 Platform Study)

If reading the optional 2020 study:
- **Skim introduction** (5 min): Why compare these platforms?
- **Focus on Results tables** (10 min): Genes detected, error rates, cost
- **Read Discussion** (10 min): What does equivalence mean?
- **Total:** 25–30 min effective reading

---

### FastQC Learning Path

**Option 1: Self-guided (30 min)**
- Download FastQC from website
- Read the manual (10 min skim)
- Run on your own data or instructor's sample (15 min)
- Interpret results (5 min)

**Option 2: With Instructor (Zoom workshop, 45 min)**
- Instructor demonstrates on real data
- Q&A on interpretation
- More efficient for learning

---

### Lab Report Writing (Week 2)

**Structure (2–3 pages):**
1. **Executive Summary** (0.5 page): Platform choice for your scenario + justification
2. **Cost Analysis** (0.5 page): Budget breakdown; why this platform?
3. **Quality Interpretation** (0.5 page): FastQC results (real or hypothetical)
4. **Fairness Reflection** (0.5 page): Who benefits from your platform choice? Any equity concerns?
5. **Connection to Project** (0.5 page): How does this platform impact Week 3–14?

**Tone:** Professional, analytical (like a technical memo, not creative writing)

---

## Next Steps: Bridge to Week 3

**Week 2 ends; Week 3 begins:**

**Week 2 gives:** Raw data characteristics (quality, platform, read length)  
**Week 3 needs:** Algorithm selection based on those characteristics  
**Week 3 topic:** Genome Assembly Algorithms

**Your preparation for Week 3:**
- Understand that assembly difficulty depends on platform choice (short vs. long reads)
- Expect to learn why de Bruijn graphs work for Illumina but fail for long reads
- Be ready to think about your own dataset: "Is it short-read? Will it assemble well or poorly?"

---

## Document Metadata

| Field | Details |
|-------|---------|
| **Title** | BIOL550 Week 2 Material Overview |
| **Course** | BIOL550 (High-Throughput Sequencing Analysis) |
| **Institution** | Rochester Institute of Technology (RIT) |
| **Semester** | Spring 2026 |
| **Week** | 2 of 16 |
| **Schedule** | Jan 27 – Feb 2, 2026 |
| **Alignment** | Spring 2026 Academic & Strategy Plan + BIOL550 Syllabus + PhD Integration |
| **Format** | Markdown (.md) → Convertible to PDF/DOCX |
| **Status** | ✅ Complete & Ready for Use |

---

## Summary

This comprehensive Week 2 Material Overview provides:

✅ **Deepening of Week 1** – Platform economics, real-world tradeoffs, hands-on tools  
✅ **Cost Trends Analysis** – 2008 predictions validated by 2026 reality ($100k → $100/genome)  
✅ **Platform Performance Benchmarking** – 2020 study showing Illumina/BGI equivalence  
✅ **Hands-On FastQC Introduction** – How to interpret raw sequence quality  
✅ **Scenario-Based Decision Making** – Platform selection for SNVs, assembly, field diagnostics  
✅ **Fairness Integration** – Infrastructure bias, accessibility, ancestry representation  
✅ **BIO630/ISTE780/IDAI700 Connections** – Platform choice → algorithm selection → fairness audit  

The document bridges Week 1's foundational concepts with Week 2's practical application and prepares you for Week 3's assembly algorithms (which directly depend on platform choice from Week 2).

---

**End of BIOL550 Week 2 Material Overview**

---

### Citation & Attribution

This document integrates information from:
- BIOL550 Comprehensive Course Guide (file:25)
- BIOL550-Notes.md (file:28)
- Spring 2026 Academic & Strategy Plan (files:22, 24, 36)
- Mardis, E. R. (2008) *Annual Review of Genomics and Human Genetics*
- Referenced 2020 Illumina vs. BGI comparison study
- BIOL550 Weeks 1–2 integration materials

---

### Questions or Feedback?

If you have questions about Week 2 material:
- **Instructor:** Michael Osier (myCourses or office hours)
- **FastQC Support:** https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
- **RIT Tutoring:** Available at RIT Learning Commons