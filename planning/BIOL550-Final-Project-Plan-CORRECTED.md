# BIOL550 High Throughput Sequencing Analysis
## Group Project Plan and Itinerary - 3-PERSON TEAM
### Spring 2026

---

## 1. Project Overview

### Course Context
This document outlines the group project strategy for BIOL550: High Throughput Sequencing Analysis (Spring 2026, Instructor: Michael Osier). The course focuses on analyzing real eukaryotic next-generation sequencing (NGS) data through a semester-long collaborative research project with structured analysis phases and comprehensive documentation.

### Project Goals

**Primary Objective:** Analyze a real HTS dataset through a systematic three-phase workflow (Primary → Secondary → Tertiary Analysis), culminating in a publication-quality research paper demonstrating mastery of bioinformatic methods, statistical analysis, and scientific communication.

**Key Deliverables:**
- Successful completion of Primary Stage Analysis (Quality Control and data preprocessing)
- Successful completion of Secondary Stage Analysis (Alignment and/or Assembly)
- Successful completion of Tertiary Stage Analysis (Differential Expression Analysis and Visualization)
- 10 individual weekly lab reports (3 pts each = 30 pts)
- 3 drafts of final research paper (Weeks 13, 14, 15)
- Final publication-quality paper (30-50 pages, minimum 15 primary sources)
- Bonus analyses (SNP calling, transcriptome creation, etc.) if time permits

---

## 2. Team Composition and Roles (Option A - Specialist Distribution)

### Final Team Composition

**Team Size:** 3 members + 1 undergraduate research support

**Member 1 - Computational Biology Lead**
- **Name:** Samuel Kopelev
- **Background:** Bioinformatics expertise
- **Primary Responsibilities:**
  - Design and implement analysis pipeline architecture
  - Execute QC, preprocessing, alignment/assembly workflows
  - Manage computational resources and version control (GitHub)
  - Ensure reproducibility and technical documentation
  - Create infrastructure for analysis tracking and decision logging
- **Leads Phases:** Primary Analysis (Weeks 6-8), Secondary Analysis (Weeks 10-11)
- **Key Deliverables:** Clean preprocessing code, alignment/assembly results, GitHub repo, reproducibility documentation, Methods section (computational)

**Member 2 - Statistical Analysis & Fairness Audit Lead**
- **Name:** Piter Garcia (YOU)
- **Background:** Data Science graduate student with Computer Science experience
- **Primary Responsibilities:**
  - Design statistical methods and analysis approaches
  - Execute differential expression analysis with rigor
  - Implement fairness metrics and disparate impact audits
  - Create publication-quality visualizations
  - Conduct multiple testing correction (FDR, Bonferroni)
- **Leads Phases:** Tertiary Analysis (Weeks 12-15), Fairness Audits (Weeks 11-14)
- **Key Deliverables:** DE results with statistical support, fairness audit report, visualizations, Methods section (statistical)

**Member 3 - Biological Integration & Literature Lead**
- **Name:** Claire Marshall
- **Background:** BioTech and Bioinformatics expertise
- **Primary Responsibilities:**
  - Provide biological context and interpretation throughout all phases
  - Conduct comprehensive literature review (15+ primary sources)
  - Validate computational findings against biological knowledge
  - Design pathway analysis and functional interpretation
  - Lead biological writing (Introduction, Discussion)
- **Involved in:** All phases (biological lens throughout, Weeks 1-16)
- **Key Deliverables:** Literature synthesis, biological interpretation, Introduction/Discussion sections, paper coherence

**Member 4 - Research Support**
- **Name:** Nikhi Boggavarapu
- **Background:** Undergraduate student
- **Primary Responsibilities:**
  - Data organization and metadata management
  - Literature compilation and coordination
  - Meeting notes and decision log tracking
  - Support data preprocessing and literature searches
- **Involved in:** All phases (supporting capacity, Weeks 1-16)
- **Key Deliverables:** Organized data structure, literature summaries, meeting documentation

---

## 3. Analysis Framework: 3-Phase Pipeline

