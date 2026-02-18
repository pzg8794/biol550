# BIOL550 × DSCI601: Integrated Academic & Work Strategy
## Executive Summary & Quick-Start Guide

**Date:** January 14, 2026 | **Status:** Ready for Semester Implementation  
**Author:** [You] | **Instructors:** BIOL550 + DSCI601 advisors

---

## THE CORE IDEA

**One shared project. Two complementary courses. Zero duplicate work.**

You will develop a single, semester-long **equitable bioinformatics diagnostic pipeline** that:
- Uses RNA/biomarker omics data to predict disease risk or clinical outcomes.
- Explicitly audits and mitigates algorithmic bias across populations (ancestry, care site, socioeconomic status).
- Demonstrates that fairness and performance can coexist—operationalizing your EQUITAS framework from IDAI700.

**BIOL550 grades:** Biological rigor, omics methods, preprocessing fairness audits, reproducibility.  
**DSCI601 grades:** Modeling excellence, fairness metrics, ethics integration, stakeholder communication.  
**Shared & jointly graded:** Data card, architecture memo, fairness assessment report, final GitHub repo.

---

## WHY THIS WORKS

| Dimension | Traditional Approach | This Strategy |
|---|---|---|
| **Scope** | Two separate projects → 8–10 weeks of overlapping work. | One project → each course focuses on its strength. |
| **Learning** | Siloed: biology in BIOL550, data science in DSCI601. | Integrated: methods feed modeling; fairness is woven throughout. |
| **Fairness** | Fairness grafted on at the end. | Fairness audited at every stage (preprocessing → model → evaluation). |
| **Burden** | Two capstones, two repos, two reports. | One repo, one narrative, two capstone presentations on *same* project. |
| **Authenticity** | Hypothetical omics dataset for coursework. | Real-world workflow: biology constraints → data science solutions. |

---

## THE PROJECT SPINE: "Fair RNA Biomarker Discovery"

### Research Question

**Biology:** How can we identify disease-relevant RNA biomarkers while ensuring prediction accuracy does *not* systematically vary across ancestry groups or care settings?

**Data Science:** Given an RNA expression dataset with protected attributes, how do we train a model that:
- Achieves strong predictive performance (AUC > 0.80)?
- Passes equalized odds fairness tests across ancestry?
- Includes a detailed fairness report with rollback triggers?

### Concrete Outputs

| Deliverable | Graded by | Description |
|---|---|---|
| **Data Card** | Both | 2–3 pages: source, preprocessing, bias audit, ethical considerations. |
| **Methods Memos** | BIOL550 | 14 weekly 1-pagers (W1–W14) + 1 synthesis (5–8 pages). |
| **GitHub Repo** | Both | Fully reproducible pipeline: preprocessing (BIOL550) + modeling (DSCI601). |
| **Architecture Memo** | Both | 2–3 pages: pipeline design, tool choices, fairness strategy. |
| **Fairness Report** | Both | 5–8 pages: disparate impact audit, bias mitigation results, limitations. |
| **Final Report** | DSCI601 | 12–15 pages: integrates all above + methods section leads with BIOL550 contributions. |

---

## BIOL550: 14-WEEK STRUCTURE

### Weekly Formula: Methods Memo + Coding + Spine Ledger Decision

Each week, you complete three short deliverables:

**A. Methods Memo (2 pages, 5 pts)**
- Summarize the week's omics method (e.g., read mapping, normalization, statistical testing).
- Identify 3–4 failure modes (ways bias or error can creep in).
- Connect explicitly to your Project Spine (e.g., "Our pipeline will include cross-mapping checks because of this week's learning").

**B. Coding Implementation (Functional code, 5 pts)**
- Reproduce or implement a toy version of that week's algorithm.
- E.g., Week 1: FASTQ parser + basic QC. Week 9: Limma-like DE test with ancestry stratification.
- All code goes to `/biol550/` folder on GitHub.

**C. Spine Ledger Update (One decision, 5 pts)**
- Log one permanent decision that improves your shared pipeline.
- E.g., "QC threshold: reads < Q20 removed." Or: "DE calling: stratified intercept per ancestry."
- All decisions tracked in `/biol550/spine_ledger.md`.

**Weekly subtotal: 15 points × 14 weeks = 210 points.**

### Week-by-Week Topics

