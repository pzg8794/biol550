# BIOL550 High Throughput Sequencing Analysis
## Group Project Plan and Itinerary - FLEXIBLE 2–3 PERSON TEAM
### Spring 2026

---

## 1. Project Overview

### Course Context
This document outlines the group project strategy for BIOL550: High Throughput Sequencing Analysis (Spring 2026, Instructor: Michael Osier). The course focuses on analyzing real eukaryotic next-generation sequencing (NGS) data through a semester-long collaborative research project with structured analysis phases and comprehensive documentation. **This version supports both 2-person and 3-person team configurations.**

### Project Goals

**Primary Objective:** Analyze a real HTS dataset through a systematic three-phase workflow (Primary → Secondary → Tertiary Analysis), culminating in a publication-quality research paper and demonstrating mastery of bioinformatic methods, statistical analysis, and scientific communication.

**Key Deliverables:**
- Successful completion of Primary Stage Analysis (Quality Control and data preprocessing)
- Successful completion of Secondary Stage Analysis (Alignment and/or Assembly)
- Successful completion of Tertiary Stage Analysis (Differential Expression Analysis and Visualization)
- 10 individual weekly lab reports (3 pts each = 30 pts)
- 3 drafts of final research paper (Week 13, 14, 15)
- Final publication-quality paper (30-50 pages, minimum 15 primary sources)
- Bonus analyses (SNP calling, transcriptome creation, etc.) if time permits

---

## 2. Team Composition and Roles

### Team Configuration Options

**This project is designed to accommodate 2–3 team members.** Confirm with instructor by Week 2 whether your team will be 2-person or 3-person. Responsibilities scale accordingly.

---

## 2A. Two-Person Team Configuration

### Team Members
- **Member 1 (You):** Computer and Data Scientist
  - Background: Data and AI focus, bioinformatics experience, equity-focused research approach
  - Specialized skills: Programming, statistical analysis, machine learning approaches, data integration

- **Member 2:** *[To be recruited/identified]*
  - Desired expertise: Computational biology, genomics, or molecular biology background
  - Complementary skills: Experimental validation expertise, biological interpretation, literature knowledge

### Role Definition for Two-Person Team

#### Your Primary Responsibilities (Computer and Data Scientist)

**Data Management & Infrastructure:**
- Design and maintain the analysis pipeline architecture
- Develop and test bioinformatic workflows (quality control, alignment, assembly, differential expression)
- Implement reproducible computational methods using appropriate tools (FastQC, Bowtie2, Cufflinks, RSEM, etc.)
- Manage version control and documentation of all analysis steps
- Prepare and validate input data from raw sequencing reads

**Statistical & Analytical Leadership:**
- Lead statistical analysis design and execution
- Conduct differential expression analysis with appropriate normalization and multiple testing correction
- Generate publication-quality visualizations and summary statistics
- Address technical issues and troubleshoot analysis problems
- Ensure data quality at each analysis stage

**Technical Documentation:**
- Document all methods, parameters, and commands used (critical for weekly lab reports)
- Maintain detailed analysis logs and troubleshooting notes
- Create reproducible scripts and workflows
- Track analysis decisions and rationale

**Equity & Accessibility Considerations:**
- Apply your equity expertise to ensure analysis methods are transparent and reproducible
- Consider potential biases in data or methods
- Document limitations and assumptions clearly
- Ensure findings are accessible to diverse audiences

#### Member 2 Expected Contributions (Two-Person)

- Biological context and interpretation expertise
- Literature review and background research
- Validation of computational findings
- Results visualization from biological perspective
- Writing contributions (particularly Results and Discussion sections)

#### Shared Responsibilities (Both Members)

- **Project selection and justification** (Week 3)
- **Weekly lab reports** (individual, 3/4–2 pages, covering accomplishments, methods, problems, goals)
- **Biological interpretation** (connecting computational results to biological significance)
- **Literature integration** (15+ primary sources for final paper)
- **Paper writing and revision** (color-coded contributions in Weeks 13-15)
- **Peer evaluation** (Week 10 and Week 16)
- **Regular communication** with instructor and through myCourses discussion boards

---

## 2B. Three-Person Team Configuration

### Team Members & Specialty Roles

