# BIOL550 × DSCI601: Week-by-Week Course Integration Map
## Where BIO630, ISTE780, IDAI700 Explicitly Integrate

---

## JANUARY: FOUNDATION & FRAMEWORK

### **WEEK 1: Sequencing QC**

| Course Integration | What to Explicitly Reference | Deliverable |
|---|---|---|
| **IDAI700** | "Procedural justice: Who's represented in this data?" | Data card: Demographics table + gaps |
| **IDAI700** | "Epistemic justice: Whose experience might be missing?" | Methods memo Q: "Which populations are underrepresented?" |
| **Quantum MAB** | "Baseline uncertainty: What don't we know about fairness?" | Spine ledger: "Baseline fairness = unknown; we measure today" |

**Methods Memo Framing:**
```
"Drawing on IDAI700's concept of epistemic justice, we ask:
What does the raw data tell us about representation?
Are certain populations missing entirely? Underrepresented?
This QC step is not neutral—it's an equity decision point."
```

---

### **WEEK 2: Read Mapping**

| Course Integration | What to Explicitly Reference | Deliverable |
|---|---|---|
| **BIO630** | "Cross-mapping bias: We learned this in BIO630 Week 3" | Methods memo: "Cross-mapping is a known bias; auditing now" |
| **ISTE780** | "Adversarial scenario: Misalignment acts like an attacker" | Spine ledger: "Disparate impact of cross-mapping: DI = 0.42" |
| **Quantum MAB** | "Adversarial interference: Misalignment = malicious edge perturbation" | Code: Measure mapping accuracy by ancestry |

**Methods Memo Framing:**
```
"In BIO630, we learned dual RNA-Seq mapping strategies and their pitfalls.
Here, we quantify how cross-mapping bias differs by ancestry.
Using ISTE780 framework: Does mapping success rate differ by group?
(This is disparate impact in the infrastructure layer.)"
```

---

### **WEEK 3: Batch Correction & Normalization**

| Course Integration | What to Explicitly Reference | Deliverable |
|---|---|---|
| **BIO630** | "Alignment robustness: Normalization must preserve signal" | Methods memo: "Like alignment validation, normalization validation" |
| **IDAI700** | "Structural bias: Global normalization erases minority signals" | Spine ledger decision: "Stratified vs. global normalization—which is fair?" |
| **ISTE780** | "Cost-weighted learning: Different groups need different scaling" | Code: Implement ancestry-stratified normalization |

**Methods Memo Framing:**
```
"IDAI700 teaches us: structural bias is institutional. Batch correction is a case study.
Global batch correction perpetuates the assumption that all sites/populations are equivalent.
We apply ISTE780's fairness lens: Does normalization erase rare, ancestry-specific transcripts?
(This is structural justice in preprocessing.)"
```

**Spine Ledger Entry Example:**
```
Decision: Ancestry-stratified batch correction (ComBat per ancestry group)
Rationale: BIO630 showed normalization can obscure biological signal.
          IDAI700 shows global methods perpetuate structural bias.
          ISTE780: DI for rare genes pre-correction = 0.50; 
          post-global = 0.30 (worse); post-stratified = 0.75 (better)
Fairness Impact: Stratified approach preserves minority-enriched gene signal
Trade-off: Slightly higher residual batch effect, but fairer
GitHub commit: /biol550/week3_stratified_batch_correction.py
```

---

### **WEEK 4: Feature Selection**

| Course Integration | What to Explicitly Reference | Deliverable |
|---|---|---|
| **ISTE780** | "80 Rule: Does feature retention differ by ancestry?" | Methods memo: Apply 80 Rule to feature selection DI |
| **BIO630** | "Algorithm robustness: Are selected features robust across populations?" | Code: Validate feature stability by ancestry group |
| **Quantum MAB** | "Multi-objective: Accuracy vs. fairness in feature selection" | Spine ledger: "Accept X% fewer features to improve fairness" |

**Methods Memo Framing:**
```
"ISTE780 Phase 2 teaches the 80 Rule: Disparate impact ratio ≥ 0.80.
We apply this to RNA feature selection.
When filtering genes by variance, do minority-enriched genes survive?
DI of feature retention = (minority genes retained) / (majority genes retained)
BIO630 validation: Are the selected features robust to misalignment/batch?
ISTE780 question: Is feature selection fair to all populations?
(This is algorithmic fairness in feature engineering.)"
```

---

## FEBRUARY: SYNTHESIS & SCALE