| Week | Topic | Bias Mode(s) | Code Artifact | Spine Ledger Decision |
|---|---|---|---|---|
| 1 | Sequencing QC | GC bias, polymerase slippage | FASTQ parser + QC report | QC threshold: Q20 cutoff |
| 2 | Read mapping | Cross-mapping, reference bias | Dual-mapper toy (k-mer lookup) | Combined reference strategy |
| 3 | Normalization | Library size, batch effects | CPM + batch removal | Stratified CPM by cohort |
| 4 | Feature selection | Disparity in gene retention | Variance filtering audit | Fairness-aware threshold |
| 5 | RNA structure | Assay bias, structural complexity | Nussinov algorithm | Complexity filter for reliability |
| 6 | Missing data | Systematic dropout in low-abundance genes | KNN + MICE comparison | Zero-inflation model per subgroup |
| 7 | EDA & visualization | Subgroup visibility | UMAP + ancestry coloring | Mandatory demographic coloring |
| 8 | Reproducibility | Invisible batch effects | ICC calculation stratified by ancestry | Reproducibility check per subgroup |
| 9 | Statistical testing | Confounding adjustment bias | Limma-style DE with ancestry intercept | Stratified DE reporting |
| 10 | ML preprocessing | Scaling disparities | Robust scaling per ancestry | Stratified scaling protocol |
| 11 | Fairness audit baseline | Aggregate disparate impact | Disparate impact calculator | 80-rule compliance target |
| 12 | Bias mitigation | Augmentation & resampling | SMOTE stratified by ancestry | Fairness-aware augmentation |
| 13 | Reproducibility & docs | Auditability | Docker containerization | Reproducible environment pinning |
| 14 | Synthesis & capstone | Integration & storytelling | Final pipeline integration test | All decisions reviewed + linked |

### BIOL550 Final Grades

| Component | Weeks | Points | % |
|---|---|---|---|
| Weekly memos (A) + code (B) + ledger (C) | 1–14 | 210 | 52.5% |
| Midterm synthesis memo | 7 | 40 | 10% |
| Data card (joint, BIOL550 portion) | 10–13 | 50 | 12.5% |
| Architecture memo (joint, BIOL550 portion) | 13 | 50 | 12.5% |
| Final capstone presentation | 14 | 30 | 7.5% |
| Final code + README | 14 | 20 | 5% |
| **Total** | | **400** | **100%** |

---

## DSCI601: STANDARD PROJECT-BASED STRUCTURE

You form a team (1–2 people) and adopt the **Project Spine as your applied data science capstone.**

### Key Milestones (Approximate Weeks)

| Checkpoint | Week | Deliverable | Points | Connection to BIOL550 |
|---|---|---|---|---|
| Advisor meeting #1 | 2–3 | Feedback report + pitch | 15% | BIOL550 W1–W2 data |
| Preliminary proposal | 4 | 2–3 page proposal | 5% | Integrate W1–W4 methods |
| Related work survey | 6–7 | 5–8 page literature review | 10% | BIOL550 provides domain references |
| Advisor meeting #2 | 8 | Feedback report + code review | 15% | BIOL550 W1–W8 pipeline |
| Approach writeup | 9 | Feature engineering & model selection | 5% | Use BIOL550 W9–W11 insights |
| Architecture memo | 10 | Pipeline design (joint with BIOL550) | 5% | BIOL550 W13 reproducibility |
| Code review | 10 | Peer feedback on code | 5% | BIOL550 code reviewed |
| Ethics & fairness | 11 | Bias audit + mitigation strategies | 5% | BIOL550 W11–W12 audits |
| Endterm demo | 13 | 15-min live presentation | 7% | BIOL550 + DSCI601 in action |
| Final code | 13 | GitHub submission | 5% | Shared repo |
| Final report | 14 | 12–15 pages | 8% | Integrates all above |
| **Total** | | | **100%** | |

### How DSCI601 Integrates BIOL550 Work

- **Weeks 1–3:** Advisor-guided problem framing; incorporate BIOL550 W1–W2 data insights.
- **Weeks 4–6:** Proposal + literature review; BIOL550 methods memos provide domain references.
- **Weeks 7–9:** Feature engineering & modeling strategy; directly use BIOL550 W4–W10 fairness audits.
- **Weeks 10–12:** Build model; operationalize EQUITAS through fairness metrics (equalized odds, calibration).
- **Weeks 13–14:** Final demo + report; tell unified story of omics methods + fair modeling.

---

## SHARED DELIVERABLES (GRADED BY BOTH)

### 1. Data Card (2–3 pages)

**What:** Document your data source, preprocessing, bias risks, and ethical considerations.

