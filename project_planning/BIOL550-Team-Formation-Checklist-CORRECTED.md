# BIOL550 Team Formation Checklist (CORRECTED)

**Date:** January 27, 2026  
**Team:** Samuel Kopelev (Computational), Piter Garcia (Statistical), Claire Marshall (Biological), Nikhi Boggavarapu (Support)

---

## IMMEDIATE ACTION ITEMS (This Week - Jan 27-31)

### Email to Professor Osier
- [ ] **Prepare email:**
  - Subject: "BIOL550 Final Team Composition - 3-Person Team"
  - Include: Team roster with names and expertise
  - Include: Role assignments (Samuel-Computational, Piter-Statistical, Claire-Biological)
  - Include: 3-phase framework overview
  - Request: Confirmation of team structure
- [ ] **Send to:** mvoscl@rit.edu
- [ ] **CC:** Samuel Kopelev, Claire Marshall, Nikhi Boggavarapu
- [ ] **Deadline:** Friday, January 31, 2026
- [ ] **Keep:** Copy of confirmation response

### First Team Meeting (Thursday Jan 30 or Friday Jan 31)
- [ ] Confirm all members have reviewed the BIOL550-Final-Project-Plan
- [ ] Confirm all members agree with role assignments
- [ ] Lock in weekly Thursday 12:30-2:00pm meeting time for entire semester
- [ ] Establish communication norms:
  - [ ] Email response time expectations
  - [ ] GitHub commit message standards
  - [ ] Meeting attendance policy
  - [ ] Decision-making process

### Samuel: Create GitHub Repository
- [ ] Repository name: `biol550-hts-analysis-spring2026`
- [ ] Folder structure:
  - [ ] `/README.md` - Team roster and project overview
  - [ ] `/data/raw/` - Original sequence files
  - [ ] `/data/processed/` - Cleaned and aligned data
  - [ ] `/scripts/qc/` - FastQC and trimming scripts
  - [ ] `/scripts/alignment/` - Bowtie2/TopHat commands
  - [ ] `/scripts/de_analysis/` - Cufflinks/RSEM and statistical scripts
  - [ ] `/scripts/fairness/` - Disparate impact calculations
  - [ ] `/docs/decision_log.md` - Analysis decisions and rationale (template initialized)
  - [ ] `/docs/coordination_notes.md` - Meeting summaries
  - [ ] `/paper/` - Draft documents and final manuscript
  - [ ] `/lab_reports/` - Weekly submissions organized by member
  - [ ] `/results/` - All output subdirectories
- [ ] Initialize `.gitignore` file
- [ ] Add all team members as collaborators
- [ ] Share repository link with team

---

## WEEK 2-3 PREPARATION (Jan 27 - Feb 9)

### All Members: Trapnell Protocol Practice
- [ ] **Samuel:** Install FastQC, Bowtie2, TopHat, SAMtools locally
  - [ ] Document installation steps and environment setup
  - [ ] Test tools with practice dataset
  - [ ] Create command reference guide

- [ ] **Piter:** Set up R environment with required packages
  - [ ] Install ggplot2, DESeq2 (or equivalent)
  - [ ] Install fairlearn library (Python)
  - [ ] Test statistical workflows
  - [ ] Create analysis template scripts

- [ ] **Claire:** Review biological background
  - [ ] Study Trapnell dataset organism and tissue context
  - [ ] Review relevant literature on sequencing protocols
  - [ ] Prepare background document on study system

- [ ] **Nikhi:** Organize course materials
  - [ ] Download all syllabus readings
  - [ ] Create shared folder structure
  - [ ] Compile reference guides

### Lab Report Preparation
- [ ] Create shared lab report template
- [ ] Agree on format (section headings, length, submission deadline)
- [ ] Establish submission process (myCourses dropbox before Thursday 9:30am)

---

## WEEK 3 DATASET SELECTION (Feb 2-9)

### Dataset Assessment
- [ ] **Samuel - Computational Assessment:**
  - [ ] Data size and sequencing depth
  - [ ] File formats and processing requirements
  - [ ] Estimated computational time for each analysis phase
  - [ ] RAM and storage requirements
  - [ ] Tool compatibility

