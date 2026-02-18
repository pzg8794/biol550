# BIOL550 Team Formation Checklist

**Date:** January 26, 2026  
**Project:** BIOL550 High Throughput Sequencing Analysis (Spring 2026)

---

## Pre-Submission Checklist (Before Sending to Professor Osier)

### Team Composition ✓
- [ ] Confirmed all 4 team members willing and available:
  - [ ] You (Computational Biology Lead)
  - [ ] Peter Garcia (Statistical Analysis & Fairness Lead)
  - [ ] Claire Marshall (Biological Integration & Literature Lead)
  - [ ] Nikhi Boggavarapu (Undergraduate Research Support)
- [ ] All team members have reviewed the detailed project plan
- [ ] All team members understand their role and responsibilities
- [ ] All team members agree to Thursday weekly meetings (12:30-2:00pm post-workshop)

### Email to Professor (Use Template Provided)
- [ ] Subject line: "BIOL550 Final Team Composition & Project Overview - 3-Person Team Configuration"
- [ ] Include team roster with names, expertise, roles, and key responsibilities
- [ ] Include 3-phase analysis framework overview
- [ ] Include alignment with course requirements
- [ ] Request confirmation of team structure
- [ ] CC all team members on email
- [ ] Attach: BIOL550-Final-Project-Plan.md and BIOL550-Team-Summary.md
- [ ] Send to: mvoscl@rit.edu
- [ ] **Deadline:** By end of Week 2 (January 31, 2026)

### GitHub Repository Setup (Member 1 Responsibility)
- [ ] Create GitHub repository with descriptive name (e.g., `biol550-hts-analysis-spring2026`)
- [ ] Initialize with recommended folder structure:
  - [ ] `/README.md` - Team roster and project overview
  - [ ] `/data/raw/` - Original sequence files
  - [ ] `/data/processed/` - Cleaned and aligned data
  - [ ] `/scripts/qc/` - FastQC and trimming scripts
  - [ ] `/scripts/alignment/` - Bowtie2/TopHat commands
  - [ ] `/scripts/de_analysis/` - Cufflinks/RSEM and statistical scripts
  - [ ] `/scripts/fairness/` - Disparate impact calculations
  - [ ] `/results/` - All output subdirectories
  - [ ] `/docs/decision_log.md` - Analysis decisions and rationale
  - [ ] `/docs/coordination_notes.md` - Meeting summaries
  - [ ] `/paper/` - Draft documents and final manuscript
  - [ ] `/lab_reports/` - Weekly submissions organized by member
- [ ] Add all team members as collaborators
- [ ] Make repository private (for data security) or public (for transparency)
- [ ] Create initial `.gitignore` file (exclude raw data files, large outputs)
- [ ] Add MIT or GPL license
- [ ] Share repository link with team and save in shared document

### Team Communication Setup
- [ ] Create shared calendar (Google Calendar or similar) with:
  - [ ] Weekly Thursday meeting 12:30-2:00pm (locked in for all 16 weeks)
  - [ ] Synchronization points (Weeks 4, 8, 12, 14)
  - [ ] Major deadlines (Week 3 project selection, Week 13-15 paper drafts, Week 16 final)
- [ ] Establish email communication protocol:
  - [ ] Primary contact: GitHub issues/discussions for technical questions
  - [ ] Secondary: Email for scheduling and urgent updates
  - [ ] CC practices to keep all members informed
- [ ] Share myCourses discussion board access
- [ ] Create shared document (Google Doc or GitHub wiki) for decision log

### First Team Meeting Agenda (Schedule for Week 2)
- [ ] Review this project plan document with all members
- [ ] Confirm role assignments and responsibilities
- [ ] Establish communication norms:
  - [ ] Email response time expectations
  - [ ] Meeting attendance requirements
  - [ ] GitHub commit message standards
  - [ ] Decision log update frequency