**Content:**
- Source (dataset ID, N subjects, N genes).
- Demographic breakdown (ancestry, sex, age, site of care).
- Preprocessing steps with code references.
- Bias audit: disparate impact of preprocessing *by ancestry*.
- Limitations & ethical considerations.

**Timeline:** BIOL550 leads W1–W7; DSCI601 finalizes by W10.  
**Grading:** BIOL550 15%, DSCI601 10%.

### 2. Architecture Memo (2–3 pages + diagram)

**What:** High-level design of the end-to-end pipeline.

**Content:**
- Data flow diagram (raw → preprocessing → features → modeling → fairness eval → outputs).
- Key decision points & rationale (why this algorithm over that one?).
- Tool/framework choices (Python libraries, Docker, etc.).
- Deployment & sustainability plan.

**Timeline:** Weeks 10–12 (joint authorship).  
**Grading:** BIOL550 20%, DSCI601 15%.

### 3. Fairness Assessment Report (5–8 pages + visuals)

**What:** Comprehensive audit of algorithmic fairness across the entire pipeline.

**Content:**
- Fairness definition (disparate impact, equalized odds, calibration, etc.).
- Baseline fairness (from preprocessing, BIOL550 W1–W12).
- Model fairness (classifier performance, calibration *by ancestry*).
- Bias mitigation strategies applied (resampling, cost-weighting, post-hoc calibration).
- Before/after results (% improvement in disparate impact).
- Rollback triggers (if disparate impact > X%, stop; seek community review).
- Limitations.

**Timeline:** Weeks 9–12 (co-authored).  
**Grading:** BIOL550 15%, DSCI601 25%.

### 4. GitHub Repo

**What:** Fully reproducible, documented pipeline code.

**Structure:**
```
equitable-rna-biomarkers/
├── README.md (install, run example, expected outputs)
├── environment.yml (conda environment)
├── biol550/ (preprocessing, QC, normalization, feature selection, fairness audits)
├── dsci601/ (feature engineering, modeling, fairness evaluation)
├── data/ (raw, processed, data_card.md)
├── results/ (figures, metrics CSV)
└── .github/workflows/ (CI/CD tests)
```

**Timeline:** Ongoing (weeks 1–14), integration in W13–W14.  
**Grading:** BIOL550 20%, DSCI601 20%.

---

## MONTHLY SYNCHRONIZATION

**End of each month (4 times during semester):** 30-min sync call.

**Attendees:** BIOL550 instructor, DSCI601 advisor/instructor, you.

**Agenda:**
- Review completed methods memos & code artifacts.
- Check progress on fairness audits.
- Align on any design changes.
- Identify blockers (data access, compute resources, scope creep).

---

## GRADING TRANSPARENCY

| What | Graded by | When | Points | Notes |
|---|---|---|---|---|
| Weekly memos + code (BIOL550 only) | BIOL550 | Weekly | 210 (52.5%) | No DSCI601 grade; DSCI601 reads for context. |
| Midterm synthesis | BIOL550 | W7 | 40 (10%) | BIOL550 only. |
| Data card | Both | W10–W13 | 100 total (BIOL550: 50, DSCI601: 30) | Joint grading; both must sign off. |
| Architecture memo | Both | W10–W12 | 100 total (BIOL550: 50, DSCI601: 40) | Co-authored; both grade. |
| Fairness report | Both | W9–W12 | 150 total (BIOL550: 60, DSCI601: 100) | BIOL550 owns preprocessing audit; DSCI601 owns model audit. |
| Proposal + related work | DSCI601 | W4–W7 | 15 (DSCI601 only) | BIOL550 contributes domain references but not graded. |
| Approach + architecture | DSCI601 | W9–W10 | 10 (DSCI601 only) | BIOL550 contributes feature insights. |
| Code review | DSCI601 | W10 | 5 (DSCI601 only) | Peer feedback on code. |
| Ethics & fairness | DSCI601 | W11 | 5 (DSCI601 only) | Modeling-specific fairness writeup. |
| Final capstone presentation (BIOL550) | BIOL550 | W14 | 30 (7.5%) | BIOL550 only; 15–20 min narrative. |
| Endterm demo (DSCI601) | DSCI601 | W13 | 7 (DSCI601 only) | 15-min live demo (both course contributions). |
| Final report | DSCI601 | W14 | 8 (DSCI601 only) | 12–15 pages integrating all work. |
| Final code submission | Both | W13–W14 | BIOL550: 20, DSCI601: 5 | Shared GitHub repo. |
| **Total** | | | BIOL550: 400, DSCI601: 120 | Clear separation of grades. |

---

