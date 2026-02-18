# How BIOL550 × DSCI601 Integrates Your Prior Coursework
## Puzzle Plan Integration & Academic Coherence

---

## OVERVIEW: Your Three-Semester Arc

**Semester 1 (Fall 2024):** Foundation  
- BIO630: RNA structure prediction algorithms (Nussinov, energy minimization)
- ISTE780: Algorithmic fairness + learning systems
- IDAI700: Ethics framework (EQUITAS) + diagnostic justice

**Semester 2 (Spring 2025):** *Current* — Application & Integration  
- BIOL550: Bioinformatics methods + fairness audits (weekly)
- DSCI601: Applied data science capstone (proposal → model → report)
- **Shared project:** Fair RNA biomarker discovery pipeline

**Semester 3+ (Future):** Research & Publication  
- Research collaborations grounded in BIOL550 × DSCI601 results
- Potential publication (fairness-aware bioinformatics methodology)
- Community partnerships (CLD advocacy groups, clinicians in underserved regions)

---

## MAPPING: BIO630 → BIOL550

### What BIO630 Taught You

| BIO630 Topic | Result | BIOL550 Usage |
|---|---|---|
| **Nussinov Algorithm** | Implemented DP-based secondary structure prediction | Week 5: Apply to your 50+ candidate biomarkers; classify by complexity |
| **Energy Minimization (Zuker)** | Thermodynamic scoring for RNA stability | Week 10 baseline model: Compare Nussinov vs. EnergyMin on your data |
| **ViennaRNA Library** | Standard tool for structure prediction | Week 5 code: Use ViennaRNA to validate your Nussinov outputs |
| **Cross-Validation & Testing** | Validated on synthetic + biological RNAs | Week 8: Apply ICC stratified by subgroup to assess reproducibility |
| **Fairness-Aware Evaluation** | Bias audit framework (EQUITAS applied to algorithms) | Week 11: Run full disparate impact audit on preprocessing; use BIO630 methods |
| **Documentation & Reproducibility** | Code + paper submission standards | Week 13: Docker containerization follows BIO630 best practices |

### How BIOL550 Extends BIO630

**BIO630 was:** "Here's an algorithm and a fairness framework. Now evaluate it."

**BIOL550 is:** "Here are real RNA biomarkers from a disease study. Use BIO630's algorithms to extract features, audit for bias at every step, and hand off to DSCI601 with a fairness-validated feature set."

### Example: Week 5 (BIOL550) Directly Uses BIO630 Work

**In BIO630, you:**
- Implemented Nussinov algorithm
- Tested on tRNA, rRNA, miRNA, synthetic sequences
- Measured performance + fairness metrics

**In BIOL550 Week 5, you:**
- Apply ViennaRNA + your Nussinov implementation to **your actual biomarker candidates**
- Document structural complexity of each gene
- Create a "complexity filter" decision: Exclude transcripts if Boltzmann complexity exceeds reasonable bounds
- **Spine ledger:** "RNA structure filter: exclude transcripts with complexity > 95th percentile; rationale: unreliable measurement in high-complexity regions"
- This decision becomes part of your feature engineering pipeline

---

## MAPPING: ISTE780 → BIOL550 × DSCI601

### What ISTE780 Taught You

| ISTE780 Topic | Result | BIOL550 × DSCI601 Usage |
|---|---|---|
| **80 Rule & Disparate Impact** | Formula + interpretation | Week 11 (BIOL550): Calculate disparate impact for every preprocessing step |
| **Equalized Odds** | Fairness metric for classifiers | Week 11 (DSCI601): Define model fairness target (e.g., equalized odds < 0.05 difference) |
| **Cost-Sensitive Learning** | Weighted loss for minority groups | Week 12 (DSCI601): If baseline model fails fairness, apply cost-weighting during training |
| **Fairness-Aware Resampling** | SMOTE, undersampling, oversampling | Week 12 (BIOL550): Apply SMOTE *per ancestry group* to mimic clinical scenario |
| **Fairness Metrics Visualization** | ROC curves colored by protected attribute, calibration plots | Week 11 (BIOL550) + Week 11 (DSCI601): Create fairness dashboards; monitor metrics |
| **Case Study: Recidivism, Hiring, Medicine** | How algorithms fail real communities | Entire project: RNA biomarkers are your "real medicine" case; EQUITAS is the rubric |

### How BIOL550 × DSCI601 Operationalizes ISTE780

**ISTE780 was:** "Here are fairness metrics and mitigation strategies. Understand them conceptually."