### **WEEK 5: RNA Structure Prediction**

| Course Integration | What to Explicitly Reference | Deliverable |
|---|---|---|
| **BIO630** | "Nussinov algorithm from BIO630 Phase 3; now apply to real data" | Code: Import/reference BIO630 Nussinov implementation |
| **IDAI700** | "Structural complexity as proxy for measurement difficulty; fairness risk?" | Methods memo: "Does complexity differ by ancestry?" |
| **Quantum MAB** | "Uncertainty: Structured vs. unstructured transcripts have different measurement noise" | Spine ledger: "Complexity filter decision impacts fairness" |

**Methods Memo Framing:**
```
"In BIO630, we validated Nussinov algorithm on synthetic datasets.
Here, we apply it to real biomarkers, asking a fairness question:
Does secondary structure complexity vary by ancestry?
If so, does using complexity as a filter erase minority-specific regulation?

IDAI700 lens: Complexity is not neutral. Structured regions may be easier to measure
in well-resourced labs; unstructured regions in minority populations may be missed.
(This is epistemic injustice through measurement bias.)"
```

**Key Addition to Spine Ledger:**
```
Decision: Ancestry-stratified complexity filtering
Rationale: BIO630 Nussinov validated; IDAI700 shows bias risk;
          Measure: Does complexity distribution differ by ancestry? YES
Fairness Impact: Filtering by global complexity threshold disproportionately
                removes minority-enriched unstructured transcripts
Mitigation: Use ancestry-specific complexity thresholds
Result: Disparate impact improves from 0.65 to 0.82
GitHub: /biol550/week5_fairness_aware_rna_structure.py
```

---

### **WEEK 6: Missing Data & Imputation**

| Course Integration | What to Explicitly Reference | Deliverable |
|---|---|---|
| **Quantum MAB** | "Unobserved rewards: Missing data is like incomplete information" | Methods memo: "Missingness patterns reflect data collection equity" |
| **IDAI700** | "Epistemic injustice: Whose biological signal is missing?" | Code: Analyze missingness patterns by ancestry |
| **ISTE780** | "Cost-weighted imputation: Different groups need different strategies" | Spine ledger: "Use ancestry-stratified imputation" |

**Methods Memo Framing:**
```
"Missing data is not random. IDAI700 asks: Who is missing from the data?
Whose biological signal is unobserved?

Missingness pattern analysis reveals:
  - Ancestry Group A: 5% missing (well-sequenced)
  - Ancestry Group B: 25% missing (underfunded sites)
  
ISTE780 approach: Use ancestry-stratified multiple imputation.
Quantum MAB framing: Missing data is uncertainty that varies by population.
(This is structural injustice in data collection.)"
```

---

### **WEEK 7: EDA & Visualization (MIDTERM SYNTHESIS)**

| Course Integration | What to Explicitly Reference | Deliverable |
|---|---|---|
| **IDAI700** | "Civic literacy: Visualizations must show disparities clearly" | Memos 1–7: Synthesis showing fairness narrative |
| **BIO630** | "Validation: Are algorithms robust across populations?" | Capstone draft: "W1–W7 validated fairness concerns" |
| **ISTE780** | "Fairness dashboard: Disparate impact at each stage" | Visualization: DI trajectory across preprocessing steps |

**Midterm Synthesis Memo Framework:**
```
"Weeks 1–7: Building Fairness Awareness

W1: QC revealed representation gaps (IDAI700 procedural justice)
W2: Mapping showed DI = 0.42 (ISTE780 metric)
W3: Batch correction choice: global vs. stratified (IDAI700 structural justice)
W4: Feature selection DI = 0.65 (ISTE780 80 rule)
W5: Complexity filtering impacts fairness (BIO630 + IDAI700)
W6: Missingness is inequitable (IDAI700 epistemic justice)
W7: Cumulative DI = 0.45 (still failing 80 rule)

Next: Weeks 8–12 will implement mitigations."
```

---

### **WEEK 8: Reproducibility & Cross-Validation**

| Course Integration | What to Explicitly Reference | Deliverable |
|---|---|---|
| **BIO630** | "Validation rigor: ICC stratified by population" | Code: Measure reproducibility per ancestry group |
| **IDAI700** | "Civic literacy: Code must be auditable" | Methods memo: "Why reproducible code = fairness infrastructure" |
| **ISTE780** | "Robustness: Does fairness hold in cross-validation?" | Spine ledger: "Stratified cross-validation required" |