Choose one of the following role distributions (or propose alternative aligned with your team's strengths):

#### **Option A: Specialist Distribution (RECOMMENDED)**

**Member 1 (You): Computational Biology Lead**
- Background: Programming, bioinformatics, data infrastructure
- Primary responsibilities:
  - Design and implement analysis pipeline architecture
  - Execute QC, preprocessing, alignment/assembly workflows
  - Manage computational resources and version control
  - Ensure reproducibility and technical documentation
  - Create infrastructure for fairness auditing (equity focus)
- Leads phases: Primary Analysis (Weeks 6–8), Secondary Analysis (Weeks 10–11)
- Deliverables: Clean preprocessing code, alignment/assembly results, reproducibility docs

**Member 2: Statistical Analysis Lead**
- Background: Statistics, bioinformatics, data science
- Primary responsibilities:
  - Design statistical methods and analysis approaches
  - Execute differential expression analysis with rigor
  - Implement fairness metrics and disparate impact audits
  - Create publication-quality visualizations
  - Conduct multiple testing correction and validation
- Leads phases: Tertiary Analysis (Weeks 12–15), Fairness audits (Weeks 11–14)
- Deliverables: DE results, fairness reports, visualization quality

**Member 3: Biological Integration Lead**
- Background: Molecular biology, genomics, or related field
- Primary responsibilities:
  - Provide biological context and interpretation
  - Conduct comprehensive literature review
  - Validate computational findings against biological knowledge
  - Design pathway analysis and functional interpretation
  - Lead biological writing (Introduction, Discussion)
- Involved in: All phases (biological lens throughout), Weeks 1–16
- Deliverables: Literature synthesis, biological interpretation, paper sections

#### **Option B: Phase-Based Distribution**

**Member 1: Primary Analysis Lead (Weeks 6–8)**
- Focus: Quality control, preprocessing, contamination filtering
- Responsibilities: QC pipeline, metrics reporting, data validation
- Follow-up: Technical documentation for Methods section

**Member 2: Secondary Analysis Lead (Weeks 10–11)**
- Focus: Alignment/assembly, coordinate systems, coverage analysis
- Responsibilities: Alignment/assembly execution, quality metrics, BAM/contig generation
- Follow-up: Methods documentation and results interpretation

**Member 3: Tertiary Analysis & Integration Lead (Weeks 12–15)**
- Focus: Differential expression, visualization, biological interpretation
- Responsibilities: DE analysis, statistical tests, visualization creation, biological context
- Follow-up: Results writing and Discussion synthesis

#### **Option C: Project-Component Distribution**

**Member 1: Infrastructure & Code Lead**
- Focus: All coding, data management, reproducibility
- Deliverables: GitHub repo, scripts, documentation, pipeline

**Member 2: Analysis & Methods Lead**
- Focus: Statistical design, parameter selection, data analysis execution
- Deliverables: Methods memos, analysis reports, fairness audits

**Member 3: Literature & Writing Lead**
- Focus: Research synthesis, biological context, paper composition
- Deliverables: Literature summaries, Introduction/Discussion drafts, integration

### Shared Responsibilities (All Three Members)

- **Project selection and justification** (Week 3)
- **Weekly lab reports** (individual, 3/4–2 pages, covering YOUR role + accomplishments, methods, problems, goals)
- **Biological interpretation** (connecting computational results to biological significance)
- **Literature integration** (15+ primary sources for final paper)
- **Paper writing and revision** (color-coded contributions in Weeks 13-15)
- **Peer evaluation** (Week 10 and Week 16)
- **Regular team communication** (weekly meetings, shared GitHub, decision log)
- **Regular communication** with instructor and through myCourses discussion boards

### Coordination Protocol for 3-Person Team

**Weekly Team Meeting (Thursday, 1–2 hours post-workshop):**
- Each member reports: accomplishments, blockers, next week's plan
- Coordinate data handoffs between phases/members
- Resolve technical decisions collaboratively
- Document decisions in shared decision log

**Decision Log (GitHub or shared document):**
- Track major analysis decisions made by each member
- Record rationale (especially fairness-related decisions)
- Allow for transparency and reproducibility
- Reference in weekly lab reports

**Code/Data Handoff Protocol:**
- Member A completes preprocessing → documents outputs in GitHub README
- Member B receives clean data → documents alignment parameters + outputs
- Member C interprets results → references Methods from A & B
- All updates tracked in Git history with clear commit messages

---

## 3. Project Structure and Analysis Phases

### Phase Structure: Primary → Secondary → Tertiary Analysis

**Framework:** The course employs a hierarchical analysis structure where each subsequent phase depends on successful completion of the previous phase. In a 3-person team, phases can overlap with careful coordination.

Primary Analysis (Quality Control & Preprocessing)
         ↓
Secondary Analysis (Alignment/Assembly)
         ↓
Tertiary Analysis (Differential Expression & Visualization)
         ↓
Bonus Analyses (SNP calling, Transcriptome creation, etc.)

### Phase 1: Primary Stage Analysis
**Timeline:** Weeks 6-8 (February 16 – March 2)  
**Focus:** Quality Control and preprocessing

**2-Person Team Responsibilities (Member 1):**
- Run FastQC for quality assessment of raw reads
- Execute quality trimming with appropriate tools (e.g., CutAdapt, FastX)
- Filter for adapter sequences and contamination
- Generate QC reports and visualizations
- Document all quality metrics and filtering thresholds
- Identify and troubleshoot any quality issues

**3-Person Team Responsibilities (Member 1 - Computational Biology Lead):**
- Run FastQC for quality assessment of raw reads
- Execute quality trimming with appropriate tools (e.g., CutAdapt, FastX)
- Filter for adapter sequences and contamination
- Generate QC reports and visualizations
- Document all quality metrics and filtering thresholds (with fairness audit support from Member 2)
- Identify and troubleshoot any quality issues
- *3-person addition:* Work with Member 3 to interpret QC patterns biologically

**Deliverables:**
- Clean, quality-controlled reads ready for alignment/assembly
- QC report with visualizations
- Weekly lab reports documenting process and results
- Participation grade (30 pts) based on completeness and methodology

### Phase 2: Secondary Stage Analysis
**Timeline:** Weeks 10-11 (March 16 – March 23)  
**Focus:** Read Alignment and/or Assembly

**2-Person Team Responsibilities (Member 1):**
- Implement alignment strategy using Bowtie2 and TopHat (for RNA-Seq)
- Perform de novo assembly if applicable (using Velvet or alternative)
- Generate alignment statistics and coverage analysis
- Create BAM files and coordinate validation
- Assess alignment quality and troubleshoot mapping issues
- Compare multiple methods if appropriate

**3-Person Team Responsibilities (Member 1 - Computational Biology Lead):**
- Implement alignment strategy using Bowtie2 and TopHat (for RNA-Seq)
- Perform de novo assembly if applicable (using Velvet or alternative)
- Generate alignment statistics and coverage analysis (with statistical validation from Member 2)
- Create BAM files and coordinate validation
- Assess alignment quality and troubleshoot mapping issues
- Compare multiple methods if appropriate
- *3-person addition:* Coordinate with Member 2 on fairness-aware alignment auditing (DI across ancestry/groups)

**Deliverables:**
- Aligned reads (BAM files) or assembled contigs
- Alignment/assembly quality metrics
- Coverage analysis and visualizations
- Weekly lab reports
- Participation grade (30 pts)

### Phase 3: Tertiary Stage Analysis
**Timeline:** Weeks 12-15 (March 30 – April 20)  
**Focus:** Differential Expression Analysis and Visualization

**2-Person Team Responsibilities (Member 1):**
- Quantify gene/transcript expression (using Cufflinks, RSEM, or alternative)
- Implement differential expression analysis with statistical rigor
- Apply appropriate normalization methods
- Conduct multiple testing correction (FDR, Bonferroni)
- Generate expression matrices and statistical summaries
- Create publication-quality visualizations (volcano plots, heatmaps, boxplots)
- Perform additional analyses (pathway analysis, clustering, correlation studies)

**3-Person Team Responsibilities (Member 2 - Statistical Analysis Lead):**
- Quantify gene/transcript expression (using Cufflinks, RSEM, or alternative)
- Implement differential expression analysis with statistical rigor
- Apply appropriate normalization methods (with Member 1's preprocessing support)
- Conduct multiple testing correction (FDR, Bonferroni)
- Generate expression matrices and statistical summaries
- Create publication-quality visualizations (volcano plots, heatmaps, boxplots)
- Perform additional analyses (pathway analysis, clustering, correlation studies)
- *3-person addition:* Implement fairness auditing (DI, equalized odds by group), lead statistical validation

**3-Person Team Responsibilities (Member 3 - Biological Integration Lead):**
- Interpret DE results in biological context
- Perform pathway analysis and functional enrichment
- Connect findings to existing literature
- Prepare biological interpretation for Results section
- Coordinate with Members 1 & 2 on validity of findings

**Deliverables:**
- Differential expression results with statistical support
- Expression visualizations and summary tables
- Fairness audit report (3-person teams)
- Analysis of biological significance
- Weekly lab reports
- Participation grade (30 pts)

### Phase 4: Bonus Analyses (Optional)
**Timeline:** Weeks 15-16 (April 20 – April 27)  
**Focus:** Extended analyses for additional credit (up to 20 bonus points)

**Possible bonus analyses:**
- SNP calling and variant analysis
- Novel transcript discovery
- Isoform quantification and analysis
- Co-expression network analysis
- Prediction of functionally important variants
- Integration with external databases
- Custom visualization tools
- Machine learning approaches to classification/clustering

**For 3-person teams:** Consider distributing bonus analyses:
- Member 1: SNP calling, isoform discovery
- Member 2: Network analysis, machine learning classification
- Member 3: Biological validation, pathway integration

---

## 4. Timeline and Itinerary

### Week-by-Week Breakdown

| Week | Dates | Activities | Your Key Tasks (2-Person) | Member 2 Tasks (2-Person) | 3-Person Additions | Deliverables | Points |
|------|-------|-----------|-----------------|------------|------|--------------|--------|
| 1 | Jan 12 | Course intro, HTS basics, Unix/Linux review | Set up working environment, review Unix tools | Prepare biology context | **3-person:** Confirm team composition & roles | Design analysis flowchart | - |
| 2 | Jan 19 | HTS technology review, Trapnell protocol | Study analysis workflows, begin Trapnell practice | Review biological protocols | **3-person:** Role assignment memo | Trapnell flowchart | 10 pts |
| 3 | Jan 26 | Assembly readings, Trapnell QC practice, **Project selection** | Practice QC tools on Trapnell data, identify project options | Research project datasets | **3-person:** Member 3 identifies biological context | Project 1st & 2nd picks | 10 pts |
| 4 | Feb 2 | RNA-Seq readings, Trapnell alignment practice | Execute alignment on Trapnell data | Discuss biological implications | **3-person:** Sync #1 (roles confirmed) | Lab report 1 | 3 pts |
| 5 | Feb 9 | Composite structures, differential expression | Conduct basic DE analysis on Trapnell | Interpret results biologically | **3-person:** Member 2 drafts fairness protocol | Lab report 2 | 3 pts |
| 6 | Feb 16 | Barcoding readings, **Begin Primary Stage Analysis** | QC on actual project data | Support data interpretation | **3-person:** Member 2 audits QC fairness | Lab report 3, QC analysis | 33 pts |
| 7 | Feb 23 | eDNA and scRNA-Seq readings | Continue Primary Stage analysis | Discuss batch effects | **3-person:** Member 3 researches similar studies | Lab report 4 | 3 pts |
| 8 | Mar 2 | Continue Primary Stage analysis | Finalize QC, begin quality filtering | Validate filtering rationale | **3-person:** Sync #2 (midterm check-in) | Lab report 5 | 3 pts |
| 9 | Mar 9 | Spring Break | *Optional*: Complete Primary Stage analysis | *Optional*: Literature prep | **3-person:** Optional coordination | Optional report | 0 pts |
| 10 | Mar 16 | Variant callers readings, **Begin Secondary Stage Analysis** | Execute alignment/assembly pipeline | Interpret alignment quality | **3-person:** Member 2 calculates DI metrics | Lab report 6, Secondary analysis | 33 pts |
| 11 | Mar 23 | Missing genes readings, continue Secondary Stage | Finalize alignment statistics | Validate biological patterns | **3-person:** Fairness audit report (Member 2 lead) | Lab report 7 | 3 pts |
| 12 | Mar 30 | **Begin Tertiary Stage Analysis** | Support DE infrastructure (3-person) or start DE (2-person) | Support biological validation (3-person) or co-lead DE (2-person) | **3-person:** Member 2 leads DE analysis | Lab report 8 | 3 pts |
| 13 | Apr 6 | Long-read technologies, Tertiary Stage analysis | Finalize visualizations (2-person) or support stats (3-person) | Biological interpretation | **3-person:** Sync #3 (results review) | Lab report 9, **Paper Draft 1 (Outline)** | 35 pts |
| 14 | Apr 13 | Microbiome/epigenetics, continue Tertiary Stage | Methods documentation finalization | Results writing support | **3-person:** Member 3 leads Discussion draft | Lab report 10, **Paper Draft 2 (50% prose/figures)** | 35 pts |
| 15 | Apr 20 | Bonus analyses discussion, analysis refinement | Implement bonus (2-person) or coordinate (3-person) | Support bonus analyses | **3-person:** Bonus analyses assigned per expertise | **Paper Draft 3 (nearly complete)**, Lab report | 20 pts |
| 16 | Apr 27 | Project completion and presentation | Finalize results and manuscript | Finalize biological sections | **3-person:** Sync #4 (celebrate!) | **Final Paper (due 11:59pm)**, Peer evaluations | 44 pts |

### Key Milestones

**Week 3 (January 26):** Project Selection + Team Confirmation
- Submit 1st and 2nd project choices with biological justification
- **Confirm final team size (2 or 3) with instructor**
- **If 3-person: Assign roles/responsibilities (Option A, B, or C)**

**Week 4 (February 2):** Sync #1 (3-person only)
- Confirm role assignments
- Establish communication protocols
- Set up GitHub or shared workspace

**Week 6 (February 16):** Primary Stage Analysis Begins
- Raw data retrieval and setup
- Quality control pipeline implementation

**Week 8 (March 2):** Sync #2 (3-person only)
- Review Primary Stage progress
- Confirm Secondary Stage readiness
- Discuss fairness metrics implementation

**Week 10 (March 16):** Secondary Stage Analysis Begins
- Alignment/assembly execution begins

**Week 11 (March 23):** Fairness Audit Report (3-person only)
- Disparate impact measurements by group
- Alignment quality stratified analysis
- Recommendations for DE phase

**Week 12 (March 30):** Tertiary Stage Analysis Begins
- Differential expression analysis and visualization

**Week 13 (April 6):** Sync #3 (3-person only) + Paper Draft 1
- Review DE results and fairness metrics
- Align on paper structure
- Structured outline of complete paper

**Week 14 (April 13):** Paper Draft 2 - 50% Complete
- All Methods section written
- Half of Results section with preliminary figures/tables

**Week 15 (April 20):** Sync #4 (3-person only) + Paper Draft 3
- Final review before capstone
- Results section complete with all visualizations
- Discussion section outline or draft

**Week 16 (April 27):** Final Paper Due + Capstone
- 30-50 pages, double-spaced
- 15+ primary sources
- Polished figures and tables
- Professional formatting per journal style

---

## 5. Weekly Lab Report Structure

### Purpose
Individual lab reports (10 of 12 possible weeks) document progress, methods, troubleshooting, and planning. These are essential for tracking your contributions and methodology development. **In a 3-person team, each member submits individual reports documenting THEIR role.**

### Required Elements (3/4–2 pages, single-spaced)

1. **Accomplishments Since Previous Report**
   - Specific analyses completed
   - Data processed or generated
   - Tools executed or developed
   - Results achieved
   - *3-person addition:* How you coordinated with other team members

2. **Methods Used**
   - Tools and software employed (with versions)
   - Specific commands executed (with parameters)
   - Analysis approaches and justification
   - Data sources and preprocessing steps
   - *3-person addition:* How your methods feed into other members' work

3. **Problems Encountered & Solutions**
   - Technical issues and resolution strategies
   - Unexpected results and interpretation
   - Parameter adjustments and why
   - Questions or areas needing discussion
   - *3-person addition:* Communication with team members about blockers

4. **Goals for Coming Week**
   - Next analysis steps
   - Expected outputs and milestones
   - Dependencies on other work
   - Timeline and resource needs
   - *3-person addition:* How upcoming work impacts team members

### Strategic Approach for 2-Person Teams
Your reports should emphasize the computational methods, technical decisions, and data science aspects. Document all commands, parameters, and the rationale for each choice. This documentation is critical for reproducibility and for writing the Methods section of your final paper.

### Strategic Approach for 3-Person Teams
**Member 1 (Computational Biology):** Emphasize infrastructure, pipeline decisions, code quality, and hand-offs to Members 2 & 3.

**Member 2 (Statistical Analysis):** Emphasize statistical decisions, fairness metrics, validation approaches, and integration of Member 1's results.

**Member 3 (Biological Integration):** Emphasize literature connections, biological interpretation of Member 2's results, and writing synthesis.

---

## 6. Final Paper Requirements

### Overview
A collaborative research paper (30-50 pages, double-spaced) in standard scientific format, presenting your project as if submitting to a peer-reviewed journal. **In a 3-person team, each member contributes color-coded sections aligned with their role.**

### Required Structure & Content

**Standard Scientific Sections:**

1. **Title and Abstract**
   - Concise summary of research question, methods, results, conclusions
   - Should be understandable to broad bioinformatics audience
   - *3-person:* Synthesized by all members (recommend Member 3 lead, Members 1 & 2 provide input)

2. **Introduction** (5-8 pages estimated)
   - Biological context and significance
   - Background on sequencing technologies and analysis methods
   - Statement of research question/hypothesis
   - Study organism or system background
   - 5-6 citations minimum
   - *2-person lead:* Member 2; *3-person lead:* Member 3

3. **Materials and Methods** (8-10 pages estimated)
   - Data source and characteristics (organism, tissue, conditions, sequencing platform)
   - Sample preparation and sequencing protocol overview
   - **Computational analysis pipeline:** Each major step with software names, versions, parameters
   - Quality control thresholds and criteria
   - Statistical methods for all analyses
   - Your responsibility (2-person): comprehensive technical documentation
   - *3-person:* Member 1 writes computational section; Member 2 writes statistical methods; Member 3 reviews for clarity

4. **Results** (10-15 pages estimated)
   - Factual presentation of findings
   - Quality control statistics and visualizations
   - Alignment/assembly statistics
   - Differential expression results with statistical support
   - Primary visualizations (figures and tables)
   - Biological interpretation of patterns
   - *2-person lead:* Member 1 writes, Member 2 supports biological interpretation
   - *3-person lead:* Member 2 writes, Members 1 & 3 support (1 with technical details, 3 with biological context)

5. **Discussion** (5-10 pages estimated)
   - Interpretation of findings in biological context
   - Comparison with existing literature
   - Limitations of study and methods
   - Biological implications and significance
   - Future directions and open questions
   - 5-9 citations minimum
   - *2-person lead:* Member 2 (with statistical support from Member 1)
   - *3-person lead:* Member 3 (with statistical/technical support from Members 1 & 2)

6. **References**
   - Minimum 15 primary sources
   - Properly formatted in journal style (APA or journal of choice)
   - *3-person:* Each member contributes citations from their domain

### Formatting Requirements

- **Document:** MS Word 2016+, LibreOffice, or OpenOffice (NOT Google Docs)
- **Font:** 10 or 12 point Calibri or Times New Roman
- **Spacing:** Double-spaced
- **Margins:** Exactly 1 inch on all sides
- **Page size:** 8.5" × 11"
- **Figures and tables:** No more than 50% of page count; remainder must be prose
- **Direct quotes:** Maximum one page total in entire paper

### Draft Schedule and Color-Coding

**Week 13 Draft 1 - Outline (2 pts)**
- Section headings and subsection organization
- Key findings and figures to be included
- Rough citation organization

**Week 14 Draft 2 - 50% Complete (2 pts)**
- Complete Methods section
- Half of Results section with preliminary figures
- Any sections requiring feedback

**Week 15 Draft 3 - 90% Complete (2 pts)**
- Complete Results with all visualizations
- Draft Discussion section or outline
- Most references integrated

**Final Paper - Complete (24 pts)**
- All sections polished and finalized
- Professional figures with captions
- Complete reference list
- Spell-checked and grammatically correct

### Color-Coding Contributions

**2-Person Team:**
- You (Member 1): [Choose one color, e.g., Blue]
- Team Member 2: [Choose another color, e.g., Red]
- Each section should have a comment with full name for identification

**3-Person Team:**
- Member 1 (Computational): [Color 1, e.g., Blue]
- Member 2 (Statistical): [Color 2, e.g., Red]
- Member 3 (Biological): [Color 3, e.g., Green]
- Each section should have a comment with full name and role for identification
- Suggested breakdown:
  - **Introduction:** Primarily Member 3 (Green), reviewed by all
  - **Methods (Computational):** Primarily Member 1 (Blue), Members 2 & 3 review
  - **Methods (Statistical):** Primarily Member 2 (Red), Members 1 & 3 review
  - **Results:** Primarily Member 2 (Red), Member 1 (Blue) provides technical details, Member 3 (Green) provides biological context
  - **Discussion:** Primarily Member 3 (Green), Members 1 & 2 provide supporting evidence
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

### Your Grade Strategy (2-Person Team)

**Strong Performance Areas (leverage your expertise):**
- **Primary Stage Analysis (30 pts):** Demonstrate rigorous QC methodology and data validation
- **Secondary Stage Analysis (30 pts):** Show mastery of alignment/assembly tools and troubleshooting
- **Tertiary Stage Analysis (30 pts):** Implement sophisticated statistical analyses and create publication-quality visualizations
- **Weekly Lab Reports (30 pts):** Document all technical methods comprehensively; this is your strength
- **Bonus Analyses (+20 pts):** Consider implementing machine learning or advanced statistical methods beyond basic requirements

**Paper Contribution (30 pts total = 6 draft + 24 final):**
- Lead Methods section (your technical expertise will shine here)
- Contribute to Results interpretation and visualization descriptions
- Ensure reproducibility documentation throughout

**Participation Grades (90 pts combined):**
- Consistent attendance and engagement
- Active problem-solving and troubleshooting
- Regular communication and reporting
- Quality of analysis decisions documented in reports

### Individual Grade Strategy (3-Person Team)

**Member 1 (Computational Biology Lead):**
- Strong in Primary & Secondary Analysis phases
- Excellent weekly reports on infrastructure decisions
- Methods section leadership
- Code quality & documentation = graded strength

**Member 2 (Statistical Analysis Lead):**
- Strong in Tertiary Analysis phase
- Excellent weekly reports on statistical decisions
- Fairness audit implementation (bonus expertise)
- Results section (data interpretation) = graded strength

**Member 3 (Biological Integration Lead):**
- Strong across all phases (biological lens)
- Excellent weekly reports on literature & interpretation
- Introduction/Discussion section leadership
- Paper coherence & biological accuracy = graded strength

**Peer Evaluations (crucial in 3-person teams):**
- Week 10 & 16 evaluations assess team contribution quality
- Each member evaluates other 2 members' work
- Evaluations inform final grading adjustments
- Instructor uses evaluations to verify fair contribution distribution

---

## 8. Communication and Collaboration Plan

### Internal Team Communication (2-Person)
- **Weekly meeting:** Thursday afternoons post-workshop (1-2 hours)
- **Discussion medium:** Email for updates, shared workspace (GitHub or similar) for code and analysis
- **Decision log:** Document major analysis decisions and rationale
- **Backup plans:** Ensure both team members understand critical analysis steps

### Internal Team Communication (3-Person)

**Weekly Team Meeting (Thursday, 1–2 hours post-workshop):**
- **Agenda:** Each member reports accomplishments, blockers, next week's plan (15 min each)
- **Coordination:** Review data handoffs between phases, discuss technical decisions
- **Documentation:** Record decisions in decision log (why we chose Method A vs B, fairness implications, etc.)
- **Attendance:** Mandatory for all members; record absences

**Asynchronous Communication:**
- **GitHub Issues:** Technical questions, blockers, feature requests
- **Email:** Status updates, announcements, scheduling
- **Shared Document:** Decision log, fairness audit progress, paper outline

**Monthly Syncs (3-Person Only):**
- **Weeks 4, 8, 12, 14:** 30-min touchpoint with instructor + team (optional, but recommended)
- **Purpose:** Validate progress, align on fairness strategy, resolve inter-member conflicts
- **Outcome:** Brief written summary of sync (1-2 paragraphs) committed to GitHub

**Decision Log Template (3-Person):**
```
## Week [N]: [Topic]
- **Decision:** [What did we decide?]
- **Proposed by:** [Member name]
- **Rationale:** [Why? References frameworks? Fairness implications?]
- **Owner:** [Who implements this?]
- **Impact:** [Affects which phase/member?]
- **Status:** ✓ Approved / 🔄 In progress / ❌ Blocked (reason)
- **GitHub link:** [Commit or PR if applicable]
```

### Course Communication (Both 2-Person & 3-Person)

- **Instructor contact:** mvoscl@rit.edu (Michael Osier, Office 08-1338)
- **Lab meetings:** Thursday 9:30-11:20am (Zoom)
- **Lectures:** Monday/Wednesday 11:00-11:50am (WAL-4600)
- **myCourses discussion:** Post progress updates, questions, and collaborate with broader class
- **Lab reports:** Individual submissions before Thursday workshop

### Progress Monitoring (2-Person)
- **Weekly check-ins:** Review lab report drafts before submission
- **Monthly meetings with instructor:** Discuss progress on analysis phases and paper development
- **Mid-semester feedback (Week 8):** Solicit instructor guidance on analysis approach and project direction

### Progress Monitoring (3-Person)
- **Weekly check-ins:** Each member reviews their own lab report; team discusses in Thursday meeting
- **Monthly syncs (Weeks 4, 8, 12, 14):** Team + instructor touch-base on fairness metrics, role coordination, blockers
- **Mid-semester feedback (Week 8):** Team solicits instructor guidance; adjust roles if needed
- **Peer feedback (Weeks 10, 16):** Formal evaluations ensure fair contribution distribution

---

## 9. Technical Resources and Tools

### Course-Approved Analysis Tools

**Quality Control:**
- FastQC (quality assessment)
- FastX toolkit (preprocessing)
- CutAdapt (adapter trimming)

**Alignment/Assembly:**
- Bowtie2 (short read alignment)
- Bowtie (legacy alignment)
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

**Fairness Auditing (3-Person Teams):**
- fairlearn (Python library for fairness metrics)
- Spreadsheets for disparate impact calculation
- Custom scripts for ancestry/group-stratified analysis

### Computing Resources
- RIT computing cluster (if available for HTS analysis)
- Personal workstation with adequate RAM and storage
- Git repository for version control (GitHub, GitLab)

### Documentation Resources
- Course materials in myCourses
- Tool documentation and manuals
- Cornell Bowtie/Cufflinks exercise tutorial
- Weekly lecture materials and readings
- IDAI700 EQUITAS framework (3-person teams)
- ISTE780 fairness metrics (3-person teams)

---

## 10. Project Success Criteria

### Definitions of Success (Shared Across All Teams)

**Data Quality:**
- ✓ QC metrics show high-quality, contamination-free reads
- ✓ No systematic biases detected in quality profiles
- ✓ Preprocessing decisions well-documented and justified

**Analytical Rigor:**
- ✓ Appropriate tools selected with justified parameters
- ✓ All analysis decisions logged and explained
- ✓ Statistical methods applied correctly with multiple testing correction
- ✓ Reproducible pipeline documented for all steps

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

**Equity & Transparency:**
- ✓ Methods documented clearly for broad accessibility
- ✓ Potential biases acknowledged
- ✓ Data processing decisions transparent
- ✓ Limitations discussed honestly

### Additional Success Criteria for 3-Person Teams

**Team Coordination:**
- ✓ Clear role assignments and responsibilities documented (Week 2-3)
- ✓ Weekly meetings held consistently; attendance logged
- ✓ Decision log maintained with clear ownership
- ✓ Data/code handoffs smooth (no miscommunications about formats, parameters)
- ✓ GitHub repo organized with clear branch/folder structure for each role

**Fairness Integration:**
- ✓ Disparate impact baseline documented (baseline audit)
- ✓ Each phase includes fairness assessment or mitigation strategy
- ✓ Fairness metrics (DI, equalized odds) tracked in decision log
- ✓ Trade-off decisions documented (accuracy vs. fairness choices)
- ✓ Final paper includes fairness discussion in Methods + Results

**Individual Contribution Quality (Assessed via Peer Evaluation):**
- ✓ Each member delivers their role's components on time
- ✓ Peer evaluations show balanced and fair contribution
- ✓ No one member dominates or free-rides
- ✓ Collaborative problem-solving evident in meeting notes

---

## 11. Contingency Planning

### Potential Challenges and Mitigation Strategies

| Challenge | Mitigation Strategy |
|-----------|-------------------|
| Second/third team member unavailable | **2-person:** Communicate with instructor immediately; potentially adjust scope or accept adjusted grading. **3-person:** Redistribute roles to remaining members; use peer evaluation to adjust grades fairly |
| Data quality issues | Document issues thoroughly; discuss with instructor on remediation options or data replacement |
| Tool failures/software bugs | Maintain backup analysis approaches; document errors for troubleshooting |
| Unexpected analysis results | Investigate thoroughly; consider alternative analytical approaches; consult literature |
| Time management issues | Weekly reports help track progress; adjust bonus analyses scope if needed |
| Computing resource limitations | Plan efficient analyses; use cluster computing; optimize code for performance |
| **3-person only:** Role conflict or miscommunication | Weekly meetings + decision log prevent miscommunication; use peer evaluations to flag issues early |
| **3-person only:** Unequal work distribution | Monthly syncs with instructor allow adjustment; peer evaluations quantify contributions; grades adjusted if needed |

---

## 12. Next Steps and Immediate Actions

### Before Week 2 (Confirm Team Size):

1. **Discuss team size with instructor**
   - Confirm whether 2-person or 3-person is allowed
   - If 3-person, understand if roles need instructor approval

### Before Week 3 (Project Selection):

1. **Review available datasets** (2-person & 3-person)
   - Consult myCourses for available HTS projects
   - Identify research questions of interest
   - Ensure familiarity with data source and organism

2. **Prepare selection justification** (2-person & 3-person)
   - Document 1st and 2nd project choices
   - Write 1-2 paragraphs explaining scientific rationale
   - Consider how data aligns with your expertise and interests

3. **Recruit or confirm team members**
   - **2-person:** Identify one complementary expertise needed
   - **3-person:** Identify two complementary expertise areas (recommend: one stats-focused, one biology-focused)
   - Ensure clear communication and collaboration plan
   - Share this document with prospective team members

4. **Assign roles** (3-person only)
   - Choose one of three distribution options (Specialist, Phase-Based, or Project-Component)
   - Document role assignments in Week 3 submission
   - Set up communication channels (GitHub, email, meeting schedule)

### Weeks 1-3 (Course Foundations - All Teams):

1. **Trapnell protocol practice**
   - Work through TopHat/Cufflinks tutorial on practice dataset
   - Document commands and outputs
   - Prepare design flowchart for your understanding

2. **Tool familiarization**
   - Install and test FastQC, Bowtie2, Cufflinks locally
   - Review documentation for each tool
   - Create reference guides for command-line syntax

3. **Establish working environment**
   - Set up project directory structure
   - Initialize version control repository (Git)
   - Establish lab report template for consistency
   - **3-person only:** Set up GitHub discussion board or shared decision log

### Week 2-3 (3-Person Team Setup):

1. **First team meeting**
   - Discuss role assignments (pick Option A, B, or C)
   - Establish communication norms (meeting time, response time, escalation path)
   - Create shared calendar with weekly meetings locked in
   - Assign GitHub repo admin

2. **GitHub setup**
   - Create repo with folders: `/biol550_person1/`, `/biol550_person2/`, `/biol550_person3/` (or phase-based)
   - Create `/docs/decision_log.md` for tracking
   - Create `/docs/coordination_notes.md` for meeting summaries
   - Create `/README.md` with team member roles and contact info

3. **Decision log initialization**
   - Document role assignments (decision + rationale + owner)
   - Document team communication norms (decision + owner)
   - Establish template for future entries

---

## References and Resources

**Course Materials:**
- BIOL550 Syllabus (Michael Osier, Spring 2026)
- myCourses course materials and discussion boards
- Cornell Bowtie/Cufflinks tutorial

**Key Methods Papers:**
- Trapnell et al. (2012) - TopHat/Cufflinks protocol (Nat. Protocols)
- Referenced HTS papers in course readings (Weeks 1-16)

**Tool Documentation:**
- FastQC: https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
- Bowtie2: https://bowtie-bio.sourceforge.net/bowtie2/
- Cufflinks: https://cole-trapnell-lab.github.io/cufflinks/
- RSEM: https://github.com/deweylab/RSEM

**Additional Resources:**
- Bioconductor Project: https://www.bioconductor.org/
- Galaxy Project: https://usegalaxy.org/
- SeqAnswers bioinformatics forum

**Fairness & Equity Resources (3-Person Teams with Quantum-Fair Biomarkers Focus):**
- IDAI700 EQUITAS framework (epistemic justice, procedural justice, civic literacy)
- ISTE780 fairness metrics (disparate impact, equalized odds, fairness constraints)
- BIO630 algorithm validation (reproducibility, robustness)
- Your quantum-inspired MA research (decision-making under uncertainty + adversarial conditions)

---

## Document Version Control

| Version | Date | Changes | Prepared By |
|---------|------|---------|------------|
| 1.0 | January 26, 2026 | Initial project plan created for 2-person team | [Your Name] |
| 2.0 | January 26, 2026 | Updated to support flexible 2–3 person team configurations | [Your Name] |
| | | Added Option A, B, C role distributions for 3-person teams | |
| | | Added 3-person coordination protocols and syncs | |
| | | Integrated quantum-fair biomarkers framework | |

---

**This document serves as a living reference. Update it as your project progresses, analysis phases complete, and new information emerges. Ensure all team members have access to current versions.**

**Last Updated:** January 26, 2026

---

## QUICK REFERENCE: 2-Person vs 3-Person Decision Matrix

**Choosing between 2-person and 3-person?**

| Factor | 2-Person Better | 3-Person Better |
|--------|-----------------|-----------------|
| **Workload distribution** | Lower overall workload | Specialized roles, less overlap stress |
| **Expertise needed** | Generalist (you) + specialist | Distributed specialization possible |
| **Coordination complexity** | Simple (2 people) | Moderate (needs decision log) |
| **Bonus content potential** | Limited time for extras | More bandwidth for fairness audit + bonus |
| **Paper quality** | Faster writing process | More biological depth + tech rigor |
| **Grading risk** | One person carries team if other underperforms | Fairness distribution via peer eval |
| **Your preference** | If you prefer to lead all major decisions | If you prefer collaborative expertise |

**Action:** Discuss with prospective team member(s) by Week 2. Confirm with instructor by Week 3 project selection deadline.