- [ ] Assign GitHub administration (recommend Member 1)
- [ ] Assign decision log maintenance (recommend Member 2)
- [ ] Assign meeting notes coordinator (recommend Nikhi or Member 3)
- [ ] Lock in weekly meeting time and calendar invites
- [ ] Discuss backup plans for illness/emergency absence
- [ ] Document meeting attendees and action items

### Week 2-3 Trapnell Protocol Practice
- [ ] Member 1: Set up local/cluster environment, install FastQC, Bowtie2, Cufflinks
- [ ] Member 2: Set up R environment, install ggplot2 and statistical packages
- [ ] Member 3: Review biological background on Trapnell dataset
- [ ] All members: Complete Trapnell protocol tutorial on practice dataset
- [ ] Document all commands used in GitHub `/scripts/` directory
- [ ] Create initial lab report template for consistency
- [ ] Generate Trapnell practice flowchart showing pipeline steps

### Week 3 Dataset Selection Preparation
- [ ] Review available datasets on myCourses
- [ ] Member 1: Assess computational feasibility (data size, quality, processing time)
- [ ] Member 2: Assess statistical complexity (sample size, group definitions, fairness potential)
- [ ] Member 3: Assess biological relevance (organism, tissue, research question, publication potential)
- [ ] Team discussion: Select 1st and 2nd choice datasets
- [ ] Document scientific rationale for each choice (1-2 paragraphs per dataset)
- [ ] Submit dataset selections via myCourses by Week 3 deadline (February 2)

### Before Week 6 (Primary Stage Analysis Start)
- [ ] Finalize dataset selection (Prof Osier will confirm)
- [ ] Download raw sequence data and verify integrity (check file size, checksums)
- [ ] Organize raw data in `/data/raw/` with clear naming conventions
- [ ] Create data metadata file (sample descriptions, groupings, sequencing platform)
- [ ] Member 1: Set up QC pipeline (FastQC batch processing)
- [ ] Member 2: Draft quality filtering criteria and fairness considerations
- [ ] Member 3: Prepare biological background document on study organism/tissue
- [ ] Confirm computing resources (RIT cluster access, local workstation specs)
- [ ] Back up all essential files to secondary storage

---

## Deliverables Checklist (Use Throughout Semester)

### Weekly Submissions
- [ ] Week 2: Trapnell flowchart (all members)
- [ ] Week 3: Project selection with rationale (all members)
- [ ] **Weeks 4-16:** Lab reports (individual, 3/4-2 pages each)
  - [ ] Member 1 reports (Weeks 2-16)
  - [ ] Member 2 reports (Weeks 2-16)
  - [ ] Member 3 reports (Weeks 2-16)

### Analysis Phase Deliverables
- [ ] **Weeks 6-8 (Primary Analysis):** QC report, clean reads, GitHub commits
- [ ] **Weeks 10-11 (Secondary Analysis):** Aligned reads (BAM), alignment statistics, coverage plots
- [ ] **Week 11 (Fairness Audit):** Disparate impact report, equalized odds analysis, recommendations
- [ ] **Weeks 12-15 (Tertiary Analysis):** DE results, statistical summaries, visualizations
- [ ] **Weeks 15-16 (Bonus):** SNP calls / network analysis / ML results (if applicable)

### Paper Development
- [ ] **Week 13:** Paper Draft 1 - Outline (2 pts)
  - [ ] All section headings
  - [ ] Key figures/tables listed
  - [ ] Citation organization
- [ ] **Week 14:** Paper Draft 2 - 50% Complete (2 pts)
  - [ ] Complete Methods section
  - [ ] Half of Results with preliminary figures
  - [ ] Feedback incorporated from Draft 1
- [ ] **Week 15:** Paper Draft 3 - 90% Complete (2 pts)
  - [ ] Complete Results with all visualizations
  - [ ] Discussion draft or outline
  - [ ] Most references integrated
- [ ] **Week 16:** Final Paper (24 pts, due 11:59pm)
  - [ ] All sections polished
  - [ ] 30-50 pages double-spaced
  - [ ] 15+ primary sources in reference list
  - [ ] All figures captioned and high-quality
  - [ ] Color-coding visible for member contributions
  - [ ] Spell-checked and grammatically correct