---

## MARCH: ADVANCED FAIRNESS & MITIGATION

### **WEEK 9: Statistical Testing & Confounding**

| Course Integration | What to Explicitly Reference | Deliverable |
|---|---|---|
| **BIO630** | "Alignment robustness: Confounding can mask differential effects" | Methods memo: "DE testing with ancestry as factor, not confounder" |
| **ISTE780** | "Stratified evaluation: Statistical significance by group" | Code: Report p-values separately for each ancestry |
| **Quantum MAB** | "Contextual arms: Ancestry is context, not noise" | Spine ledger: "Explicit ancestry stratification in all tests" |

---

### **WEEK 10: ML Preprocessing & Feature Engineering**

| Course Integration | What to Explicitly Reference | Deliverable |
|---|---|---|
| **BIO630** | "All algorithms from Weeks 1–9 now feed into DSCI601" | Methods memo: "Preprocessing pipeline documented for DSCI601" |
| **ISTE780** | "Preprocessing DI baseline before model training" | Shared Architecture Memo: "BIOL550 fairness → DSCI601 constraints" |
| **IDAI700** | "Co-design: How would a patient audit this preprocessing?" | Data card finalization: "What decisions would affect patients?" |

**Shared Architecture Memo (BIOL550 + DSCI601):**
```
"BIOL550 (Weeks 1–10) creates fair preprocessing.
DSCI601 (Weeks 1–10) prepares to model those fair features.

Fairness checkpoints:
  ✓ W4: Feature selection DI
  ✓ W5: Complexity filtering DI
  ✓ W6: Imputation strategy DI
  ✓ W10: ML preprocessing DI baseline = 0.62
  
DSCI601 constraint: 'Model must improve DI to ≥ 0.80'
(ISTE780 80 Rule target)"
```

---

### **WEEK 11: MAJOR INTEGRATION MILESTONE—Fairness Audit Baseline**

| Course Integration | What to Explicitly Reference | Deliverable |
|---|---|---|
| **ISTE780** | "Full fairness metrics: Disparate Impact, Equalized Odds, Calibration" | BIOL550 Fairness Audit Report (5 pages) |
| **IDAI700** | "EQUITAS Principle 1–2: Procedural & structural justice assessment" | Governance section: "Binding fairness criteria" |
| **BIO630** | "Algorithm complexity: How does Nussinov/alignment robustness affect fairness?" | Appendix A: BIO630 algorithm performance by ancestry |

**BIOL550 Week 11 Methods Memo (CRITICAL):**
```
"OPERATIONALIZING ISTE780 IN BIOINFORMATICS"

Section 1: Disparate Impact (ISTE780 80 Rule)
  - Feature retention by ancestry: DIR = 0.62 (FAILS 80 rule)
  - Why: Global filtering removes minority-enriched genes
  - ISTE780 solution: Stratified feature selection

Section 2: Equalized Odds (ISTE780 Phase 2)
  - Measurement success rate by ancestry: 0.95 vs 0.68 (FAILS equalized odds)
  - Why: Batch effects compound for minority samples
  - ISTE780 solution: Ancestry-stratified batch correction

Section 3: Governance (EQUITAS)
  - IDAI700 asks: What decisions trigger model rollback?
  - Proposed: If baseline fairness DI < 0.80, cannot proceed to DSCI601
  - This is BINDING, not advisory

Section 4: Limitations
  - BIO630 robustness: Algorithm fails on rare transcript structures
  - IDAI700 awareness: We cannot guarantee fairness in populations not represented
```

**DSCI601 Parallel (Week 11 Ethics & Fairness Writeup):**
```
"TRANSLATING BIOL550 FAIRNESS TO MODELING CONSTRAINTS"

Section 1: Preprocessing Fairness (from BIOL550 W11)
  - BIOL550 achieved DI = 0.62 after W1–10 mitigations
  - ISTE780 target: DI ≥ 0.80
  - Gap: 18 percentage points

Section 2: Model-Level Fairness (DSCI601 contribution)
  - Baseline classifier: AUC = 0.92, Equalized Odds gap = 0.15 (FAILS)
  - ISTE780 mitigation #1: Cost-weight minority class
  - ISTE780 mitigation #2: Stratified cross-validation
  - Result: AUC = 0.90, EO gap = 0.03 (PASSES)
  - Trade-off: 2% AUC for fairness (acceptable)

Section 3: Governance & Rollback
  - Binding criteria: If EO gap > 0.05, do not deploy
  - EQUITAS implementation: Rollback triggers, re-training protocol
  - Community audit: Governance doc in GitHub /docs/GOVERNANCE.md
```