### Phase 1: Primary Stage Analysis
**Timeline:** Weeks 6-8 (February 16 – March 2)  
**Lead:** Samuel Kopelev (Computational Biology Lead)  
**Focus:** Quality Control and preprocessing

**Responsibilities:**
- Run FastQC for quality assessment of raw reads
- Execute quality trimming with appropriate tools (CutAdapt, FastX)
- Filter for adapter sequences and contamination
- Generate QC reports and visualizations
- Document all quality metrics and filtering thresholds
- Identify and troubleshoot any quality issues
- Work with Claire to interpret QC patterns biologically
- Support from Piter on fairness metrics in QC

**Deliverables:**
- Clean, quality-controlled reads ready for alignment/assembly
- QC report with visualizations
- Weekly lab reports documenting process and results
- Participation grade (30 pts) based on completeness and methodology

---

### Phase 2: Secondary Stage Analysis
**Timeline:** Weeks 10-11 (March 16 – March 23)  
**Lead:** Samuel Kopelev (Computational) + Piter Garcia (Fairness Audit)  
**Focus:** Read Alignment and/or Assembly

**Responsibilities (Samuel):**
- Implement alignment strategy using Bowtie2 and TopHat (for RNA-Seq)
- Perform de novo assembly if applicable (using Velvet or alternative)
- Generate alignment statistics and coverage analysis
- Create BAM files and coordinate validation
- Assess alignment quality and troubleshoot mapping issues
- Compare multiple methods if appropriate
- Coordinate with Piter on fairness-aware alignment auditing

**Responsibilities (Piter - Fairness Audit):**
- Calculate disparate impact (DI) metrics across biological groups
- Assess equalized odds in alignment quality by sample groups
- Generate fairness audit report with recommendations
- Identify potential systematic biases in alignment

**Deliverables:**
- Aligned reads (BAM files) or assembled contigs
- Alignment/assembly quality metrics
- Coverage analysis and visualizations
- Fairness Audit Report (Week 11)
- Weekly lab reports
- Participation grade (30 pts)

---

### Phase 3: Tertiary Stage Analysis
**Timeline:** Weeks 12-15 (March 30 – April 20)  
**Lead:** Piter Garcia (Statistical Analysis Lead)  
**Focus:** Differential Expression Analysis and Visualization

**Responsibilities (Piter - Statistical):**
- Quantify gene/transcript expression (using Cufflinks, RSEM, or alternative)
- Implement differential expression analysis with statistical rigor
- Apply appropriate normalization methods
- Conduct multiple testing correction (FDR, Bonferroni)
- Generate expression matrices and statistical summaries
- Create publication-quality visualizations (volcano plots, heatmaps, boxplots)
- Perform additional analyses (pathway analysis, clustering, correlation studies)
- Implement fairness auditing (disparate impact, equalized odds by group)
- Lead statistical validation and interpretation

**Responsibilities (Samuel - Support):**
- Provide technical details on preprocessing that affect expression analysis
- Support visualization infrastructure and data management
- Document all analysis parameters and commands

**Responsibilities (Claire - Biological Integration):**
- Interpret DE results in biological context
- Perform pathway analysis and functional enrichment
- Connect findings to existing literature
- Prepare biological interpretation for Results section
- Coordinate with Piter & Samuel on validity of findings

**Deliverables:**
- Differential expression results with statistical support
- Expression visualizations and summary tables
- Fairness audit report for DE phase (disparate impact, equalized odds)
- Analysis of biological significance
- Weekly lab reports
- Participation grade (30 pts)

---

### Phase 4: Bonus Analyses (Optional)
**Timeline:** Weeks 15-16 (April 20 – April 27)  
**Focus:** Extended analyses for additional credit (up to 20 bonus points)

**Possible Bonus Analyses:**
- SNP calling and variant analysis (Samuel lead)
- Novel transcript discovery (Samuel lead)
- Isoform quantification and analysis (Samuel lead)
- Co-expression network analysis (Piter lead)
- Prediction of functionally important variants (Piter lead)
- Machine learning approaches to classification/clustering (Piter lead)
- Biological validation and pathway integration (Claire lead)