### Evaluation & Documentation
- [ ] **Week 10:** Peer evaluation (evaluate other team members)
- [ ] **Week 16:** Peer evaluation (final assessment)
- [ ] **Weekly:** GitHub commits documenting analysis steps
- [ ] **Weekly:** Decision log updates with analysis rationale
- [ ] **Weeks 13-16:** Lab report final weeks (participation documentation)

---

## Files to Send to Professor Osier

1. **Email Text (use template provided)**
   - Subject: "BIOL550 Final Team Composition & Project Overview - 3-Person Team Configuration"
   - Include team roster, analysis framework, course alignment
   - Request confirmation of team structure
   - CC all team members

2. **Attachments:**
   - [ ] BIOL550-Final-Project-Plan.md (comprehensive 16-week plan)
   - [ ] BIOL550-Team-Summary.md (one-page team overview)
   - [ ] Optional: GitHub repository link (once created)

---

## Success Indicators (By Week 5)

✓ Team composition confirmed with professor  
✓ GitHub repository initialized and accessible to all members  
✓ Weekly Thursday meetings established and calendar invites sent  
✓ Decision log template created and shared  
✓ Trapnell practice completed by all members  
✓ Lab report template created and shared  
✓ First team meeting held with roles confirmed  
✓ Dataset selection submitted and awaiting professor confirmation  
✓ Project plan document finalized and shared with all stakeholders  

---

## Important Dates to Remember

| Date | Milestone | Owner | Status |
|------|-----------|-------|--------|
| Jan 31 (Week 2) | Team confirmation email to professor | You | [ ] |
| Feb 2 (Week 3) | Dataset selection submission | All | [ ] |
| Feb 16 (Week 6) | Primary Stage Analysis begins | Member 1 | [ ] |
| Mar 2 (Week 8) | Primary Stage Analysis complete | Member 1 | [ ] |
| Mar 16 (Week 10) | Secondary Stage Analysis begins | Member 1 | [ ] |
| Mar 23 (Week 11) | Fairness Audit Report due | Member 2 | [ ] |
| Mar 30 (Week 12) | Tertiary Stage Analysis begins | Member 2 | [ ] |
| Apr 6 (Week 13) | **Paper Draft 1 (Outline) Due** | All | [ ] |
| Apr 13 (Week 14) | **Paper Draft 2 (50%) Due** | All | [ ] |
| Apr 20 (Week 15) | **Paper Draft 3 (90%) Due** | All | [ ] |
| Apr 27 (Week 16) | **Final Paper Due (11:59pm)** | All | [ ] |
| Apr 27 (Week 16) | Peer evaluations due | All | [ ] |

---

## Contact Information for Team

| Member | Role | Email | Phone |
|--------|------|-------|-------|
| [Your Name] | Computational Biology Lead | [Your email] | [Your phone] |
| Peter Garcia | Statistical Analysis Lead | [Peter's email] | [Peter's phone] |
| Claire Marshall | Biological Integration Lead | [Claire's email] | [Claire's phone] |
| Nikhi Boggavarapu | Research Support | [Nikhi's email] | [Nikhi's phone] |

**Instructor:**  
Michael Osier  
Email: mvoscl@rit.edu  
Office: 08-1338  
Lab Meeting: Thursday 9:30-11:20am (Zoom)  

---

## Additional Resources

- **Course Syllabus:** BIOL550 myCourses (all requirements and grading details)
- **Tool Documentation:** FastQC, Bowtie2, Cufflinks, RSEM, SAMtools manuals online
- **Reference Papers:** Trapnell et al. (2012) Nature Protocols - primary methodology reference
- **Fairness Framework:** fairlearn documentation, disparate impact ratio formulas
- **GitHub Guide:** Basic Git commands and workflow for collaborative development

---

**This checklist ensures comprehensive team formation and successful project launch. Complete each section before submitting to Professor Osier. Good luck with your BIOL550 project! 🧬📊📄**