---

### **WEEK 12: Bias Mitigation & Data Augmentation**

| Course Integration | What to Explicitly Reference | Deliverable |
|---|---|---|
| **ISTE780** | "Phase 3: Cost-weighting, resampling, post-hoc calibration" | Mitigation strategies tested (SMOTE, fairness resampling) |
| **BIO630** | "Algorithm robustness: Does augmentation preserve biological validity?" | Methods memo: "How augmentation respects BIO630 signal" |
| **IDAI700** | "Structural justice: Augmentation should not erase minority signature" | Spine ledger: "Fairness-aware SMOTE per ancestry" |

**BIOL550 Week 12 + DSCI601 Week 12 Parallel Work:**
```
BIOL550: Data augmentation with fairness lens
├─ Standard SMOTE fails: Creates unnatural samples in high-dimensional space
├─ Fairness-aware SMOTE: Generate new samples within ancestry groups
├─ Result: DI improves from 0.62 to 0.88 (PASSES 80 rule)
└─ ISTE780 validation: Measure performance post-augmentation

DSCI601: Model retraining with fair features + fairness constraints
├─ Input: BIOL550's augmented data (DI = 0.88)
├─ Model: Neural network with fairness regularizer (ISTE780)
├─ Output: AUC = 0.90, EO gap = 0.02 (PASSES)
└─ Governance: Deployment approved by fairness criteria
```

---

### **WEEK 13: Reproducibility & Civic Literacy**

| Course Integration | What to Explicitly Reference | Deliverable |
|---|---|---|
| **IDAI700** | "Civic literacy: Code must be auditable by non-experts" | Docker setup + README explaining preprocessing + fairness decisions |
| **BIO630** | "Algorithm documentation: Why we chose Nussinov over alternatives?" | /docs/BIO630_APPLICATION.md explaining algorithmic choices |
| **ISTE780** | "Fairness transparency: Dashboard showing metrics at each stage" | /docs/FAIRNESS_DASHBOARD.md with visualizations |

**Documentation to Create:**
```
/docs/
├─ BIO630_APPLICATION.md
│   └─ "Why Nussinov? How do Weeks 5, 10 extend BIO630 Phase 3?"
├─ ISTE780_OPERATIONALIZATION.md
│   └─ "How Weeks 4, 11, 12 implement ISTE780 fairness metrics & mitigation"
├─ EQUITAS_OPERATIONALIZATION.md
│   └─ "How all 14 weeks reflect IDAI700's 4 EQUITAS principles"
├─ FAIRNESS_DASHBOARD.md
│   └─ Visualizations of DI trajectory (W1–W14)
├─ DATA_CARD.md
│   └─ "Who's represented? Whose experience is invisible?"
└─ GOVERNANCE.md
    └─ "Binding fairness criteria; rollback triggers; audit trail"
```

---

## APRIL: CAPSTONES & INTEGRATION PROOF

### **WEEK 13: BIOL550 Capstone Presentation**

**How to Frame:**
```
"Three-Semester Arc: From Foundational Frameworks to Integrated Research"

Slide 1: Title
"Quantum-Inspired Fair RNA Biomarker Discovery: 
Integrating BIO630, ISTE780, IDAI700 into Bioinformatics Practice"

Slide 2: BIO630 Foundation
├─ "We learned Nussinov algorithm (accurate but not auditable for fairness)"
├─ "We learned alignment robustness matters"
└─ "Question: Are these algorithms fair? Let's find out."

Slide 3: ISTE780 Fairness Lens
├─ "We learned disparate impact (80 Rule), equalized odds, cost-weighting"
├─ "Application: Measure if preprocessing respects all populations"
└─ "Finding: Standard QC has DI = 0.35 (fails fairness)"

Slide 4: IDAI700 Justice Commitment
├─ "We committed to EQUITAS: procedural justice, structural accountability"
├─ "Application: Every preprocessing decision ask 'Whose signal might be erased?'"
└─ "Outcome: 14 weeks of fairness-aware decision-making"

Slide 5–8: Results
├─ DI trajectory (0.35 → 0.88)
├─ BIOL550 fair features ready for DSCI601
├─ GitHub reproducible infrastructure
└─ Methods paper in progress

Slide 9: Closing
"This project proves that fairness is not a layer on top of bioinformatics.
It's foundational. When we integrate BIO630's algorithms with ISTE780's 
metrics and IDAI700's justice framework, we get better science AND equity."
```