## EXAMPLE: HOW ONE BIOL550 WEEK FLOWS TO DSCI601

### Week 9 (BIOL550): Statistical Testing & Confounding

**BIOL550 produces:**
- Methods memo: "DE genes differ by ancestry; aggregated DE calls mask subgroup biomarkers."
- Code: Limma-style DE test with ancestry-stratified intercepts.
- Spine ledger: "DE calling protocol: stratified intercept per ancestry; results reported separately."

**DSCI601 receives (Weeks 10–11):**
- Uses BIOL550's stratified DE genes as features.
- Adds ancestry × gene interactions to model (preserving subgroup signal).
- In ethics writeup: "Following BIOL550's analysis, we include ancestry-stratified features to avoid aggregation bias."

**Result:** No redundancy. BIOL550 did fairness analysis once; DSCI601 operationalizes it in the model. ✨

---

## QUICK-START CHECKLIST

### Before Semester Starts
- [ ] GitHub repo created (template structure above).
- [ ] Data access confirmed (public dataset + IRB if needed).
- [ ] BIOL550 & DSCI601 instructors aligned on project scope & timeline.
- [ ] Monthly sync calendar scheduled (4 dates).

### Week 1
- [ ] GitHub repo ready with `/biol550/`, `/dsci601/`, `/data/`, `/docs/` folders.
- [ ] BIOL550 methods memo W1 + toy code pushed.
- [ ] DSCI601 advisor meeting held & first feedback report written.
- [ ] Spine ledger started with decision #1.

### Weeks 2–13
- [ ] Every Friday: BIOL550 pushes W[N] methods memo + code.
- [ ] Every Monday: DSCI601 reviews and plans W[N+1] features/modeling strategy.
- [ ] Monthly sync call (end of month 1, 2, 3, 4).

### Week 14
- [ ] All 14 BIOL550 methods memos + code complete.
- [ ] DSCI601 final report finished & submitted.
- [ ] Data card, architecture memo, fairness report finalized & signed by both instructors.
- [ ] GitHub repo cleaned up & documented.
- [ ] BIOL550 capstone presentation (15–20 min).
- [ ] DSCI601 endterm demo (already done W13) + final report submitted.

---

## HOW THIS MIRRORS YOUR IDAI700 SUCCESS

**IDAI700 asked:** "How can we design equitable diagnostic AI?"  
**Your answer:** EQUITAS framework (community co-design, binding governance, civic literacy).

**BIOL550 × DSCI601 asks:** "How do we *implement* equitable diagnostic AI in a real omics pipeline?"  
**Your answer:** Apply EQUITAS weekly—audit preprocessing fairness, measure model disparate impact, iterate toward perfect demographic parity.

**The connection:**
- IDAI700: Theory (EQUITAS) + written argument.
- BIOL550 × DSCI601: Practice (EQUITAS applied) + code + results.

---

## SUCCESS METRICS (End of Semester)

You have succeeded if:

1. ✅ **GitHub repo is fully functional:** Anyone can clone, follow README, and reproduce your results on the example data.
2. ✅ **Fairness is documented:** Disparate impact *before* preprocessing, *after* preprocessing, *after* modeling; you explain every drop in disparate impact.
3. ✅ **Both courses are integrated:** DSCI601's final report explicitly references BIOL550 methods memos; BIOL550's capstone explains how biology feeds modeling.
4. ✅ **You can tell a unified story:** In one hour, you explain the entire pipeline to a biologist, a data scientist, a clinician, and a patient advocate. Each walks away understanding their role in the fairness story.

---

## CONTACT & SUPPORT

**Questions during the semester?**
- BIOL550 methods: Contact BIOL550 instructor.
- DSCI601 modeling: Contact DSCI601 advisor.
- Integration/logistics: Raise in monthly sync call.

**If scope changes:**
- Pivot by Week 3 if needed (e.g., different dataset).
- Adjust weekly topics to match actual BIOL550 syllabus.
- Keep fairness & reproducibility as non-negotiable pillars.

---

## FINAL THOUGHTS

This strategy **honors your intellectual development** over the past year:
- IDAI700 taught you to identify injustice.
- ISTE780 taught you to measure it.
- BIO630 taught you the algorithms.
- **BIOL550 × DSCI601 teaches you to *fix* it.**

You're not just building a capstone. You're building proof that fairness and technical excellence are not trade-offs—they are *requirements* for responsible science.

Good luck. 🧬📊✨

---

**Document Version:** 1.0 | **Last Updated:** January 14, 2026 | **Status:** Ready for Implementation