---

## 4. Timeline and Itinerary - Weeks 1-16

| Week | Dates | Key Activities | Samuel Tasks | Piter Tasks | Claire Tasks | Nikhi Tasks | Deliverables | Points |
|------|-------|---|---|---|---|---|---|---|
| 1 | Jan 12 | Course intro, HTS basics, Unix/Linux | Set up environment, review tools | Review statistics background | Prepare biology context | Organize documents | Flowchart | — |
| 2 | Jan 19 | HTS technology, Trapnell protocol | Study workflows, begin practice | Statistical analysis practice | Review protocols | Organize resources | Trapnell flowchart | 10 |
| 3 | Jan 26 | Trapnell QC practice, Project selection | Practice QC tools, identify projects | Statistical feasibility | Biological relevance assessment | Literature search | Project picks (1st & 2nd) | 10 |
| 4 | Feb 2 | Trapnell alignment practice | Alignment execution | Statistical interpretation | Discuss implications | Coordinate team | Lab report 1 | 3 |
| 5 | Feb 9 | Trapnell DE analysis | Support expression analysis | Conduct DE analysis | Interpret results | Organize data | Lab report 2 | 3 |
| 6 | Feb 16 | **BEGIN PRIMARY STAGE** | FastQC QC on real data | Fairness metrics planning | Biological context docs | Data organization | Lab report 3, QC analysis | 33 |
| 7 | Feb 23 | Continue Primary Stage | Quality trimming, preprocessing | Review fairness approach | Research similar studies | Literature compilation | Lab report 4 | 3 |
| 8 | Mar 2 | **PRIMARY STAGE COMPLETE** | Finalize QC, document methods | Fairness audit setup | Validate approach | Meeting notes | Lab report 5 | 3 |
| 9 | Mar 9 | Spring Break | Optional work | Optional work | Optional work | Optional | Optional report | 0 |
| 10 | Mar 16 | **BEGIN SECONDARY STAGE** | Bowtie2/TopHat alignment | Disparate impact analysis | Interpret patterns | Metadata organization | Lab report 6, Secondary analysis | 33 |
| 11 | Mar 23 | **FAIRNESS AUDIT REPORT** | Alignment finalization | **FAIRNESS AUDIT COMPLETE** | Biological validation | Decision log tracking | Lab report 7, **Fairness Report** | 3 |
| 12 | Mar 30 | **BEGIN TERTIARY STAGE** | Support DE infrastructure | **DE ANALYSIS BEGINS** | Support validation | Organize results | Lab report 8 | 3 |
| 13 | Apr 6 | Tertiary Stage analysis | Provide technical docs | Finalize visualizations | Biological interpretation | Compile notes | Lab report 9, **Paper Draft 1 (Outline)** | 35 |
| 14 | Apr 13 | Tertiary Stage analysis | Methods documentation | Finalize DE results | Discussion draft | Literature organization | Lab report 10, **Paper Draft 2 (50%)** | 35 |
| 15 | Apr 20 | Bonus analyses planning | Implement bonus (optional) | Coordinate bonus analyses | Biological validation | Support bonus work | **Paper Draft 3 (90%)** | 20 |
| 16 | Apr 27 | Project completion | Finalize infrastructure | Finalize statistics | Finalize writing | Peer evaluations | **FINAL PAPER due 11:59pm**, Peer evals | 44 |

---

## 5. Weekly Lab Report Structure

### Purpose
Individual lab reports (10 of 12 possible weeks) document progress, methods, troubleshooting, and planning. These are essential for tracking your contributions and methodology development. **Each member submits individual reports documenting THEIR role.**

### Required Elements (3/4–2 pages, single-spaced)

1. **Accomplishments Since Previous Report**
   - Specific analyses completed
   - Data processed or generated
   - Tools executed or developed
   - Results achieved
   - How you coordinated with other team members

