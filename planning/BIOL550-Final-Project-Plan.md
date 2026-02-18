# BIOL550 High Throughput Sequencing Analysis
## Group Project Plan and Itinerary - 3-PERSON TEAM
### Spring 2026 - FINAL TEAM COMPOSITION

---

## 1. Project Overview

### Course Context
This document outlines the group project strategy for BIOL550: High Throughput Sequencing Analysis (Spring 2026, Instructor: Michael Osier). Our 3-person team follows the **Option A Specialist Distribution model**, with each member bringing distinct expertise to ensure rigorous analysis across computational, statistical, and biological domains.

### Project Goals

**Primary Objective:** Analyze a real eukaryotic HTS dataset through a systematic three-phase workflow (Primary → Secondary → Tertiary Analysis), culminating in a publication-quality research paper and demonstrating mastery of bioinformatic methods, statistical analysis, and scientific communication.

**Key Deliverables:**
- Successful completion of Primary Stage Analysis (Quality Control and data preprocessing)
- Successful completion of Secondary Stage Analysis (Alignment and/or Assembly)
- Successful completion of Tertiary Stage Analysis (Differential Expression Analysis and Visualization)
- 10 individual weekly lab reports (3 pts each = 30 pts)
- 3 drafts of final research paper (Week 13, 14, 15)
- Final publication-quality paper (30-50 pages, minimum 15 primary sources)
- Bonus analyses (SNP calling, transcriptome creation, etc.) if time permits

---

## 2. Team Composition and Roles (FINAL)

### Team Configuration
**3-Person Team with Specialist Role Distribution (Option A)**

### Team Members & Specialty Roles

#### **Member 1: Computational Biology Lead**
- **Name:** [Your Name]
- **Expertise:** Data and AI focus, bioinformatics experience, programming proficiency
- **Primary Responsibilities:**
  - Design and implement analysis pipeline architecture
  - Execute QC, preprocessing, alignment/assembly workflows with reproducibility
  - Manage computational resources and version control (GitHub)
  - Ensure reproducibility and technical documentation
  - Create infrastructure for analysis tracking and decision logging
  
- **Leads Phases:** 
  - **Primary Analysis (Weeks 6–8):** FastQC QC, quality trimming, contamination filtering
  - **Secondary Analysis (Weeks 10–11):** Bowtie2/TopHat alignment, BAM generation, coverage analysis
  
- **Deliverables:** 
  - Clean preprocessing code and scripts
  - Alignment/assembly results (BAM files, assembly contigs)
  - Reproducibility documentation and GitHub repository
  - Weekly lab reports (Weeks 2–16, individual submissions)

---

#### **Member 2: Statistical Analysis & Fairness Audit Lead**
- **Name:** Peter Garcia
- **Expertise:** Grad student in Data Science with Computer Science background; statistical rigor, data science methodology
- **Primary Responsibilities:**
  - Design statistical methods and analysis approaches
  - Execute differential expression analysis with appropriate rigor and validation
  - Implement fairness metrics and disparate impact audits (quantitative equity assessment)
  - Create publication-quality visualizations and statistical summaries
  - Conduct multiple testing correction (FDR, Bonferroni) and validation protocols
  - Collaborate with Member 1 on fairness-aware quality assessment
  
- **Leads Phases:** 
  - **Tertiary Analysis (Weeks 12–15):** Differential expression quantification, statistical testing, visualization
  - **Fairness Auditing (Weeks 11–14):** Disparate impact analysis, equalized odds assessment, fairness reporting
  
- **Deliverables:** 
  - DE analysis results with statistical support (p-values, q-values, fold changes)
  - Fairness audit report (disparate impact metrics by biological group)
  - Publication-quality visualizations (volcano plots, heatmaps, boxplots, pathway visualizations)
  - Weekly lab reports (Weeks 2–16, individual submissions)

---

#### **Member 3: Biological Integration & Literature Lead**
- **Name:** Claire Marshall
- **Expertise:** BioTech and Bioinformatics background; molecular biology expertise; genomics knowledge
- **Primary Responsibilities:**
  - Provide biological context and interpretation throughout all analysis phases
  - Conduct comprehensive literature review (15+ primary sources)
  - Validate computational findings against biological knowledge and existing literature
  - Design pathway analysis and functional interpretation
  - Lead biological writing (Introduction, Discussion sections)
  - Ensure biological accuracy and significance of computational findings
  
- **Involved in:** 
  - **All Phases (Weeks 1–16):** Biological lens throughout project lifecycle
  - **Primary responsibility:** Weeks 1–5 literature prep, Weeks 12–16 interpretation & writing
  
- **Deliverables:** 
  - Comprehensive literature synthesis (background context, prior findings)
  - Biological interpretation of computational results (significance assessment)
  - Introduction and Discussion sections (publication-ready draft)
  - Pathway analysis and functional enrichment interpretation
  - Weekly lab reports (Weeks 2–16, individual submissions)

---

#### **Member 4: Research Support (Undergraduate)**
- **Name:** Nikhi Boggavarapu
- **Expertise:** Undergraduate with relevant biology/bioinformatics coursework
- **Primary Responsibilities:**
  - Support all team members with data organization and file management
  - Assist with comprehensive literature review (finding, summarizing, organizing sources)
  - Contribute to data documentation and file naming conventions
  - Participate in weekly team meetings and documentation efforts
  - Support transcription/organization of lab report components
  
- **Involved in:** All phases (supporting role)
- **Deliverables:** 
  - Organized data directory structure
  - Literature summary sheets and source organization
  - Data documentation and metadata tracking
  - Weekly participation in team meetings

---

### Shared Responsibilities (All Team Members)