- [ ] **Piter - Statistical Assessment:**
  - [ ] Sample size and biological replicates
  - [ ] Group definitions and experimental design
  - [ ] Fairness audit potential (ancestry, demographic groups, etc.)
  - [ ] Statistical power estimation
  - [ ] Potential confounding variables

- [ ] **Claire - Biological Assessment:**
  - [ ] Organism and study system relevance
  - [ ] Tissue/cell type and biological context
  - [ ] Research question and hypothesis significance
  - [ ] Existing literature on similar datasets
  - [ ] Publication potential

### Dataset Selection Submission
- [ ] Document 1st dataset choice with scientific rationale (1-2 paragraphs)
- [ ] Document 2nd dataset choice with scientific rationale (1-2 paragraphs)
- [ ] Include assessment from each member
- [ ] Submit via myCourses by Week 3 deadline (February 2)

---

## WEEKS 4-5 SETUP & PLANNING (Feb 9-23)

### GitHub Repository Finalization
- [ ] All members have access and can commit code
- [ ] Decision log template created and shared
- [ ] README.md updated with team roster and project overview
- [ ] Lab report submission folder created

### First Lab Report Submission (Week 4 - Feb 2)
- [ ] **Samuel:** Write first lab report documenting environment setup
- [ ] **Piter:** Write first lab report documenting statistical tool setup
- [ ] **Claire:** Write first lab report documenting literature review progress
- [ ] **Nikhi:** Support coordination of submissions
- [ ] Submit to myCourses by deadline

### Project Planning
- [ ] Finalize GitHub folder structure
- [ ] Establish data backup strategy
- [ ] Confirm computing resource access (RIT cluster if needed)
- [ ] Schedule monthly "syncs" with Professor Osier (Weeks 4, 8, 12, 14)

---

## WEEKS 6-8 PRIMARY STAGE ANALYSIS (Feb 16 - Mar 2)

- [ ] **Samuel:** Execute FastQC on real project data
- [ ] **Samuel:** Quality trimming and contamination filtering
- [ ] **Samuel:** Generate QC reports and visualizations
- [ ] **Samuel:** Document all QC thresholds and decisions in decision log
- [ ] **Piter:** Support fairness assessment in QC (if applicable)
- [ ] **Claire:** Interpret QC patterns biologically
- [ ] **All:** Weekly lab reports documenting progress
- [ ] **All:** Weekly Thursday meetings (track attendance)
- [ ] Submit Primary Stage QC analysis by Week 8 deadline

---

## WEEKS 10-11 SECONDARY STAGE ANALYSIS (Mar 16 - Mar 23)

- [ ] **Samuel:** Execute Bowtie2/TopHat alignment
- [ ] **Samuel:** Generate alignment statistics and coverage analysis
- [ ] **Samuel:** Create BAM files and validate coordinates
- [ ] **Samuel:** Document all alignment parameters in decision log
- [ ] **Piter:** Calculate disparate impact metrics across biological groups
- [ ] **Piter:** Assess equalized odds in alignment quality
- [ ] **Piter:** Complete Fairness Audit Report (Week 11)
- [ ] **Claire:** Validate alignment quality biologically
- [ ] **All:** Weekly lab reports
- [ ] **All:** Weekly Thursday meetings
- [ ] Submit Secondary Stage analysis + Fairness Audit Report by Week 11

---

## WEEKS 12-15 TERTIARY STAGE ANALYSIS & PAPER DEVELOPMENT (Mar 30 - Apr 27)

### Tertiary Stage Analysis
- [ ] **Piter:** Begin differential expression quantification (Cufflinks/RSEM)
- [ ] **Piter:** Implement statistical tests (FDR, Bonferroni correction)
- [ ] **Piter:** Create publication-quality visualizations
- [ ] **Piter:** Implement fairness metrics (disparate impact, equalized odds) in DE results
- [ ] **Samuel:** Provide technical support and documentation
- [ ] **Claire:** Interpret results biologically and connect to literature
- [ ] **All:** Weekly lab reports

### Paper Development - Week 13 (Apr 6)
- [ ] **Paper Draft 1 - Outline (2 pts):**
  - [ ] All section headings and subsections
  - [ ] Key figures and tables listed
  - [ ] Rough citation organization
  - [ ] Samuel (Blue), Piter (Red), Claire (Green) contributions noted
  - [ ] Submit to myCourses by Thursday workshop