**BIOL550 × DSCI601 is:** "Here's a real dataset. Measure disparate impact at every step (QC, normalization, feature selection, modeling). When you find violations, apply ISTE780 mitigation strategies and measure improvement."

### Example: Week 11–12 (BIOL550 + DSCI601) Directly Uses ISTE780 Work

**In ISTE780, you:**
- Learned disparate impact formula: DIR = (success rate for protected group) / (success rate for reference group)
- Learned 80 rule: DIR should be ≥ 0.80 for "no discrimination"
- Studied cost-sensitive learning, resampling, post-hoc calibration

**In BIOL550 Week 11, you:**
- Calculate disparate impact *of preprocessing itself*
  - Feature selection: Do genes retained by variance filtering differ by ancestry?
  - Normalization: Does CPM applied to all data erase rare transcripts more in minority ancestry?
  - Calculate: DIR = (# retained genes in minority ancestry) / (# retained genes in majority ancestry)
- **Findings:** Disparate impact = 0.35 (fails 80 rule); GC bias is a culprit
- **Spine ledger:** "Fairness baseline: preprocessing achieves 35% disparate impact ratio (fails 80 rule); target post-modeling = 100% compliance"

**In DSCI601 Week 12, you:**
- Train baseline model → measure classifier fairness
  - Sensitivity (recall for case prediction) differs by ancestry?
  - Positive predictive value (precision) differs?
  - Calibration (predicted probability vs. actual risk) differs?
- **Findings:** Model's equalized odds violation = 0.12 (fails)
- **Mitigation applied:** Cost-weight minority cases; retrain
- **Results:** Equalized odds now = 0.02 (passes); AUC drop = 1% (acceptable trade)
- **Documentation:** Ethics & fairness writeup explains which ISTE780 strategy was used and why

---

## MAPPING: IDAI700 → BIOL550 × DSCI601

### What IDAI700 Taught You

| IDAI700 Component | Result | BIOL550 × DSCI601 Integration |
|---|---|---|
| **EQUITAS Framework** | 4-pillar approach to enforceable equity (co-design, governance, civic literacy, trust as auditable) | **ENTIRE PROJECT** is an application of EQUITAS to bioinformatics |
| **Epistemic Injustice** | Diagnostic systems erase CLD individuals' lived experience | Week 1–14 (BIOL550): Every decision considers "Whose experience is invisible in this dataset?" |
| **Procedural Justice** | Decision-making power resides with those most affected | DSCI601 final report includes "Community advisory board recommendations" section (even if hypothetical) |
| **Community Co-Design** | Solutions designed *with* communities, not *for* them | Week 14 (BIOL550 capstone): Explain how preprocessing decisions could be vetted by patient advocacy groups |
| **Structural vs. Technical Bias** | Bias is institutional, not merely statistical | Week 11 (BIOL550 methods memo): Distinguish "preprocessing artifacts" (technical) from "representation gaps" (structural) |
| **Trust as Measurable Outcome** | Trust emerges from accountability & transparency, not sentiment | Week 13 (BIOL550): Docker + reproducible code + open GitHub = trust infrastructure |

### How BIOL550 × DSCI601 Operationalizes EQUITAS

**IDAI700 was:** "Write a 10-page argument for why EQUITAS is necessary + design a hypothetical framework."

**BIOL550 × DSCI601 is:** "Implement EQUITAS on real data. Show measurable progress toward enforceable equity."

### Example: Full Integration Across Semesters

#### **IDAI700 Argument (Yours)**
> "Diagnostic AI fails CLD adolescents because power to design/govern systems remains with institutions, not communities. EQUITAS operationalizes enforceable equity through (1) community advisory boards with veto authority, (2) binding governance + stage gates, (3) civic literacy so communities can audit systems."

#### **BIOL550 Week 1–14 Implements This**

**Component 1: Data Representation (Procedural Justice)**
- Week 1: Document patient demographics in dataset
- Spine ledger: "Data card must list N by ancestry, sex, age, site of care; identify underrepresented groups"
- Week 14 synthesis: "Our dataset is 60% European ancestry, 25% African ancestry, 15% other; analysis stratified to ensure minority groups' signal is visible"

**Component 2: Preprocessing Fairness (Structural Justice)**
- Week 2–4: Audit each preprocessing step for disparate impact
- Week 11: Baseline disparate impact = 0.35 (preprocessing erases minority-enriched genes)
- Week 12: Data augmentation + stratified scaling → disparate impact = 0.88 (partial improvement)
- Week 14 synthesis: "Explain why full equity requires downstream modeling (DSCI601), not just preprocessing"

**Component 3: Civic Literacy (Epistemic Justice)**
- Week 13: Create reproducible, documented code so external auditors can inspect it
- Week 14: Capstone includes "How a patient advocate would audit this pipeline" section
- Final GitHub release: CC-BY-4.0 license; invitation for community feedback

#### **DSCI601 Extends This**

**Component 4: Model Governance (Binding Fairness)**
- Ethics & fairness writeup includes "Rollback triggers":
  - If equalized odds > 0.10 in any subgroup, do not deploy; retrain with higher fairness weight
  - If calibration error > 0.15, flag for clinician review before use
- Spine ledger decision (DSCI601 equivalent): "Model deployment criteria: equalized odds < 0.05 across all ancestry groups; documented rollback plan if violated"

**Component 5: Trust as Infrastructure**
- GitHub repo is publicly auditable
- Data card + methods memos + fairness report are in `/docs/` folder
- Weekly decisions logged with reasoning → historical record of how equity was pursued
- Final report includes limitations section: "This model should not be used in populations not represented in training data; revalidation required"

---

## CONCRETE EXAMPLE: Your IDAI700 Puzzle Plan in Action

### Your IDAI700 Thesis

**"Diagnostic equity demands relational assessment, ecological contextualization, and community-partnered design. EQUITAS operationalizes this through co-design with decision authority, binding governance, and civic literacy."**

### How BIOL550 × DSCI601 Proves This

#### **Relational Assessment**
- BIOL550 Week 9: DE genes differ by ancestry → model must use ancestry-stratified features (relational = genes are meaningful only in context of ancestry)
- DSCI601 modeling: Separate models per ancestry group, then harmonized (relational = relationships matter)

#### **Ecological Contextualization**
- BIOL550 Week 2: Cross-mapping depends on reference genome quality (ecology = biological context matters)
- BIOL550 Week 3: Batch effects are site-specific (ecology = where measurement happens matters)
- BIOL550 Week 6: Missingness patterns differ by cohort quality (ecology = data collection context matters)

#### **Community-Partnered Design**
- BIOL550 Week 14 capstone includes: "How would a patient with lupus (or cancer) audit this pipeline? What controls would they demand?"
- DSCI601 ethics writeup includes: "If this were to be deployed, which communities must we partner with? What veto power must they have?"

#### **Result**
- Your IDAI700 argument (theory) + BIOL550 × DSCI601 implementation (practice) = **publishable contribution to fairness-aware bioinformatics**
- Three-semester arc: Concept → operationalization → evidence

---

## ALIGNMENT TABLE: How All 6 Courses Connect

| Dimension | BIO630 | ISTE780 | IDAI700 | BIOL550 | DSCI601 | Integration |
|---|---|---|---|---|---|---|
| **Algorithms** | ✓ RNA prediction | ✓ Fairness metrics | — | ✓ Apply to data | ✓ Baseline vs. improved | Single pipeline |
| **Fairness Framework** | ✓ EQUITAS bias audit | ✓ 80 rule, cost-weighting | ✓ EQUITAS blueprint | ✓ Weekly audit | ✓ Model-level audit | Every decision logged |
| **Data Practice** | ✓ Synthetic data | — | ✓ Real case (ED415 brief) | ✓ Real omics data | ✓ Real predictions | One shared dataset |
| **Documentation** | ✓ Code + paper | ✓ Fairness reports | ✓ Written argument | ✓ Weekly memos + code | ✓ Proposal + report | GitHub + docs/ |
| **Evaluation** | ✓ Cross-validation | ✓ Disparate impact | ✓ Ethical reasoning | ✓ Bias audit | ✓ Model fairness | Integrated metrics |
| **Capstone** | ✓ Phase 3 report | ✓ — | ✓ IDAI700 paper | ✓ BIOL550 presentation | ✓ DSCI601 report | Two capstones, one story |

---

## Timeline: How Courses Scaffold Each Other

```
FALL 2024 (BIO630, ISTE780, IDAI700)
├─ BIO630: Learn algorithms (Nussinov, EnergyMin, fairness-aware evaluation)
├─ ISTE780: Learn fairness metrics (80 rule, cost-weighting, causal inference)
└─ IDAI700: Learn ethics framework (EQUITAS, epistemic injustice, structural bias)

                          ↓

SPRING 2025 (BIOL550 × DSCI601)
├─ BIOL550 (Weeks 1–14):
│   ├─ Use BIO630 algorithms + ISTE780 metrics to audit preprocessing
│   ├─ Apply IDAI700's EQUITAS at every step
│   └─ Document all decisions → fairness ledger
│
└─ DSCI601 (Weeks 1–14):
    ├─ Use ISTE780 fairness metrics to constrain model training
    ├─ Apply IDAI700's procedural justice to governance section
    ├─ Integrate BIOL550's preprocessing insights into feature engineering
    └─ Final report demonstrates EQUITAS operationalized

                          ↓

FUTURE (Spring/Fall 2026+)
├─ Research collaboration: "Fairness-Aware Bioinformatics for Underserved Populations"
├─ Publication: Methods paper on EQUITAS in omics + ML
├─ Community partnership: Patient advisory board co-designs next iteration
└─ PhD applications: "I've implemented fairness-aware diagnostic algorithms in real healthcare data"
```

---

## Why This Three-Semester Arc Matters

### Progression of Rigor

| Phase | Question | Evidence | Rigor |
|---|---|---|---|
| **BIO630/ISTE780/IDAI700** | Can algorithms be fair? | Theoretical framework + toy data | Conceptual rigor |
| **BIOL550** | Is *this* dataset fair? | Disparate impact audit of preprocessing | Empirical rigor (biology) |
| **DSCI601** | Can *this* model be fair? | Model fairness metrics + mitigation results | Empirical rigor (data science) |
| **Integration** | Can fairness & performance coexist? | End-to-end pipeline with measurable equity improvement | Applied rigor |

### Progression of Scope

| Phase | Scope | Audience | Artifact |
|---|---|---|---|
| **BIO630** | 1 algorithm on synthetic data | Bioinformatics community | Technical paper (Phase 3) |
| **ISTE780** | Fairness metrics in ML systems | ML fairness community | Lecture + assignments |
| **IDAI700** | Diagnostic justice framework | AI ethics community | Thesis (EQUITAS) |
| **BIOL550** | Preprocessing pipeline on 1 real dataset | Biomedical researchers | Weekly memos + GitHub code |
| **DSCI601** | End-to-end modeling pipeline | Data science community | Capstone report + code |
| **Integration** | Fair diagnostic system for real patients | Clinicians + patient communities | Manuscript + open-source tool |

---

## Your Unique Contribution Across All Six Courses

By the end of BIOL550 × DSCI601, you will have demonstrated:

1. **Technical Excellence:** Implemented fairness-aware bioinformatics methods (BIO630 algorithms applied correctly).
2. **Fairness Rigor:** Measured disparate impact at every pipeline stage (ISTE780 metrics used correctly).
3. **Ethical Clarity:** Operationalized EQUITAS framework in practice (IDAI700 theory made real).
4. **Biological Depth:** Understood omics constraints and how they affect fairness (BIOL550 work).
5. **Data Science Maturity:** Built and evaluated a production-quality model (DSCI601 capstone).
6. **Integrated Thinking:** Showed that fairness, biology, and modeling are inseparable (puzzle plan cohesion).

---

## Recommended Presentation Order for End-of-Year Review

**If asked to present your 3-semester arc:**

1. **Start with IDAI700:** "I recognized that diagnostic systems erase CLD individuals. I developed EQUITAS as a framework for enforceable equity."
2. **Show BIO630:** "I learned algorithms and tested them on synthetic data. I added fairness audits to algorithm evaluation."
3. **Show ISTE780:** "I mastered fairness metrics. I learned how to measure disparate impact and apply mitigation strategies."
4. **Show BIOL550:** "I took a real omics dataset. Week by week, I audited preprocessing for bias and applied EQUITAS principles. Here's the disparate impact baseline."
5. **Show DSCI601:** "I built a model. I measured its fairness. I show that by using ISTE780 mitigation strategies on BIOL550's fair features, I achieved <2% AUC drop for equalized odds < 0.05."
6. **Close:** "This is EQUITAS in practice: technical excellence + structural justice in one reproducible pipeline."

---

## Key Takeaway

**Your three-semester arc is not three separate courses—it's one intellectual journey:**

- **BIO630 + ISTE780 + IDAI700** = Foundation (concepts)
- **BIOL550 × DSCI601** = Application (proof)
- **Future research** = Contribution (impact)

By integrating BIOL550 and DSCI601, you're not just taking two courses; you're **demonstrating that fairness-aware bioinformatics is possible, measurable, and reproducible.**

That's a story worth telling. 🧬📊✨

---

**Document prepared:** January 14, 2026  
**Status:** Ready for integration across all six courses  
**Next step:** Use this roadmap to structure BIOL550 & DSCI601; reference BIO630/ISTE780/IDAI700 work at every opportunity.