- **Project selection and justification** (Week 3) - jointly select dataset and biological research question
- **Weekly lab reports** (individual, 3/4–2 pages, Weeks 2–16) - each member documents THEIR role's accomplishments, methods, problems, and goals
- **Biological interpretation** (connecting computational results to biological significance) - collaborative interpretation
- **Literature integration** (15+ primary sources for final paper) - each member contributes citations from their domain
- **Paper writing and revision** (color-coded contributions in Weeks 13-15)
  - **Member 1 (Blue):** Methods (computational pipeline section), Results (technical details)
  - **Member 2 (Red):** Methods (statistical section), Results (DE findings and fairness audit), supporting visualizations
  - **Member 3 (Green):** Introduction, Discussion, biological interpretation, pathway analysis
- **Peer evaluation** (Week 10 and Week 16) - each member evaluates other team members
- **Regular team communication** (weekly meetings, shared GitHub, decision log)
- **Regular communication** with instructor and through myCourses discussion boards

---

### Coordination Protocol for 3-Person Team

**Weekly Team Meeting (Thursday, 1–2 hours post-workshop):**
- **Attendance:** All four members (including Nikhi for support coordination)
- **Agenda:**
  - Member 1 reports: QC/alignment progress, pipeline blockers, next phase prep
  - Member 2 reports: Statistical methods finalized, fairness metrics progress, visualization status
  - Member 3 reports: Literature compilation, biological interpretation progress, writing status
  - Nikhi reports: Data organization, document coordination, support needs
- **Coordination:** Review data handoffs, discuss technical decisions collaboratively
- **Documentation:** Document decisions in shared decision log

**Decision Log (GitHub shared document):**
- Track major analysis decisions made by each member
- Record rationale (especially fairness-related decisions and biological interpretation choices)
- Allow for transparency and reproducibility audit
- Reference in weekly lab reports and final paper Methods section

**Code/Data Handoff Protocol:**
- Member 1 completes preprocessing → documents outputs in GitHub README (raw QC stats, clean read counts, filtered data summary)
- Member 2 receives clean data → documents alignment parameters, output locations, coverage statistics in GitHub wiki
- Member 3 interprets results → cross-references Methods from Members 1 & 2 for biological context
- All updates tracked in Git history with clear, descriptive commit messages

**GitHub Repository Structure:**
```
biol550-team/
├── README.md (team roster, project overview)
├── data/
│   ├── raw/ (original sequence files)
│   ├── processed/ (cleaned, aligned, expression matrices)
│   └── metadata/ (sample descriptions, group definitions)
├── scripts/
│   ├── qc/ (FastQC, trimming scripts - Member 1)
│   ├── alignment/ (Bowtie2, TopHat commands - Member 1)
│   ├── de_analysis/ (Cufflinks/RSEM, statistical analysis - Member 2)
│   └── fairness/ (disparate impact calculations - Member 2)
├── results/
│   ├── qc_reports/
│   ├── alignment_stats/
│   ├── de_results/
│   ├── fairness_audit/
│   └── visualizations/
├── docs/
│   ├── decision_log.md (analysis choices and rationale)
│   ├── coordination_notes.md (meeting summaries)
│   └── methods_drafts/
├── paper/
│   ├── draft_1_outline.docx (Week 13)
│   ├── draft_2_50percent.docx (Week 14)
│   ├── draft_3_90percent.docx (Week 15)
│   └── final_paper.docx (Week 16)
└── lab_reports/
    ├── member1_reports/ (weekly submissions)
    ├── member2_reports/ (weekly submissions)
    └── member3_reports/ (weekly submissions)
```

---

## 3. Project Structure and Analysis Phases

### Phase Structure: Primary → Secondary → Tertiary Analysis

**Framework:** The course employs a hierarchical analysis structure where each subsequent phase depends on successful completion of the previous phase. In a 3-person team, phases overlap with careful coordination via decision log and weekly meetings.

```
Primary Analysis (Quality Control & Preprocessing)
         ↓
         [Member 1 Lead - Weeks 6-8]
         [Quality metrics, cleaned reads]
         ↓
Secondary Analysis (Alignment/Assembly)
         ↓
         [Member 1 Lead - Weeks 10-11]
         [Aligned reads, fairness audit by Member 2 - Week 11]
         ↓
Tertiary Analysis (Differential Expression & Visualization)
         ↓
         [Member 2 Lead - Weeks 12-15]
         [DE results, fairness metrics]
         ↓
Bonus Analyses (SNP calling, Transcriptome creation, etc.)
         ↓
         [Distributed - Weeks 15-16]
```

---

### Phase 1: Primary Stage Analysis
**Timeline:** Weeks 6-8 (February 16 – March 2)  
**Lead:** Member 1 (Computational Biology Lead)  
**Focus:** Quality Control and preprocessing

**Member 1 Responsibilities (Computational):**
- Run FastQC for quality assessment of raw reads (generate QC reports and plots)
- Execute quality trimming with appropriate tools (CutAdapt for adapters, FastX for quality)
- Filter for adapter sequences and contamination (identify & remove problematic reads)
- Generate comprehensive QC reports and visualizations (before/after filtering)
- Document all quality metrics and filtering thresholds (critical for Methods section)
- Identify and troubleshoot any quality issues (document edge cases and solutions)
- Work with Member 3 to interpret QC patterns biologically (contamination sources, batch effects)

**Member 2 Support (Statistical):**
- Advise on fairness considerations for quality filtering (equitable thresholds across groups if applicable)
- Document filtering criteria for disparate impact assessment in Week 11

**Member 3 Support (Biological):**
- Interpret quality patterns biologically (e.g., contamination sources, tissue-specific issues)
- Validate filtering rationale from biological perspective
- Prepare background on expected quality for study organism/tissue

**Deliverables:**
- Clean, quality-controlled reads ready for alignment/assembly
- Comprehensive QC report with before/after visualizations
- GitHub commit with clean data, scripts, and documentation
- Weekly lab reports documenting process, methods, issues, and next steps
- Participation grade (30 pts) based on completeness and methodology rigor

---

### Phase 2: Secondary Stage Analysis
**Timeline:** Weeks 10-11 (March 16 – March 23)  
**Lead:** Member 1 (Computational Biology Lead) with Member 2 Fairness Audit  
**Focus:** Read Alignment and/or Assembly