---

### **WEEK 14: DSCI601 Final Report**

**How to Frame Methods Section:**
```
"Methods: Building on Three Semesters of Frameworks

3.1 Preprocessing Pipeline (BIOL550, grounded in BIO630 + ISTE780 + IDAI700)
   From BIO630: Applied Nussinov algorithm for secondary structure...
   From ISTE780: Measured disparate impact at each stage (80 Rule)...
   From IDAI700: Ensured structural justice (ancestry-stratified filtering)...
   
3.2 Fair Feature Engineering (BIOL550 Weeks 10–12)
   Input: Preprocessed features with DI = 0.88 (fairness validated)
   Method: Standard ML preprocessing (scaling, PCA, feature selection)
   Fairness constraint: Accept only features that maintain DI ≥ 0.80
   
3.3 Fair Model Training (DSCI601 Weeks 9–12)
   From ISTE780 Phase 3: Apply cost-weighting to minority class
   From IDAI700: Report fairness as primary outcome (not secondary)
   Result: AUC = 0.90, Equalized Odds gap = 0.02
   
3.4 Governance & Deployment (DSCI601 Weeks 11–14, IDAI700 operationalized)
   From IDAI700 EQUITAS: Binding fairness criteria, not optional
   Deployment trigger: EO gap < 0.05 AND DI > 0.80
   Rollback protocol: If fairness violated in new data, pause deployment
```

---

## INTEGRATION VERIFICATION CHECKLIST

By Week 14, verify you've integrated each prior course:

### **BIO630 Integration** ✓
- [ ] Week 5 methods memo explicitly extends BIO630 Nussinov to fairness context
- [ ] Week 3 methods memo references BIO630 alignment robustness work
- [ ] Week 10 methods memo explains how BIO630 algorithms feed DSCI601
- [ ] `/docs/BIO630_APPLICATION.md` explains the connection
- [ ] Capstone presentation: "BIO630 foundation + fairness question = novel contribution"

### **ISTE780 Integration** ✓
- [ ] Week 4 methods memo calculates 80 Rule DI
- [ ] Week 11 methods memo implements full ISTE780 fairness audit
- [ ] DSCI601 Week 11: Ethics writeup applies ISTE780 Phase 3 mitigations
- [ ] `/docs/ISTE780_OPERATIONALIZATION.md` documents the operationalization
- [ ] Final report: "ISTE780 metrics measured at every step"

### **IDAI700 Integration** ✓
- [ ] Week 1 data card reflects procedural justice (who's represented?)
- [ ] Weeks 2–10 spine ledger entries ask "Where is structural bias?"
- [ ] Week 11 governance section implements EQUITAS binding criteria
- [ ] Week 13 GitHub infrastructure enables civic literacy (auditable code)
- [ ] `/docs/EQUITAS_OPERATIONALIZATION.md` maps all 14 weeks to IDAI700 principles
- [ ] Final report: "EQUITAS operationalized through integrated bioinformatics"

### **Quantum MAB Integration** ✓
- [ ] Each week's failure modes framed as adversarial, uncertain, volatile challenges
- [ ] Methods memo: "Batch effects = intelligent adversaries; we build robustness"
- [ ] Spine ledger: "Decisions balance efficiency (accuracy) with robustness (fairness)"
- [ ] Capstone: "Quantum-inspired fair decision-making in bioinformatics"

---

## FINAL SUMMARY

**NOT:** "I took these courses and now I'm taking others"  
**BUT:** "I built an integrated 3-semester research project where each course deepened the others"

- **BIO630** gave you algorithms
- **ISTE780** gave you fairness metrics
- **IDAI700** gave you justice framework
- **Quantum MAB** gave you systems thinking under adversarial conditions
- **BIOL550 × DSCI601** = proof that these frameworks work together

**By April 14, 2026, you'll have one coherent research narrative spanning three semesters, grounded in real data, aimed at PhD success.**

That's not just coursework. That's a dissertation pilot. 🚀

---

**Ready to integrate? Start with Week 1 memo (IDAI700), Week 2 memo (BIO630), Week 3 memo (IDAI700), Week 4 memo (ISTE780), Week 5 memo (BIO630 + IDAI700)...**

**Build the narrative. Make it coherent. Make it count.** 🧬 📊 ✨