### Paper Development - Week 14 (Apr 13)
- [ ] **Paper Draft 2 - 50% Complete (2 pts):**
  - [ ] Complete Methods section (Samuel: computational, Piter: statistical)
  - [ ] Half of Results section with preliminary figures
  - [ ] Any sections requiring feedback highlighted
  - [ ] Color-coded contributions clearly marked
  - [ ] Submit to myCourses by Thursday workshop

### Paper Development - Week 15 (Apr 20)
- [ ] **Paper Draft 3 - 90% Complete (2 pts):**
  - [ ] Complete Results with all visualizations
  - [ ] Draft Discussion section or detailed outline
  - [ ] Most references integrated
  - [ ] Spell-check and grammar review begun
  - [ ] Submit to myCourses by Thursday workshop

### Paper Development - Week 16 (Apr 27)
- [ ] **Final Paper - Complete (24 pts):**
  - [ ] All sections polished and finalized
  - [ ] Professional figures with captions
  - [ ] Complete reference list (15+ primary sources)
  - [ ] Spell-checked and grammatically correct
  - [ ] MS Word/LibreOffice/OpenOffice format
  - [ ] 30-50 pages, double-spaced, 1" margins
  - [ ] Standard scientific sections (Intro, Methods, Results, Discussion, References)
  - [ ] Color-coded contributions visible
  - [ ] Submit to myCourses by 11:59pm deadline

---

## BONUS ANALYSES (Weeks 15-16)

- [ ] **Samuel (optional):** SNP calling and/or isoform discovery
- [ ] **Piter (optional):** Network analysis and/or machine learning classification
- [ ] **Claire (optional):** Biological validation and pathway integration
- [ ] Document bonus work in GitHub and weekly reports

---

## PEER EVALUATIONS

- [ ] **Week 10:** Each member evaluates other two members' contributions
  - [ ] Completeness of assigned tasks
  - [ ] Quality of work
  - [ ] Communication and collaboration
  - [ ] Effort and engagement

- [ ] **Week 16:** Final peer evaluation
  - [ ] Overall contribution assessment
  - [ ] Team experience reflection
  - [ ] Suggestions for improvement

---

## KEY DATES - SUMMARY

| Date | Milestone | Owner | Status |
|------|-----------|-------|--------|
| Jan 31 | Email to Professor Osier | Piter | [ ] |
| Feb 2 | Dataset selection | All | [ ] |
| Feb 2 | First team meeting | All | [ ] |
| Feb 16 | Primary Analysis begins | Samuel | [ ] |
| Mar 2 | Primary Analysis complete | Samuel | [ ] |
| Mar 16 | Secondary Analysis begins | Samuel | [ ] |
| Mar 23 | Fairness Audit Report | Piter | [ ] |
| Mar 30 | Tertiary Analysis begins | Piter | [ ] |
| Apr 6 | Paper Draft 1 | All | [ ] |
| Apr 13 | Paper Draft 2 (50%) | All | [ ] |
| Apr 20 | Paper Draft 3 (90%) | All | [ ] |
| Apr 27 | Final Paper (11:59pm) | All | [ ] |
| Apr 27 | Peer evaluations | All | [ ] |

---

## SUCCESS INDICATORS BY WEEK 5

✅ Team composition confirmed with Professor Osier  
✅ GitHub repository initialized and accessible to all members  
✅ Weekly Thursday meetings established and calendar invites sent  
✅ Decision log template created and shared  
✅ Trapnell practice completed by all members  
✅ Lab report template created and agreed upon  
✅ First team meeting held with roles confirmed  
✅ Dataset selection submitted  
✅ All project plan documents shared and understood

---

## FINAL NOTES

- **Primary responsibility:** Each member leads their assigned analysis phase
- **Collaborative approach:** Weekly meetings prevent miscommunication and ensure smooth handoffs
- **Documentation:** All decisions, commands, and rationale logged for reproducibility
- **Fairness integration:** Disparate impact and equalized odds assessed throughout project
- **Paper quality:** Color-coded sections ensure clear individual contribution tracking

---

**Use this checklist throughout the semester. Check off items as completed. Reference dates and deadlines regularly.**

**Good luck with BIOL550! 🧬📊📄**