**Member 1 Responsibilities (Computational):**
- Implement alignment strategy using Bowtie2 and TopHat (for RNA-Seq) with documented parameters
- Perform de novo assembly if applicable (using Velvet or alternative if necessary)
- Generate alignment statistics and coverage analysis (depth, breadth, quality)
- Create BAM files and validate coordinate systems (check for off-by-one errors, genome build consistency)
- Assess alignment quality and troubleshoot mapping issues
- Compare multiple methods if appropriate (TopHat vs. STAR, Velvet vs. SPAdes)
- Document all commands, parameters, and outputs for reproducibility

**Member 2 Support (Statistical & Fairness):**
- Calculate disparate impact (DI) metrics for alignment quality by biological group (Week 11)
- Assess equalized odds in alignment success rates across sample groups
- Generate fairness audit report with recommendations for DE phase
- Identify any systematic biases in alignment (e.g., group-specific quality issues)

**Member 3 Support (Biological):**
- Validate biological patterns in alignment (expected coverage for tissue/organism)
- Interpret any anomalous alignment results
- Coordinate with Members 1-2 on alignment strategy validity

**Deliverables:**
- Aligned reads (BAM files) or assembled contigs (with quality metrics)
- Alignment/assembly quality metrics (mapping rate, coverage statistics)
- Coverage analysis and visualizations (coverage plots, read depth distributions)
- **Fairness Audit Report (Member 2 lead):** Disparate impact by group, equalized odds assessment, recommendations
- GitHub commits with scripts, results, and documentation
- Weekly lab reports
- Participation grade (30 pts)

---

### Phase 3: Tertiary Stage Analysis
**Timeline:** Weeks 12-15 (March 30 – April 20)  
**Lead:** Member 2 (Statistical Analysis Lead)  
**Focus:** Differential Expression Analysis and Visualization