2. **Methods Used**
   - Tools and software employed (with versions)
   - Specific commands executed (with parameters)
   - Analysis approaches and justification
   - Data sources and preprocessing steps
   - How your methods feed into other members' work

3. **Problems Encountered & Solutions**
   - Technical issues and resolution strategies
   - Unexpected results and interpretation
   - Parameter adjustments and why
   - Questions or areas needing discussion
   - Communication with team members about blockers

4. **Goals for Coming Week**
   - Next analysis steps
   - Expected outputs and milestones
   - Dependencies on other work
   - Timeline and resource needs
   - How upcoming work impacts team members

### Reporting Strategy by Role

**Samuel (Computational):** Emphasize infrastructure decisions, pipeline code quality, tool selection, command documentation, and hand-offs to Piter & Claire.

**Piter (Statistical):** Emphasize statistical decisions, fairness metric calculations, visualization approaches, validation methods, and integration of Samuel's results.

**Claire (Biological):** Emphasize literature connections, biological interpretation of Piter's results, pathway analysis planning, and writing synthesis.

**Nikhi (Support):** Emphasize data organization, literature compilation progress, team coordination, and decision log maintenance.

---

## 6. Final Paper Requirements

### Overview
A collaborative research paper (30-50 pages, double-spaced) in standard scientific format, presenting your project as if submitting to a peer-reviewed journal. Each member contributes color-coded sections aligned with their role.

### Required Structure & Content

**1. Title and Abstract** (0.5-1 page)
- Concise summary of research question, methods, results, conclusions
- Should be understandable to broad bioinformatics audience
- **Synthesized by all members** (Claire lead, Piter & Samuel provide input)

**2. Introduction** (5-8 pages)
- Biological context and significance
- Background on sequencing technologies and analysis methods
- Statement of research question/hypothesis
- Study organism or system background
- Minimum 5-6 citations
- **Lead: Claire Marshall**

**3. Materials and Methods** (8-10 pages)
- Data source and characteristics (organism, tissue, conditions, sequencing platform)
- Sample preparation and sequencing protocol overview
- **Computational Pipeline Section (Samuel):** Each major step with software names, versions, parameters
- **Statistical Methods Section (Piter):** Normalization, statistical tests, fairness metrics, multiple testing correction
- Quality control thresholds and criteria
- **Review: All members ensure clarity and reproducibility**

