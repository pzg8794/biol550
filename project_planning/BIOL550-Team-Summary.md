# BIOL550 Team Composition & Project Focus Summary
**January 26, 2026**

---

## Team Members & Role Assignments

**Project:** BIOL550 High Throughput Sequencing Analysis (Spring 2026)  
**Team Size:** 4 members (3-person configuration with advisor support)  
**Role Distribution:** Option A - Specialist Distribution Model

### Team Roster

**Member 1: Computational Biology Lead**
- **Name:** [Your Name]
- **Background:** Data and AI focus, bioinformatics experience
- **Primary Role:** Pipeline architecture, QC preprocessing, alignment/assembly execution
- **Key Responsibilities:** 
  - Lead Primary Stage Analysis (Weeks 6–8): Quality control and data preprocessing
  - Lead Secondary Stage Analysis (Weeks 10–11): Read alignment and assembly workflows
  - Develop and maintain reproducible computational pipeline
  - Manage version control and technical documentation
- **Deliverables:** Clean preprocessing scripts, alignment/assembly results, reproducible pipeline documentation

**Member 2: Statistical Analysis & Fairness Audit Lead**
- **Name:** Peter Garcia
- **Background:** Grad student in Data Science with experience in Computer Science
- **Primary Role:** Statistical methodology design, differential expression analysis, fairness metrics implementation
- **Key Responsibilities:**
  - Design and execute statistical analysis approaches for differential expression
  - Lead Tertiary Stage Analysis (Weeks 12–15): DE analysis and visualization
  - Implement fairness auditing and disparate impact metrics
  - Develop publication-quality visualizations and statistical summaries
  - Conduct multiple testing correction and validation protocols
- **Deliverables:** DE results with statistical support, fairness audit reports, visualization quality outputs

**Member 3: Biological Integration & Literature Lead**
- **Name:** Claire Marshall
- **Background:** BioTech and Bioinformatics expertise
- **Primary Role:** Biological interpretation, literature synthesis, pathway analysis
- **Key Responsibilities:**
  - Provide biological context throughout all analysis phases (Weeks 1–16)
  - Conduct comprehensive literature review (15+ primary sources)
  - Validate computational findings against biological knowledge
  - Design pathway analysis and functional interpretation
  - Lead biological writing (Introduction, Discussion sections)
- **Deliverables:** Literature synthesis, biological interpretation, publication-ready paper sections

**Member 4: Undergraduate Research Support**
- **Name:** Nikhi Boggavarapu
- **Background:** Undergraduate with coursework in relevant biology/bioinformatics
- **Primary Role:** Research support, data organization, lab report coordination
- **Key Responsibilities:**
  - Assist all team members with data organization and file management
  - Support QC analysis documentation (Member 1)
  - Contribute to literature review and background research (Member 3)
  - Participate in weekly team meetings and documentation
- **Deliverables:** Organized data structure, literature summaries, coordination support

---

## Projected Project Focus

### Analysis Strategy
We will employ a **three-phase hierarchical workflow** following the Trapnell protocol (TopHat/Cufflinks pipeline) aligned with BIOL550 course standards:

1. **Primary Stage (Weeks 6–8):** Quality control using FastQC, quality trimming (CutAdapt/FastX), adapter/contamination filtering
2. **Secondary Stage (Weeks 10–11):** Read alignment using Bowtie2/TopHat; BAM file generation and coverage analysis
3. **Tertiary Stage (Weeks 12–15):** Differential expression quantification (Cufflinks/RSEM), statistical analysis with multiple testing correction, visualization (volcano plots, heatmaps, pathway analysis)

### Dataset Selection
- Dataset selection target: **Real eukaryotic RNA-Seq or DNA-Seq dataset**
- Priority criteria:
  - Biological relevance to team interests
  - Sufficient data quality and size for rigorous analysis
  - Potential for meaningful biological discoveries
  - Published or publicly available (alignment with course requirements)

### Key Distinctive Features of Our Analysis

**Computational Rigor:** [Your Name] will ensure reproducible, well-documented pipelines with clear parameter documentation and troubleshooting logs.

**Statistical Rigor:** Peter Garcia will implement rigorous statistical methods with multiple testing correction (FDR/Bonferroni), fairness auditing for disparate impact analysis across biological groups, and validation protocols.

**Biological Integration:** Claire Marshall will connect computational results to biological significance through pathway analysis, literature integration, and functional interpretation.

**Collaborative Excellence:** Weekly team meetings (Thursdays post-workshop) with formal decision logging will ensure smooth data/analysis handoffs between phases and transparent resolution of technical decisions.

---

## Deliverables & Timeline

| Phase | Timeline | Lead | Deliverables | Points |
|-------|----------|------|--------------|--------|
| **Preparation** | Weeks 1–5 | All | Project selection, team sync, Trapnell practice | 30 pts |
| **Primary Analysis** | Weeks 6–8 | [Your Name] | QC analysis, clean reads, weekly reports | 30 pts |
| **Secondary Analysis** | Weeks 10–11 | [Your Name] | Aligned reads/contigs, metrics, fairness audit | 30 pts |
| **Tertiary Analysis** | Weeks 12–15 | Peter Garcia | DE results, visualizations, fairness reports | 30 pts |
| **Paper Development** | Weeks 13–16 | Claire Marshall (lead) | 3 drafts + final paper (30–50 pages, 15+ sources) | 30 pts |
| **Bonus Analyses** | Weeks 15–16 | All (distributed) | SNP calling, pathway networks, ML approaches | +20 pts |

**Final Deliverable:** Publication-quality research paper (30–50 pages, double-spaced) with comprehensive Methods, Results (with fairness metrics), biological Discussion, and 15+ primary sources.

---

## Coordination & Communication Plan

**Weekly Meetings:** Thursday 1–2 hours (post-workshop)
- Each member reports: accomplishments, blockers, next week's plan
- Data/code handoff coordination
- Technical decision documentation

**Decision Log:** GitHub-based tracking
- Analysis choices and rationale
- Role-specific contributions
- Fairness-related decisions and trade-offs

**Communication Channels:**
- GitHub repository for code, data, analysis scripts
- Email for status updates and scheduling
- myCourses discussion for course-wide collaboration
- Weekly lab reports (individual documentation)

---

## Alignment with BIOL550 Requirements

✓ **3-person team configuration** with specialist role distribution  
✓ **Clear role assignments** (Computational, Statistical, Biological)  
✓ **Trapnell protocol framework** (TopHat/Cufflinks pipeline)  
✓ **Three-phase analysis** (Primary → Secondary → Tertiary)  
✓ **Publication-quality paper** (30–50 pages, 15+ sources)  
✓ **Weekly lab reports** (individual, 3/4–2 pages each)  
✓ **Reproducible methodology** with full documentation  
✓ **Paper drafts** (Weeks 13, 14, 15 with color-coded contributions)  
✓ **Peer evaluations** (Week 10 & 16)  
✓ **Bonus analyses potential** (SNP calling, pathway networks, ML methods)

---

**Next Steps:**
1. Confirm team composition and role assignments with instructor (by Week 3)
2. Finalize dataset selection (by Week 3)
3. First team sync meeting to establish GitHub, communication protocols, decision log
4. Begin Trapnell protocol practice (Weeks 1–5)