**Member 2 Responsibilities (Statistical):**
- Quantify gene/transcript expression using Cufflinks, RSEM, or alternative tool
- Implement differential expression analysis with statistical rigor:
  - Apply appropriate normalization methods (DESeq2, TMM, quantile normalization)
  - Conduct multiple testing correction (FDR, Bonferroni) to control Type I error
  - Calculate fold changes, p-values, q-values with proper statistical tests (t-tests, Welch's test)
- Generate expression matrices and statistical summaries
- Create publication-quality visualizations:
  - Volcano plots (log fold-change vs. -log10(p-value))
  - Heatmaps (hierarchical clustering of DE genes)
  - Boxplots (expression distributions by sample group)
  - Pathway visualization (GO enrichment, KEGG pathway maps)
- Perform additional analyses as appropriate:
  - Pathway analysis and functional enrichment (GO, KEGG)
  - Clustering and co-expression networks
  - Correlation studies among DE genes

**Member 1 Support (Computational):**
- Provide clean, well-organized expression data (from alignment outputs)
- Support infrastructure for fairness-stratified analysis (separate DE by group for equity assessment)
- Troubleshoot any computational issues in DE pipeline

**Member 3 Support (Biological):**
- Interpret DE results in biological context (which genes are biologically significant?)
- Connect findings to existing literature (validation, novel findings)
- Prepare biological interpretation for Results/Discussion sections

**Deliverables:**
- Differential expression results with full statistical support (p-values, q-values, fold changes)
- Expression matrices (raw counts, normalized expression)
- Expression visualizations and summary tables (publication-ready)
- **Fairness audit results:** Disparate impact in DE findings, equalized odds by biological group
- Analysis of biological significance (pathway results, co-expression findings)
- GitHub commits with analysis scripts and results
- Weekly lab reports
- Participation grade (30 pts)

---

### Phase 4: Bonus Analyses (Optional)
**Timeline:** Weeks 15-16 (April 20 – April 27)  
**Focus:** Extended analyses for additional credit (up to 20 bonus points)

**Possible bonus analyses:**
- SNP calling and variant analysis
- Novel transcript discovery and characterization
- Isoform quantification and isoform-level DE analysis
- Co-expression network analysis (WGCNA or similar)
- Prediction of functionally important variants
- Integration with external databases (Ensembl, UniProt, pathway databases)
- Custom visualization tools (interactive plots, data dashboards)
- Machine learning approaches (classification/clustering of samples or genes)

**Distribution by expertise:**
- **Member 1:** SNP calling, isoform discovery, integration with databases
- **Member 2:** Network analysis, machine learning classification, fairness in bonus analyses
- **Member 3:** Biological validation of novel findings, pathway integration

---

## 4. Timeline and Itinerary

### Week-by-Week Breakdown

| Week | Dates | Activities | Member 1 Tasks | Member 2 Tasks | Member 3 Tasks | Nikhi Tasks | Deliverables | Points |
|------|-------|-----------|-----------------|------------|------|--------|--------------|--------|
| 1 | Jan 12 | Course intro, HTS basics, Unix/Linux review | Set up working environment, review Unix tools | Study data science approaches in bioinformatics | Prepare biology context materials | Support environment setup | Design analysis flowchart | - |
| 2 | Jan 19 | HTS technology review, Trapnell protocol | Study analysis workflows, begin Trapnell practice | Study Trapnell's statistical approach | Review biological protocols in Trapnell | Organize resources | Trapnell flowchart | 10 pts |
| 3 | Jan 26 | Assembly readings, Trapnell QC practice, **Project selection** | Practice QC tools on Trapnell data | Practice statistical analysis on Trapnell | Research project datasets, biological context | Compile project options | **Team composition confirmed**, Project 1st & 2nd picks | 10 pts |
| 4 | Feb 2 | RNA-Seq readings, Trapnell alignment practice | Execute alignment on Trapnell data | Discuss DE methodology | Interpret results biologically | Organize literature | Lab report 1 | 3 pts |
| 5 | Feb 9 | Composite structures, differential expression | Conduct QC preprocessing on Trapnell | Conduct basic DE analysis on Trapnell | Interpret results biologically | Compile key papers | Lab report 2 | 3 pts |
| 6 | Feb 16 | Barcoding readings, **Begin Primary Stage Analysis** | QC on actual project data (FastQC, trimming) | Support QC infrastructure decisions | Support data interpretation | Organize raw data | Lab report 3, QC analysis | 33 pts |
| 7 | Feb 23 | eDNA and scRNA-Seq readings | Continue Primary Stage analysis | Discuss batch effect detection | Discuss biological quality patterns | Update data org | Lab report 4 | 3 pts |
| 8 | Mar 2 | Continue Primary Stage analysis | Finalize QC, begin quality filtering | Advise on fairness in filtering | Validate biological filtering rationale | Archive cleaned data | Lab report 5 | 3 pts |
| 9 | Mar 9 | Spring Break | *Optional*: Complete Primary Stage analysis | *Optional*: Literature prep | *Optional*: Literature prep | *Optional*: Data sync | Optional report | 0 pts |
| 10 | Mar 16 | Variant callers readings, **Begin Secondary Stage Analysis** | Execute alignment/assembly pipeline (Bowtie2/TopHat) | Calculate DI metrics for alignment (prep) | Interpret alignment quality patterns | Organize alignment outputs | Lab report 6, Secondary analysis | 33 pts |
| 11 | Mar 23 | Missing genes readings, continue Secondary Stage | Finalize alignment statistics, coverage analysis | **Calculate disparate impact metrics**, generate fairness audit | Validate alignment patterns biologically | Organize fairness audit docs | Lab report 7, **Fairness Audit Report** | 3 pts |
| 12 | Mar 30 | **Begin Tertiary Stage Analysis** | Support DE infrastructure, provide clean expression data | Begin differential expression analysis | Support biological context for DE | Organize DE inputs | Lab report 8 | 3 pts |
| 13 | Apr 6 | Long-read technologies, Tertiary Stage analysis | Finalize DE infrastructure | Complete DE analysis, visualizations | Begin biological interpretation | Organize draft 1 materials | Lab report 9, **Paper Draft 1 (Outline)** | 35 pts |
| 14 | Apr 13 | Microbiome/epigenetics, continue Tertiary Stage | Document DE methods | Refine visualizations, statistical summaries | Write Introduction & Discussion draft | Organize draft 2 materials | Lab report 10, **Paper Draft 2 (50% prose/figures)** | 35 pts |
| 15 | Apr 20 | Bonus analyses discussion, analysis refinement | Implement bonus (SNP/isoform) or support Member 2 | Lead bonus statistical analyses | Lead bonus biological interpretation | Organize bonus analysis outputs | **Paper Draft 3 (nearly complete)**, Bonus results | 20 pts |
| 16 | Apr 27 | Project completion and presentation | Finalize Methods documentation | Finalize Results and visualizations | Finalize Discussion, biological synthesis | Final documentation | **Final Paper (due 11:59pm)**, Peer evaluations | 44 pts |

---

## 5. Weekly Lab Report Structure

### Purpose
Individual lab reports (10 of 16 possible weeks) document progress, methods, troubleshooting, and planning within each team member's specialized role. These reports are essential for tracking individual contributions, demonstrating methodology development, and ensuring accountability.

### Required Elements (3/4–2 pages, single-spaced, individual submissions)

1. **Accomplishments Since Previous Report**
   - Specific analyses completed by this team member
   - Data processed or generated in their domain
   - Tools executed or scripts developed
   - Results achieved and milestones reached
   - **3-person note:** How you coordinated with other team members

2. **Methods Used (by this team member)**
   - Tools and software employed (with versions and parameters)
   - Specific commands executed (with full parameter documentation)
   - Analysis approaches and justification for methodology choices
   - Data sources and preprocessing steps (specific to your role)
   - **3-person note:** How your methods feed into other members' downstream work

3. **Problems Encountered & Solutions**
   - Technical issues encountered and resolution strategies implemented
   - Unexpected results and interpretation/troubleshooting
   - Parameter adjustments made and rationale
   - Questions or areas needing discussion with team
   - **3-person note:** Communication with team members about blockers or conflicts

4. **Goals for Coming Week**
   - Next analysis steps in your role
   - Expected outputs and milestones for your work
   - Dependencies on other team members' work
   - Timeline and resource needs
   - **3-person note:** How upcoming work impacts downstream analyses

### Role-Specific Guidelines

**Member 1 (Computational Biology) Reports Should Emphasize:**
- Infrastructure decisions (tool choices, parameter selection, pipeline design)
- Code quality and reproducibility (version control commits, script organization)
- Data management (file organization, QC metrics, hand-off documentation)
- Troubleshooting of computational issues
- Interface with Member 2 (clean data delivery, format documentation)

**Member 2 (Statistical Analysis) Reports Should Emphasize:**
- Statistical methodology decisions (test selection, normalization approach, multiple testing correction)
- Fairness metrics implementation (disparate impact calculations, equity assessments)
- Validation and sensitivity analyses conducted
- Visualization design and publication-ready quality
- Integration of Member 1's outputs and support for Member 3's interpretation

**Member 3 (Biological Integration) Reports Should Emphasize:**
- Literature compilation and synthesis progress
- Biological interpretation of computational findings (significance assessment)
- Validation of results against biological knowledge
- Pathway analysis and functional interpretation
- Writing progress and integration with computational results
- Interface with Members 1 & 2 on biological accuracy

---

## 6. Final Paper Requirements

### Overview
A collaborative research paper (30-50 pages, double-spaced) in standard scientific format, presenting your project as if submitting to a peer-reviewed journal. Each team member contributes color-coded sections aligned with their role: **Member 1 (Blue), Member 2 (Red), Member 3 (Green)**.

### Required Structure & Content

**Standard Scientific Sections:**

1. **Title and Abstract** (1 page)
   - Concise summary of research question, methods, results, conclusions
   - Should be understandable to broad bioinformatics audience
   - **Color-coding:** Synthesized by all members (recommend Member 3 lead, Members 1 & 2 provide input)

2. **Introduction** (5-8 pages)
   - Biological context and significance
   - Background on sequencing technologies and analysis methods
   - Statement of research question/hypothesis
   - Study organism or system background
   - Expected findings and biological implications
   - **Minimum 5-6 citations**
   - **Lead:** Member 3 (Green); reviewed by Members 1 & 2

3. **Materials and Methods** (8-10 pages)
   - **Data source and characteristics:** Study organism, tissue, experimental conditions, sequencing platform
   - **Sample preparation and sequencing protocol:** Overview of wet lab methods
   - **Computational analysis pipeline:** Each major step with software names, versions, parameters
     - Quality Control (Member 1 - Blue)
     - Alignment/Assembly (Member 1 - Blue)
     - Expression Quantification (Member 2 - Red)
     - Statistical Analysis (Member 2 - Red)
     - Fairness Assessment (Member 2 - Red)
   - **Quality control thresholds and criteria**
   - **Statistical methods for all analyses:** Test selection, normalization, multiple testing correction
   - **Fairness metrics and disparate impact assessment** (if applicable to your dataset)
   - **Responsibility:** Member 1 writes computational Methods; Member 2 writes statistical Methods; Member 3 reviews for clarity
   - **Color-coding:** [Blue - computational], [Red - statistical], [Green - review]

4. **Results** (10-15 pages)
   - **Quality Control Results:** QC statistics, filtering summary, before/after comparisons
   - **Alignment/Assembly Results:** Mapping rates, coverage analysis, assembly statistics
   - **Expression Quantification Results:** Expression matrices, summary statistics
   - **Differential Expression Findings:** DE genes/transcripts with statistical support (p-values, q-values, fold changes)
   - **Biological Interpretation:** Pathway analysis, GO enrichment, functional significance
   - **Fairness Assessment Results:** Disparate impact metrics, group-stratified outcomes
   - **Primary visualizations:** Figures and tables with complete captions and legends
   - **Lead:** Member 2 writes technical Results (DE findings); Member 1 provides technical details; Member 3 provides biological context
   - **Color-coding:** [Blue - technical details], [Red - statistical findings/visualizations], [Green - biological interpretation]

5. **Discussion** (5-10 pages)
   - Interpretation of findings in biological context
   - Comparison with existing literature and validation of findings
   - Biological implications and significance
   - Limitations of study and methods (honestly discuss constraints)
   - Fairness and equity considerations (if applicable)
   - Future directions and open questions
   - **Minimum 5-9 citations**
   - **Lead:** Member 3 (Green); Members 1 & 2 provide supporting evidence
   - **Color-coding:** [Green - biological synthesis], [Red/Blue - technical limitations and future work]

6. **References**
   - Minimum 15 primary sources
   - Properly formatted in journal style (APA or selected journal format)
   - **Responsibility:** Each member contributes citations from their domain; Member 3 coordinates final formatting
   - **Color-coding:** All colors (shared responsibility)

### Formatting Requirements

- **Document Format:** MS Word 2016+, LibreOffice, or OpenOffice (NOT Google Docs—export to .DOCX)
- **Font:** 10 or 12 point Calibri or Times New Roman
- **Spacing:** Double-spaced throughout
- **Margins:** Exactly 1 inch on all sides
- **Page Size:** 8.5" × 11"
- **Figures and Tables:** No more than 50% of page count; remainder must be prose
- **Direct Quotes:** Maximum one page total in entire paper
- **Color-Coding:** Use Track Changes or inline comments with [COLOR INITIALS - MEMBER NAME - ROLE]

### Draft Schedule and Color-Coding

**Week 13 Draft 1 - Outline (2 pts)**
- Section headings and subsection organization
- Key findings and figures to be included (thumbnails acceptable)
- Rough citation organization
- **Color-coded by section:** Indicate who is leading each section

**Week 14 Draft 2 - 50% Complete (2 pts)**
- Complete Methods section (all computational and statistical methods written)
- Half of Results section with preliminary figures/tables
- Introduction draft or outline
- Any sections requiring feedback

**Week 15 Draft 3 - 90% Complete (2 pts)**
- Complete Results with all visualizations finalized
- Discussion section draft or detailed outline
- Most references integrated and formatted
- Ready for final polish

**Final Paper - Complete (24 pts)**
- All sections polished and finalized
- Professional figures with complete captions
- Complete reference list (15+ sources)
- Spell-checked and grammatically correct
- Formatting consistent throughout

### Color-Coding Contributions

**3-Person Team:**
- **Member 1 (Computational Biology) - [Blue]**
- **Member 2 (Statistical Analysis) - [Red]**
- **Member 3 (Biological Integration) - [Green]**

**Suggested Color-Coded Breakdown:**
- **Introduction:** Primarily Green (Member 3), reviewed by Blue & Red
- **Methods (Computational Pipeline):** Primarily Blue (Member 1), Red reviews statistical methods section
- **Methods (Statistical):** Primarily Red (Member 2), Blue provides technical details
- **Results (Technical/DE):** Primarily Red (Member 2), Blue provides technical details, Green provides biological context
- **Results (Biological Interpretation):** Primarily Green (Member 3), Red/Blue provide supporting data
- **Discussion:** Primarily Green (Member 3), Red/Blue provide technical/statistical support
- **References:** Shared (all colors represented by citation contributions)

**Each colored section must include comment with:** `[COLOR - MEMBER NAME - ROLE - DATE]`

---

## 7. Grading and Point Allocation

### Assessment Structure (200 points total + 20 bonus)

| Category | Points | Notes |
|----------|--------|-------|
| Weekly Lab Reports (10 of 16) | 30 | 3 pts each (individual submissions) |
| Trapnell Practice Analyses (3) | 30 | 10 pts each (Weeks 2, 3, 4) |
| Primary Stage Analysis | 30 | Weeks 6-8 participation & completion |
| Secondary Stage Analysis | 30 | Weeks 10-11 participation & completion |
| Tertiary Stage Analysis | 30 | Weeks 12-15 participation & completion |
| Paper Drafts (3) | 6 | 2 pts each (Weeks 13-15) |
| Final Paper | 24 | 30-50 pages, polished, publication-ready |
| Peer Evaluations (2) | 20 | Week 10 & 16 (team members evaluate each other) |
| **Total** | **200** | — |
| **Bonus Analyses** | **+20** | Optional extra credit |

### Individual Grade Strategy (3-Person Team)

**Member 1 (Computational Biology Lead):**
- **Strong assessment areas:** Primary & Secondary Analysis phases (60 pts combined), Methods section quality, GitHub repository organization, code reproducibility
- **Expected high performance:** Weekly reports on infrastructure decisions, script quality, technical documentation
- **Grading highlights:** Pipeline reproducibility, troubleshooting documentation, code quality in GitHub

**Member 2 (Statistical Analysis Lead):**
- **Strong assessment areas:** Tertiary Analysis phase (30 pts), fairness audit implementation, visualization quality, statistical rigor
- **Expected high performance:** Weekly reports on statistical decisions, fairness metrics, visualization development
- **Grading highlights:** Statistical methodology rigor, fairness assessment quality, Results section technical accuracy

**Member 3 (Biological Integration Lead):**
- **Strong assessment areas:** Literature synthesis, Introduction/Discussion sections, biological interpretation, paper coherence
- **Expected high performance:** Weekly reports on literature progress, biological interpretation, writing status
- **Grading highlights:** Biological insight quality, literature integration, paper narrative coherence

**Participation Grades (90 pts combined across all analysis phases):**
- Consistent attendance at weekly Thursday meetings
- Active problem-solving and troubleshooting engagement
- Regular communication via GitHub, email, myCourses
- Quality of analysis decisions documented in decision log and lab reports

**Peer Evaluations (critical in 3-person teams):**
- **Week 10 & 16 evaluations:** Each member evaluates other two members' contributions
- **Evaluation criteria:** Contribution quality, timeliness, collaboration, thoroughness in their role
- **Instructor use:** Verifies fair contribution distribution; informs final grade adjustments if needed
- **Conflict resolution:** If peer evaluations reveal unequal contribution, instructor may adjust individual grades

---

## 8. Communication and Collaboration Plan

### External Team Communication with Instructor

- **Instructor:** Michael Osier (mvoscl@rit.edu, Office 08-1338)
- **Lab Meeting:** Thursday 9:30-11:20am (Zoom link in myCourses)
- **Lectures:** Monday/Wednesday 11:00-11:50am (WAL-4600)
- **myCourses Discussion:** Post progress updates, questions, and broader class collaboration
- **Lab Reports:** Individual submissions before Thursday workshop each week
- **Monthly Check-ins:** Instructor office hours or brief myCourses messages at Weeks 8, 12 for mid-semester feedback

### Internal Team Communication (3-Person + 1 Support)

**Weekly Team Meeting (Thursday, 1–2 hours post-workshop):**
- **Time:** Thursday 12:30–2:00pm (immediately after lab)
- **Attendance:** All four members (required)
- **Agenda (15-min per member):**
  - **Member 1:** QC/alignment progress, pipeline blockers, next phase prep, GitHub updates
  - **Member 2:** Statistical methods finalized, fairness metrics progress, visualization status, data needs from Member 1
  - **Member 3:** Literature compilation, biological interpretation progress, writing status, data needs for interpretation
  - **Nikhi:** Data organization updates, coordination support, document archiving status
- **Coordination Items:**
  - Review data/analysis handoffs between phases
  - Discuss technical decisions collaboratively
  - Identify blockers and escalation paths
  - Document attendance and action items
- **Documentation:** Brief meeting notes (5-10 min summary) committed to GitHub in `/docs/coordination_notes.md`

**Asynchronous Communication Channels:**
- **GitHub Issues:** Technical questions, blockers, feature requests, reproducibility questions
- **GitHub Discussions:** Analysis strategy discussions, literature sharing, methodological questions
- **Email:** Status updates, scheduling conflicts, urgent announcements
- **Shared Document:** Decision log (`/docs/decision_log.md`), fairness audit progress

**Decision Log Template (in `/docs/decision_log.md`):**
```
## Week [N]: [Topic]
- **Decision:** [What did we decide?]
- **Proposed by:** [Member name and role]
- **Rationale:** [Why? References frameworks? Biological/statistical justification? Fairness implications?]
- **Owner:** [Who implements this? Timeline?]
- **Impact:** [Affects which phase/member? Data format implications?]
- **Status:** ✓ Approved / 🔄 In progress / ❌ Blocked (reason)
- **GitHub link:** [Relevant commit, PR, or issue]
- **Meeting discussed:** [Week/date]
```

**Monthly Syncs (3-Person Team with Instructor - Optional but Recommended):**
- **Weeks 4, 8, 12, 14:** 30-min touchpoint (team + instructor optional)
- **Purpose:** Validate progress, align on fairness strategy, resolve inter-member conflicts early
- **Outcome:** 1-2 paragraph summary committed to `/docs/coordination_notes.md`

---

## 9. Technical Resources and Tools

### Course-Approved Analysis Tools

**Quality Control:**
- FastQC (quality assessment)
- FastX toolkit (preprocessing)
- CutAdapt (adapter trimming)

**Alignment/Assembly:**
- Bowtie2 (short read alignment, primary choice)
- TopHat (splice-aware alignment for RNA-Seq)
- Velvet (de novo assembly, if applicable)

**Expression Analysis:**
- Cufflinks (transcript assembly and quantification)
- RSEM (isoform-level expression estimation, alternative)
- SAMtools (BAM file processing and statistics)

**Statistical & Visualization:**
- CummeRbund (Cufflinks output visualization)
- R/ggplot2 (custom publication-quality visualizations)
- Pathway analysis tools: GO enrichment, KEGG pathway mapping
- Standard statistical packages (R, Python)

**Fairness Auditing (Member 2):**
- fairlearn (Python library: disparate impact, equalized odds)
- Spreadsheets for disparate impact calculation (proportion of positives in group / overall)
- Custom scripts for ancestry/group-stratified analysis
- Statistical tests for fairness (chi-square, two-way ANOVA by group)

### Computing Resources
- RIT computing cluster (if available for HTS analysis)
- Personal workstation with adequate RAM (16GB+ recommended) and storage (2TB for raw + processed data)
- Git repository for version control (GitHub, GitLab, or RIT Bitbucket)
- Backup strategy for critical data and scripts

### Documentation Resources
- BIOL550 Syllabus and course materials (myCourses)
- Tool documentation and manuals:
  - [FastQC Documentation](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
  - [Bowtie2 Manual](https://bowtie-bio.sourceforge.net/bowtie2/)
  - [Cufflinks Documentation](https://cole-trapnell-lab.github.io/cufflinks/)
  - [RSEM Documentation](https://github.com/deweylab/RSEM)
- Cornell Bowtie/Cufflinks exercise tutorial (reference for methodology)
- Weekly lecture materials and readings in myCourses

---

## 10. Project Success Criteria

### Definitions of Success (Shared Across All Team Members)

**Data Quality:**
- ✓ QC metrics show high-quality, contamination-free reads with clear documentation
- ✓ No systematic biases detected in quality profiles
- ✓ Preprocessing decisions well-documented and justified in Methods
- ✓ Quality filtering criteria clearly articulated and reproducible

**Analytical Rigor:**
- ✓ Appropriate tools selected with justified parameters documented
- ✓ All major analysis decisions logged in GitHub decision log with rationale
- ✓ Statistical methods applied correctly with multiple testing correction (FDR/Bonferroni)
- ✓ Fairness metrics calculated and integrated into analysis (Member 2 responsibility)
- ✓ Reproducible pipeline documented for all steps (scripts in GitHub with README)

**Biological Insight:**
- ✓ Results interpreted in appropriate biological context (Member 3 lead)
- ✓ Findings connected to existing literature with proper citations (15+ sources)
- ✓ Limitations and caveats clearly articulated (honest assessment of data/method constraints)
- ✓ Biological significance assessed (which DE genes are likely functionally important?)
- ✓ Future directions identified (where does this research lead?)

**Communication & Documentation:**
- ✓ Weekly reports complete, individual, and comprehensive (all 10 submitted)
- ✓ Methods section fully reproducible (sufficient detail for other researchers to repeat)
- ✓ Visualizations publication-ready (high resolution, clear legends, professional formatting)
- ✓ Paper meets all formatting and content requirements (30-50 pages, 15+ sources)
- ✓ Color-coded contributions clear (each member's section identifiable)

**Equity & Transparency:**
- ✓ Methods documented clearly for broad accessibility (not jargon-heavy)
- ✓ Potential biases acknowledged in Methods and Discussion
- ✓ Data processing decisions transparent (documented in decision log)
- ✓ Limitations discussed honestly (bias risks, fairness trade-offs)

### Additional Success Criteria for 3-Person Teams

**Team Coordination:**
- ✓ Clear role assignments and responsibilities documented (Week 2-3)
- ✓ Weekly meetings held consistently; attendance tracked
- ✓ Decision log maintained with clear ownership and rationale
- ✓ Data/code handoffs smooth (documented formats, no miscommunications)
- ✓ GitHub repo organized with clear structure for each role

**Fairness Integration:**
- ✓ Disparate impact baseline documented (Week 11 fairness audit)
- ✓ Each phase includes fairness assessment or mitigation strategy
- ✓ Fairness metrics (disparate impact, equalized odds) tracked in decision log
- ✓ Trade-off decisions documented (accuracy vs. fairness choices)
- ✓ Final paper includes fairness discussion in Methods + Results

**Individual Contribution Quality (Assessed via Peer Evaluation + Instructor Observation):**
- ✓ Each member delivers their role's components on time
- ✓ Peer evaluations show balanced and fair contribution across team
- ✓ No single member dominates or free-rides
- ✓ Collaborative problem-solving evident in meeting notes and GitHub issues
- ✓ Weekly lab reports demonstrate individual effort and expertise

---

## 11. Contingency Planning

### Potential Challenges and Mitigation Strategies

| Challenge | Mitigation Strategy |
|-----------|-------------------|
| **Member unavailability or withdrawal** | Communicate with instructor immediately; redistribute roles to remaining members using peer evaluation to adjust grades fairly |
| **Data quality issues** | Document issues thoroughly; discuss with instructor for remediation options or data replacement before Week 6 |
| **Tool failures/software bugs** | Maintain backup analysis approaches; document errors for troubleshooting; contact tool developers or RIT IT |
| **Unexpected analysis results** | Investigate thoroughly; consider alternative analytical approaches; consult literature; discuss with instructor |
| **Time management issues** | Weekly reports help track progress early; adjust bonus analyses scope if needed; prioritize core deliverables |
| **Computing resource limitations** | Plan efficient analyses; use RIT cluster if available; optimize code for performance; compress intermediate files |
| **Coordination conflicts** | Weekly meetings + decision log prevent miscommunication; monthly syncs with instructor for early escalation; peer evaluations flag issues |
| **Unequal work distribution** | Monthly syncs with instructor; peer evaluations quantify contributions; adjust final grades if verified by multiple sources |
| **Fairness audit reveals concerning disparities** | Document findings; discuss with instructor on interpretation and reporting; transparency in Discussion section |

---

## 12. Next Steps and Immediate Actions

### Immediate (Before Week 3):

1. **Confirm Team Composition with Instructor (Email)**
   - CC all team members: Member 1 (you), Member 2 (Peter Garcia), Member 3 (Claire Marshall), Member 4 (Nikhi Boggavarapu)
   - Confirm role assignments align with Option A Specialist Distribution
   - Request confirmation that 3-person structure is acceptable
   - Submit to: mvoscl@rit.edu by end of Week 2

2. **Initialize GitHub Repository (Member 1 Lead)**
   - Create repository with structure outlined in this document
   - Add all team members as collaborators
   - Create initial README with team roster and project overview
   - Initialize `/docs/decision_log.md` and `/docs/coordination_notes.md`
   - Share repository link with team and instructor

3. **First Team Meeting (Thursday, January 30)**
   - Review this document with all team members
   - Assign GitHub admin (recommend Member 1)
   - Establish communication norms and expectations
   - Create shared calendar with weekly meeting time locked in
   - Assign coordination roles (who archives decisions? Who updates decision log?)

### Before Week 3 (Project Selection):

1. **Review Available Datasets** (All Members)
   - Consult myCourses for available HTS projects
   - Research each option: organism, data type, biological context
   - Member 3 lead: Identify research questions of interest and biological significance

2. **Prepare Selection Justification** (All Members Contribute)
   - Member 3 lead: Write 1-2 paragraphs explaining scientific rationale
   - Member 1: Assess data quality and computational feasibility
   - Member 2: Assess statistical complexity and fairness audit potential
   - Discuss fairness considerations of proposed dataset (group representation, potential biases)

3. **Submit Project Selections** (Week 3 Deadline)
   - Document 1st and 2nd project choices
   - Include scientific rationale, team role fit, fairness considerations
   - Submit via myCourses by Week 3 deadline

### Weeks 1-3 (Trapnell Protocol Practice - All Members):

1. **Trapnell Protocol Practice**
   - Work through TopHat/Cufflinks tutorial on provided practice dataset
   - Document all commands and outputs
   - **Member 1:** Focus on QC and alignment steps
   - **Member 2:** Focus on statistical analysis and visualization
   - **Member 3:** Focus on biological interpretation
   - Create analysis flowchart summarizing workflow

2. **Tool Familiarization** (By Week 2)
   - Install and test: FastQC, Bowtie2, Cufflinks locally (or on RIT cluster)
   - Review tool documentation and create quick reference guides
   - **Member 1:** Command-line syntax and parameter options
   - **Member 2:** Statistical options and visualization features
   - **Member 3:** Interpretation guidelines and biological context

3. **Establish Working Environment** (By Week 3)
   - Set up project directory structure locally and on cluster (if applicable)
   - Initialize version control repository (GitHub) with all members added
   - Create lab report template for consistency across all 10 reports
   - **3-person specific:** Test GitHub collaboration (branches, commits, pull requests)
   - Document computing environment setup (software versions, library dependencies)

---

## References and Resources

**Course Materials:**
- BIOL550 Syllabus (Michael Osier, Spring 2026)
- myCourses course materials and discussion boards
- Cornell Bowtie/Cufflinks tutorial (primary reference for Trapnell protocol)

**Key Methods Papers & Textbooks:**
- Trapnell et al. (2012) - TopHat/Cufflinks protocol (Nature Protocols)
- Referenced HTS papers in course readings (Weeks 1-16 lecture materials)

**Tool Documentation:**
- FastQC: https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
- Bowtie2: https://bowtie-bio.sourceforge.net/bowtie2/
- Cufflinks: https://cole-trapnell-lab.github.io/cufflinks/
- RSEM: https://github.com/deweylab/RSEM
- SAMtools: http://www.htslib.org/

**Additional Bioinformatics Resources:**
- Bioconductor Project: https://www.bioconductor.org/
- Galaxy Project: https://usegalaxy.org/
- SeqAnswers bioinformatics forum: https://seqanswers.com/

**Fairness & Equity in Bioinformatics:**
- fairlearn documentation: https://fairlearn.org/
- Disparate Impact Ratio calculation: https://en.wikipedia.org/wiki/Four_fifths_rule
- IDAI700 EQUITAS framework (epistemic justice, procedural justice)
- ISTE780 fairness metrics (fairness constraints, equalized odds)

---

## Document Version Control

| Version | Date | Changes | Prepared By |
|---------|------|---------|------------|
| 1.0 | January 26, 2026 | Initial project plan for 2-person team | Original Template |
| 2.0 | January 26, 2026 | Updated to support flexible 2–3 person team configurations | Template Update |
| **3.0** | **January 26, 2026** | **FINAL TEAM COMPOSITION** with specific team member assignments | [Your Team] |
| | | **Team confirmed:** Member 1 (You - Computational), Member 2 (Peter Garcia - Statistical), Member 3 (Claire Marshall - Biological), Member 4 (Nikhi Boggavarapu - Undergraduate Support) | |
| | | Role assignments finalized per Option A Specialist Distribution | |
| | | All three-person coordination protocols specified | |

---

**This document serves as your primary project roadmap for the entire semester. Update it as your project progresses, phases complete, and new information emerges. Ensure all team members have access to current versions and regularly reference this document during weekly meetings.**

**Last Updated:** January 26, 2026

---

## QUICK REFERENCE: Your Team at a Glance

| Role | Member | Expertise | Primary Phases | Key Deliverables |
|------|--------|-----------|----------------|-----------------|
| **Computational Biology** | You | Data Science, Bioinformatics, Programming | Weeks 6-11 (Primary + Secondary Analysis) | Clean pipeline, aligned reads, GitHub repo, Methods (technical) |
| **Statistical Analysis** | Peter Garcia | Data Science, CS background, Stats rigor | Weeks 11-15 (Secondary fairness audit + Tertiary Analysis) | Fairness audit report, DE results, visualizations, Methods (statistical) |
| **Biological Integration** | Claire Marshall | BioTech, Bioinformatics, Genomics | Weeks 1-16 (All phases, biological lens) | Literature synthesis, biological interpretation, Introduction + Discussion, paper coherence |
| **Research Support** | Nikhi Boggavarapu | Undergraduate coursework | Weeks 1-16 (Supporting role) | Data organization, literature summaries, coordination support |

**Weekly Meeting:** Thursday 12:30–2:00pm (post-workshop)  
**GitHub:** [Create repository URL]  
**Instructor:** Michael Osier (mvoscl@rit.edu)  
**Lab:** Thursday 9:30-11:20am  
**Lectures:** Mon/Wed 11:00-11:50am (WAL-4600)