**4. Results** (10-15 pages)
- Factual presentation of findings
- Quality control statistics and visualizations (Samuel's section)
- Alignment/assembly statistics and visualizations (Samuel's section)
- Differential expression results with statistical support (Piter's section)
- Fairness audit results and disparate impact findings (Piter's section)
- Primary visualizations (figures and tables)
- Biological interpretation of patterns (Claire's section)
- **Lead Writer: Piter Garcia** (with Samuel providing technical details, Claire providing biological context)

**5. Discussion** (5-10 pages)
- Interpretation of findings in biological context
- Comparison with existing literature
- Implications of fairness findings (disparate impact interpretation)
- Limitations of study and methods
- Biological implications and significance
- Future directions and open questions
- Minimum 5-9 citations
- **Lead: Claire Marshall** (with statistical/technical support from Piter & Samuel)

**6. References**
- Minimum 15 primary sources
- Properly formatted in journal style (APA or journal of choice)
- **Each member contributes citations from their domain**

### Formatting Requirements
- **Document:** MS Word 2016+, LibreOffice, or OpenOffice (NOT Google Docs)
- **Font:** 10 or 12 point Calibri or Times New Roman
- **Spacing:** Double-spaced
- **Margins:** Exactly 1 inch on all sides
- **Page size:** 8.5" × 11"
- **Figures and tables:** No more than 50% of page count; remainder must be prose
- **Direct quotes:** Maximum one page total in entire paper

### Draft Schedule and Color-Coding

**Week 13 Draft 1 - Outline** (2 pts)
- Section headings and subsection organization
- Key findings and figures to be included
- Rough citation organization

**Week 14 Draft 2 - 50% Complete** (2 pts)
- Complete Methods section
- Half of Results section with preliminary figures
- Any sections requiring feedback

**Week 15 Draft 3 - 90% Complete** (2 pts)
- Complete Results with all visualizations
- Draft Discussion section or outline
- Most references integrated

**Final Paper - Complete** (24 pts)
- All sections polished and finalized
- Professional figures with captions
- Complete reference list
- Spell-checked and grammatically correct

### Color-Coding Contributions

**Samuel (Computational):** Blue  
**Piter (Statistical):** Red  
**Claire (Biological):** Green  
**Nikhi (Support):** Comment identification

**Suggested Section Breakdown:**
- **Title & Abstract:** All colors (synthesized)
- **Introduction:** Primarily Green (Claire), reviewed by all
- **Methods (Computational):** Primarily Blue (Samuel), Red & Green review
- **Methods (Statistical):** Primarily Red (Piter), Blue & Green review
- **Results:** Primarily Red (Piter), Blue (Samuel) provides technical details, Green (Claire) provides biological context
- **Discussion:** Primarily Green (Claire), Red & Blue provide supporting evidence
- **References:** Shared (all colors represented)

---

## 7. Grading and Point Allocation

### Assessment Structure (200 points total + 20 bonus)

| Category | Points | Notes |
|----------|--------|-------|
| Weekly Lab Reports (10 of 12) | 30 | 3 pts each (individual) |
| Trapnell Practice Analyses (3) | 30 | 10 pts each (Weeks 2, 3, 4) |
| Primary Stage Analysis | 30 | Weeks 6-8 participation |
| Secondary Stage Analysis | 30 | Weeks 10-11 participation |
| Tertiary Stage Analysis | 30 | Weeks 12-15 participation |
| Paper Drafts (3) | 6 | 2 pts each (Weeks 13-15) |
| Final Paper | 24 | 30-50 pages, polished |
| Peer Evaluations (2) | 20 | Week 10 & 16 (team members evaluate each other) |
| **Total** | **200** | — |
| Bonus Analyses | +20 | Optional, extra credit |

---

## 8. Communication and Collaboration Plan

### Weekly Team Meeting
**Day/Time:** Thursday 12:30-2:00pm (Post-workshop)  
**Duration:** 1-2 hours  
**Attendance:** Mandatory for all members

**Agenda Format:**
- Each member reports accomplishments, blockers, next week's plan (15 min each)
- Coordinate data handoffs between phases/members
- Resolve technical decisions collaboratively
- Update decision log with new decisions

### Decision Log (GitHub-based)
**Location:** `/docs/decision_log.md`  
**Purpose:** Track all major analysis decisions made by each member

**Template:**
```
## Week [N]: [Topic]
- **Decision:** [What did we decide?]
- **Proposed by:** [Member name]
- **Rationale:** [Why? References frameworks?]
- **Owner:** [Who implements this?]
- **Impact:** [Affects which phase/member?]
- **Status:** ✓ Approved / 🔄 In progress / ❌ Blocked (reason)
- **GitHub link:** [Commit or PR if applicable]
```

### Code/Data Handoff Protocol
- **Samuel** completes preprocessing → documents outputs in GitHub README
- **Piter** receives clean data → documents fairness audit parameters + outputs
- **Claire** interprets results → references Methods from Samuel & Piter
- **All updates** tracked in Git history with clear commit messages

### Asynchronous Communication
- **GitHub Issues:** Technical questions, blockers, feature requests
- **Email:** Status updates, announcements, scheduling
- **Shared Document:** Decision log, fairness audit progress, paper outline

### Course Communication
- **Instructor:** Michael Osier (mvoscl@rit.edu, Office 08-1338)
- **Lab Meetings:** Thursday 9:30-11:20am (Zoom)
- **Lectures:** Monday & Wednesday 11:00-11:50am (WAL-4600)
- **myCourses Discussion:** Post progress updates, questions, collaborate with class
- **Lab Reports:** Individual submissions before Thursday workshop

---

## 9. Technical Resources and Tools

### Course-Approved Analysis Tools

**Quality Control:**
- FastQC (quality assessment)
- FastX toolkit (preprocessing)
- CutAdapt (adapter trimming)

**Alignment/Assembly:**
- Bowtie2 (short read alignment)
- TopHat (splice-aware alignment)
- Velvet (de novo assembly)

**Expression Analysis:**
- Cufflinks (transcript assembly)
- RSEM (expression estimation)
- SAMtools (BAM file processing)

**Visualization & Statistical:**
- CummeRbund (Cufflinks visualization)
- R/ggplot2 (custom visualizations)
- Standard statistical packages (R, Python)

**Fairness Auditing:**
- fairlearn (Python library for fairness metrics)
- Disparate impact ratio calculations
- Equalized odds metrics implementation
- Custom scripts for ancestry/group-stratified analysis

### Computing Resources
- RIT computing cluster (if available for HTS analysis)
- Personal workstation with adequate RAM and storage
- Git repository for version control (GitHub)

---

## 10. Project Success Criteria

### Definitions of Success (Shared Across All Members)

**Data Quality:**
- ✓ QC metrics show high-quality, contamination-free reads
- ✓ No systematic biases detected in quality profiles
- ✓ Preprocessing decisions well-documented and justified

**Analytical Rigor:**
- ✓ Appropriate tools selected with justified parameters
- ✓ All analysis decisions logged and explained
- ✓ Statistical methods applied correctly with multiple testing correction
- ✓ Reproducible pipeline documented for all steps

**Fairness Integration:**
- ✓ Disparate impact baseline documented (baseline audit)
- ✓ Each phase includes fairness assessment or mitigation strategy
- ✓ Fairness metrics (DI, equalized odds) tracked in decision log
- ✓ Trade-off decisions documented (accuracy vs. fairness choices)
- ✓ Final paper includes fairness discussion in Methods + Results

**Biological Insight:**
- ✓ Results interpreted in appropriate biological context
- ✓ Findings connected to existing literature
- ✓ Limitations and caveats clearly articulated
- ✓ Future directions identified

**Communication & Documentation:**
- ✓ Weekly reports complete and comprehensive
- ✓ Methods section fully reproducible
- ✓ Visualizations publication-ready
- ✓ Paper meets all formatting and content requirements

**Team Coordination:**
- ✓ Clear role assignments and responsibilities documented (Week 3)
- ✓ Weekly meetings held consistently; attendance logged
- ✓ Decision log maintained with clear ownership
- ✓ Data/code handoffs smooth (no miscommunications about formats)
- ✓ GitHub repo organized with clear structure for each role

**Individual Contribution Quality:**
- ✓ Each member delivers their role's components on time
- ✓ Peer evaluations show balanced and fair contribution
- ✓ No one member dominates or free-rides
- ✓ Collaborative problem-solving evident in meeting notes

---

## 11. Immediate Action Items

### This Week (January 27-31)

1. **Email Professor Osier** (by Friday Jan 31)
   - Subject: "BIOL550 Final Team Composition - 3-Person Team"
   - Include: Team roster (Samuel, Piter, Claire, Nikhi), roles, framework
   - CC: All team members
   - Send to: mvoscl@rit.edu

2. **First Team Meeting** (Thursday Jan 30 or Friday Jan 31)
   - Confirm everyone has read and agrees with this plan
   - Assign GitHub admin (Samuel)
   - Lock in weekly meeting time (Thursday 12:30-2:00pm)
   - Discuss communication norms

3. **Samuel: Create GitHub Repository**
   - Repository name: `biol550-hts-analysis-spring2026`
   - Folder structure:
     - `/README.md` - Team roster and project overview
     - `/data/raw/` - Original sequence files
     - `/data/processed/` - Cleaned and aligned data
     - `/scripts/qc/` - FastQC and trimming scripts
     - `/scripts/alignment/` - Bowtie2/TopHat commands
     - `/scripts/de_analysis/` - Cufflinks/RSEM and statistical scripts
     - `/scripts/fairness/` - Disparate impact calculations
     - `/docs/decision_log.md` - Analysis decisions and rationale
     - `/docs/coordination_notes.md` - Meeting summaries
     - `/paper/` - Draft documents and final manuscript
     - `/lab_reports/` - Weekly submissions organized by member
     - `/results/` - All output subdirectories
   - Add all team members as collaborators
   - Initialize `.gitignore` file

### Weeks 1-5 (Trapnell Practice & Setup)

1. **All Members:** Complete Trapnell protocol tutorial on practice dataset
2. **Samuel:** Install and test FastQC, Bowtie2, TopHat locally
3. **Piter:** Set up R environment with ggplot2 and statistical packages
4. **Claire:** Review biological background on Trapnell dataset and study organism
5. **Nikhi:** Organize course materials and set up shared documentation
6. **All:** Create and agree on lab report template

### Week 3 (Dataset Selection)

1. **Review available datasets** on myCourses
2. **Samuel:** Assess computational feasibility (data size, quality, processing time)
3. **Piter:** Assess statistical complexity (sample size, groups, fairness potential)
4. **Claire:** Assess biological relevance (organism, tissue, research question)
5. **Submit:** 1st and 2nd dataset choices with scientific justification (by Feb 2)

---

## 12. Key Dates and Milestones

| Date | Milestone | Owner |
|------|-----------|-------|
| Jan 31 (Week 2) | Email to Professor Osier with team composition | Piter (as coordinator) |
| Feb 2 (Week 3) | Dataset selection submission | All |
| Feb 2 (Week 3) | First team meeting confirm roles | All |
| Feb 16 (Week 6) | Primary Stage Analysis begins | Samuel |
| Mar 2 (Week 8) | Primary Stage Analysis complete | Samuel |
| Mar 16 (Week 10) | Secondary Stage Analysis begins | Samuel |
| Mar 23 (Week 11) | Fairness Audit Report due | Piter |
| Mar 30 (Week 12) | Tertiary Stage Analysis begins | Piter |
| Apr 6 (Week 13) | **Paper Draft 1 (Outline) Due** | All |
| Apr 13 (Week 14) | **Paper Draft 2 (50%) Due** | All |
| Apr 20 (Week 15) | **Paper Draft 3 (90%) Due** | All |
| Apr 27 (Week 16) | **Final Paper Due (11:59pm)** | All |
| Apr 27 (Week 16) | Peer evaluations due | All |

---

## 13. References and Resources

**Course Materials:**
- BIOL550 Syllabus (Michael Osier, Spring 2026)
- myCourses course materials and discussion boards
- Cornell Bowtie/Cufflinks exercise tutorial

**Key Methods Papers:**
- Trapnell et al. (2012) - TopHat/Cufflinks protocol (Nat. Protocols)
- HTS papers referenced in course readings (Weeks 1-16)

**Tool Documentation:**
- FastQC: https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
- Bowtie2: https://bowtie-bio.sourceforge.net/bowtie2/
- TopHat: http://ccb.jhu.edu/software/tophat/
- Cufflinks: https://cole-trapnell-lab.github.io/cufflinks/
- RSEM: https://github.com/deweylab/RSEM

**Additional Resources:**
- Bioconductor Project: https://www.bioconductor.org/
- Galaxy Project: https://usegalaxy.org/
- SeqAnswers bioinformatics forum

**Fairness & Equity Resources:**
- fairlearn documentation: https://fairlearn.org/
- Disparate impact ratio formulas and calculations
- Equalized odds metrics documentation

---

## Document Version Control

| Version | Date | Changes | Prepared By |
|---------|------|---------|------------|
| 1.0 | January 27, 2026 | Initial comprehensive project plan (CORRECTED) | Piter Garcia |
| | | Corrected team names and roles | |
| | | Aligned with BIOL550 syllabus and requirements | |

---

**This document serves as the master reference for the entire semester. All team members should have access to current versions on GitHub.**

**Last Updated:** January 27, 2026

---

**Questions? Contact Professor Michael Osier at mvoscl@rit.edu or Office 08-1338**
