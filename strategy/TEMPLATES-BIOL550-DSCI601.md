# BIOL550 TEMPLATES: Copy & Use Every Week
## Template Bundle for 14-Week Project

---

## TEMPLATE 1: BIOL550 Weekly Methods Memo
**Use:** Every BIOL550 week (copy this, fill in blanks, submit)  
**Length:** 2–3 pages  
**Format:** Markdown (.md file)  
**File Name:** `biol550/methods_memos/Week_[N]_[Topic].md`

---

```markdown
# Methods Memo: Week [N] — [Topic Name]

## Summary
[2–3 sentences describing the bioinformatics method]

### Example:
"This week we learn read mapping, which aligns sequencing reads to a reference genome.
We examine both standard approaches (global vs. local) and their effects on data 
quality. We then quantify how mapping quality differs across ancestry groups."

---

## Quantum MAB Connection
**This method addresses:** [Pick ONE: Uncertainty / Adversarial Interference / Volatility / Multi-objective]

### Example:
"Read mapping creates disparate impact in the ADVERSARIAL sense: standard algorithms 
misalign reads from minority ancestries due to genetic diversity not represented in the 
reference. This is like an intelligent adversary exploiting the algorithm."

---

## Failure Modes & Mitigation

**Failure Mode 1:** [Technical failure or bias risk]
- **Why it happens:** [Root cause]
- **Impact:** [Fairness risk: DI, equity gap, etc.]
- **Mitigation:** [Your proposed solution]
- **Reference:** [BIO630? ISTE780? IDAI700?]

**Example:**
- **Failure Mode:** Cross-mapping bias
  - Why: Reads from minority-ancestry genomes don't match reference as well
  - Impact: Alignment rate = 98% for ref ancestry, 68% for minority (DI = 0.69, FAILS 80 rule)
  - Mitigation: Use ancestry-stratified reference genomes for alignment
  - Reference: BIO630 Week 3 taught cross-mapping; ISTE780 Week X taught 80 rule

**Failure Mode 2:** [Second technical/fairness failure]
- [Same structure as above]

**Failure Mode 3:** [Third technical/fairness failure]
- [Same structure as above]

---

## Fairness Impact

**Baseline (before mitigation):**
- [Metric]: [Baseline value]
- [Why this metric matters]: [Fairness concern it addresses]

**Expected After Mitigation:**
- [Metric]: [Target value]
- [Expected improvement]: [X percentage points]

**Trade-off:**
- [What do we give up for fairness?]
- [Is the trade-off acceptable?]

### Example:
**Baseline:**
- Alignment rate DI = 0.69 (global reference)
- This fails the ISTE780 80 Rule (need ≥ 0.80)
- Why it matters: Differential alignment error between groups means some ancestries lose signal

**Expected After Mitigation:**
- Alignment rate DI = 0.88 (ancestry-stratified reference)
- This PASSES the 80 Rule
- Expected improvement: +19 percentage points

**Trade-off:**
- Computational cost increases (need multiple reference genomes)
- Is it worth it? YES—fairness to all populations is foundational

---

## Code Artifact
**File:** [Link to code file in `/biol550/preprocessing/`]

### Code Checklist:
- [ ] Code is functional (runs without errors)
- [ ] Code is commented (explain why, not just what)
- [ ] Code outputs fairness metric (e.g., DI by ancestry group)
- [ ] Output includes visualization (histogram or table of disparate impact)

### Example:
```python
# File: biol550/week2_mapping.py
# Calculates disparate impact of read mapping by ancestry

def mapping_quality_by_ancestry(mapped_reads, ancestry_labels):
    """
    Compute alignment success rate per ancestry group.
    Return disparate impact ratio.
    """
    di_dict = {}
    for ancestry in set(ancestry_labels):
        mask = ancestry_labels == ancestry
        success_rate = (mapped_reads[mask] > 0).mean()
        di_dict[ancestry] = success_rate
    
    # Disparate impact: min / max
    di = min(di_dict.values()) / max(di_dict.values())
    return di, di_dict

# Example output:
# Ancestry A: 98% alignment success
# Ancestry B: 68% alignment success
# DI = 68/98 = 0.69 (FAILS 80 rule)
```

---

## Spine Ledger Entry
**Add to:** `biol550/spine_ledger.md` at end of week

### Template:
```
## Week [N]: [Topic]
- **Decision:** [What did you decide?]
- **Rationale:** [Why? Reference BIO630/ISTE780/IDAI700? Cite failure modes?]
- **Fairness Impact:** [Baseline metric] → [Improved metric] (DI, EO, etc.)
- **Trade-off:** [What are we accepting?]
- **GitHub:** [Link to code] - `biol550/preprocessing/week[N]_*.py`
- **Status:** ✓ Implemented ([Date])
```

### Example:
```
## Week 2: Read Mapping
- **Decision:** Use ancestry-stratified reference genomes instead of single global reference
- **Rationale:** Cross-mapping bias (learned in BIO630 W3) disproportionately affects 
  minority ancestries. Standard alignment has DI = 0.69 (fails ISTE780 80 rule).
  Ancestry-stratified approach respects genetic diversity (IDAI700 procedural justice).
- **Fairness Impact:** Alignment success rate DI improves from 0.69 to 0.88
- **Trade-off:** Computational cost ~2× (3 alignments instead of 1), but fairness is essential
- **GitHub:** `biol550/preprocessing/week2_mapping.py`
- **Status:** ✓ Implemented (Jan 22, 2026)
```

---

## Key Takeaway for DSCI601
[1–2 sentences on how this finding shapes feature engineering or modeling]

### Example:
"Read mapping disparate impact means some ancestry groups have systematically lower 
coverage at certain genomic regions. DSCI601 must use ancestry-stratified feature 
selection to avoid inheriting this bias."

---

## Questions to Ask Yourself Before Submitting

- [ ] Did I explicitly name the quantum MAB principle I'm addressing?
- [ ] Did I identify 3+ failure modes (not just the obvious one)?
- [ ] Did I measure fairness impact with a concrete metric (DI, equalized odds, etc.)?
- [ ] Did I reference BIO630, ISTE780, or IDAI700 where applicable?
- [ ] Is my code reproducible and commented?
- [ ] Does my spine ledger entry clearly state the trade-off?
- [ ] Did I think about the DSCI601 implications?

---

## Submit Checklist (Every Friday)

- [ ] Methods memo completed (2–3 pages)
- [ ] Code artifact functional and uploaded to GitHub
- [ ] Spine ledger entry added
- [ ] All pushed to GitHub (`git add . && git commit -m "Week N: [Topic]" && git push`)
- [ ] Ready for Monday BIOL550 class feedback

---

END TEMPLATE 1

---

---

## TEMPLATE 2: Spine Ledger Entry (Standalone)
**Use:** Every BIOL550 week, end of week  
**File Name:** Add entries to `biol550/spine_ledger.md`

---

```markdown
# Spine Ledger: Fairness Decision Log
## Weeks 1–14 Decisions, Rationales, Trade-offs

---

## Week [N]: [Topic]

### Decision
[One sentence: what did you decide?]

Example: "Use ancestry-stratified batch correction instead of global batch correction"

### Rationale
[2–3 sentences: why this decision? Reference BIO630 algorithms, ISTE780 metrics, IDAI700 principles]

Example: "BIO630 taught us that batch effects can obscure biological signal. Global batch 
correction perpetuates STRUCTURAL BIAS (IDAI700) by treating all sites/populations equally 
when they're not. ISTE780 shows: global correction DI = 0.50 (fails 80 rule); ancestry-stratified 
correction DI = 0.82 (passes)."

### Fairness Metrics

| Metric | Before | After | Target |
|---|---|---|---|
| Disparate Impact (80 Rule) | 0.50 ❌ | 0.82 ✅ | ≥ 0.80 |
| Feature retention DI | — | — | — |
| Equalized odds gap | — | — | < 0.05 |

### Trade-off
[What are we accepting in exchange for fairness?]

Example: "Increased computational cost (3× longer preprocessing). Slightly higher residual 
batch effect in some samples. But fairness to all populations is essential."

### GitHub Artifact
`biol550/preprocessing/week[N]_*.py`

### Status
✓ Implemented ([Date])
```

---

## Formatting Rules for Spine Ledger

**Decision:** One line, clear action  
**Rationale:** 2–3 lines, cite frameworks  
**Metrics Table:** Always show before/after  
**Trade-off:** Honest about costs  
**Status:** ✓ Done or 🔄 In Progress or ❌ Blocked

---

END TEMPLATE 2

---

---

## TEMPLATE 3: Data Card (Start Week 1, Update Weekly)
**Use:** Week 1 (create), then update as you learn things  
**File Name:** `docs/data_card.md`

---

```markdown
# Data Card: RNA Biomarker Discovery Dataset

## Motivation & Context
**Why this dataset?** [2–3 sentences]

Example: "We selected this dataset because it has diverse ancestry representation, 
publicly available, and includes clinical phenotypes (disease status). This allows us 
to audit fairness across populations in a real-world biomarker discovery scenario."

**Ethical considerations:** [Briefly]

Example: "Dataset includes patients from X countries. Some ancestry groups are 
underrepresented. We must account for this in model development and validation."

---

## Dataset Composition

| Attribute | Value |
|---|---|
| **Source** | [Dataset name / GEO accession / TCGA] |
| **Total Samples** | N |
| **Outcome Variable** | [Disease status / continuous phenotype] |
| **Primary Ancestry Groups** | [List, e.g., European, African, East Asian] |
| **Data Type** | [RNA-seq / qPCR / Microarray] |
| **Number of Features (genes)** | K |

---

## Demographics & Representation

| Ancestry | N | % | Samples by Site |
|---|---|---|---|
| [Group 1] | [N1] | [%1] | [Site A: N1a, Site B: N1b] |
| [Group 2] | [N2] | [%2] | [Site A: N2a, Site B: N2b] |
| [Group 3] | [N3] | [%3] | [Site A: N3a, Site B: N3b] |
| **Total** | **N** | **100%** | — |

**EQUITY CONCERN:** [If any group < 10%, flag it]

Example: "Group 3 is only 5% of samples. Model performance may be unreliable on this 
group. We will require external validation before deployment."

---

## Known Data Issues

| Issue | Impact | Mitigation |
|---|---|---|
| Missing data (20% of genes in 30% of samples) | DI risk: minority groups may have more missing data | Use ancestry-stratified multiple imputation (Week 6) |
| Batch effects (3 sites) | DI risk: sites may be confounded with ancestry | Use ancestry-stratified batch correction (Week 3) |
| Imbalanced outcome (10% disease, 90% control) | Model bias toward majority class | Use ISTE780 cost-weighting in DSCI601 |

---

## Fairness Baseline
**Before any preprocessing:**

| Metric | Value | Status |
|---|---|---|
| Disparate Impact (80 Rule) | [DI baseline] | ✓/❌ |
| Equalized odds gap | [EO baseline] | ✓/❌ |
| Missing data rate by ancestry | [Measured] | ✓/❌ |

**Example:**
| Metric | Value | Status |
|---|---|---|
| Disparate Impact (80 Rule) | 0.35 | ❌ FAILS (need ≥ 0.80) |
| Equalized odds gap (measurement success rate) | 0.27 | ❌ FAILS (need < 0.05) |
| Missing data: Ancestry A | 15% | — |
| Missing data: Ancestry B | 35% | ❌ FAILS (need balanced) |

---

## Preprocessing Pipeline
**Brief overview (detailed in BIOL550 spine ledger)**

| Week | Step | DI Before | DI After |
|---|---|---|---|
| 1 | QC | 0.35 | 0.42 |
| 2 | Mapping | 0.42 | 0.60 |
| 3 | Normalization | 0.60 | 0.68 |
| 4 | Feature Selection | 0.68 | 0.72 |
| 5 | RNA Structure | 0.72 | 0.75 |
| 6 | Imputation | 0.75 | 0.78 |
| 10 | ML Preprocessing | 0.78 | 0.82 |
| 11–12 | Fairness Audit + Mitigation | 0.82 | → Target |

**Cumulative DI Improvement:** 0.35 → 0.82 ✅

---

## How to Use This Data
**For researchers:**
- Use preprocessed features from BIOL550 for downstream analysis
- Report disparate impact metrics in your paper
- External validation required for new populations

**For clinical implementation:**
- This model is validated on [ancestry groups]. Revalidation required for other groups.
- Before deployment, get approval from community advisory board.
- Ongoing monitoring: measure DI quarterly on new data.

---

## Limitations
- [Ancestry group X is underrepresented; results may not generalize]
- [Batch effects from sites confound with some demographics]
- [Missing data mechanisms may be non-random by ancestry]
- [No information on [important covariate]—unmeasured confounding possible]

---

## Co-Authors & Attribution
- **Data assembly:** BIOL550 instructor
- **Fairness audit:** [Your name] + ISTE780 framework
- **Governance:** DSCI601 instructor + IDAI700 EQUITAS principles

---

## License
CC-BY-4.0 (This data card and methodology)

---

## References
[Cite IDAI700 data card framework]
[Cite ISTE780 disparate impact paper]
[Cite BIO630 algorithm validation]

---
```

---

END TEMPLATE 3

---

---

## TEMPLATE 4: DSCI601 Ethics & Fairness Writeup (Week 11)
**Use:** DSCI601 Week 11  
**File Name:** `dsci601/ethics_fairness_writeup.md`  
**Length:** 3–4 pages

---

```markdown
# Ethics & Fairness Writeup: Fair RNA Biomarker Classification

## Executive Summary
[1 paragraph: what problem are we solving? why does it matter?]

Example: "Healthcare systems often assume a 'one-size-fits-all' approach to biomarker 
discovery. But gene expression varies across ancestries. Standard machine learning 
models can amplify this variation into systematic bias, leading to inequitable 
diagnoses. This writeup operationalizes ISTE780 fairness metrics and IDAI700 
governance principles to ensure equitable biomarker discovery."

---

## Section 1: Preprocessing Fairness (from BIOL550, Weeks 1–12)

### Baseline Disparate Impact
**From BIOL550 Week 11 audit:**

| Processing Step | DI Ratio | Status | Reference |
|---|---|---|---|
| Raw data | 0.35 | ❌ FAILS (need ≥ 0.80) | ISTE780 80 Rule |
| After W1–10 mitigations | 0.82 | ✓ PASSES | From BIOL550 spine ledger |

### BIOL550 Mitigation Strategies (Summary)

**Week 3: Ancestry-stratified batch correction**
- Rationale: Global batch correction perpetuates structural bias (IDAI700)
- Impact: Improved DI from 0.50 to 0.68
- Trade-off: Computational cost (acceptable for fairness)

**Week 5: Fairness-aware feature selection**
- Rationale: Global variance filtering erases minority-enriched genes
- Impact: Improved DI from 0.68 to 0.75
- Trade-off: Fewer features, but more equitable

**Week 11–12: Data augmentation + fairness-aware feature weighting**
- Rationale: Oversample minority groups, weight features by DI impact
- Impact: Improved DI from 0.75 to 0.82
- Trade-off: Synthetic data; requires validation

### Fairness Carryover to DSCI601
"BIOL550's preprocessing achieves DI = 0.82, meeting ISTE780 targets. We inherit 
these fair features as input to our model. Our modeling task is to maintain this 
fairness while achieving high predictive accuracy."

---

## Section 2: Model-Level Fairness

### Baseline Model (Without Fairness Constraints)

| Metric | Value | Status |
|---|---|---|
| AUC | 0.92 | ✓ Good accuracy |
| Equalized Odds gap | 0.15 | ❌ FAILS (need < 0.05) |
| Calibration error | 0.18 | ❌ FAILS (need < 0.15) |

**Problem:** High accuracy BUT unfair. Model predicts well for majority ancestry, poorly 
for minority.

### ISTE780 Mitigations Applied

**Mitigation 1: Cost-weighting**
- Upweight minority-class samples in loss function
- Formula: `loss = (1 - minority_weight) * loss_majority + minority_weight * loss_minority`
- Result: AUC = 0.91, EO gap = 0.06 (closer to target)

**Mitigation 2: Stratified cross-validation**
- Ensure every fold has balanced ancestry representation
- Prevents accidentally training on biased splits
- Result: Model performance stable across folds

**Mitigation 3: Fairness regularization**
- Add term to loss function: `loss_total = loss_accuracy + λ * loss_fairness`
- Where `loss_fairness` penalizes equalized odds gap
- Result: AUC = 0.90, EO gap = 0.02 ✓ PASSES

### Final Model Performance

| Metric | Baseline | Final | Target | Status |
|---|---|---|---|---|
| AUC | 0.92 | 0.90 | > 0.88 | ✓ PASS |
| Equalized Odds gap | 0.15 | 0.02 | < 0.05 | ✓ PASS |
| Calibration error | 0.18 | 0.14 | < 0.15 | ✓ PASS |

**Trade-off Justification:** 2% AUC loss is acceptable for 13 percentage point fairness 
improvement. Fairness is non-negotiable in healthcare.

---

## Section 3: Governance & Rollback Triggers

### Binding Fairness Criteria (EQUITAS Operationalized)

This model can ONLY be deployed if:

1. ✓ Equalized odds gap < 0.05 across ALL ancestry groups
2. ✓ Calibration error < 0.15
3. ✓ AUC > 0.88 (minimum accuracy threshold)
4. ✓ External validation on new population before rollout
5. ✓ Community advisory board approval (if available)

### Rollback Protocol

**Trigger:** If any binding criterion fails on new data

**Action:**
1. Pause deployment immediately
2. Investigate: What changed? (data drift? population shift?)
3. Retrain model with updated data + fairness constraints
4. Re-validate before redeployment

**Example:** "If monitoring data in Month 3 shows EO gap = 0.08, we stop using the 
model until retraining is complete."

### Accountability & Audit Trail

Every model iteration logged with:
- Training date
- Ancestry composition of training data
- Fairness metrics (DI, EO, calibration)
- Accuracy metrics (AUC, precision, recall)
- Any deviations from fairness criteria

**Auditor access:** Community advocates can request this log at any time.

---

## Section 4: Limitations & Community Audit

### When This Model Should NOT Be Used

**Population 1:** [Any ancestry group with < 10% representation]
- Reason: Insufficient data for reliable fairness assessment
- Required: External validation on large cohort of this population

**Population 2:** [Other underrepresented groups, demographics]
- Reason: [Model not validated on this group]
- Required: [Specific revalidation steps]

### Community Audit Invitation

"This model operationalizes fairness principles, but no algorithm is perfect. We invite:

1. **Patient advocates:** Review our fairness criteria. Do you agree they're sufficient?
2. **Clinicians:** Test model on your own data. Report any equity concerns.
3. **Researchers:** Reproduce our analysis. Identify improvements.
4. **Patients:** Understand what this model does (see `/docs/PLAIN_LANGUAGE_SUMMARY.md`)"

### How to Report Concerns
[Email address / GitHub issues / Community feedback form]

---

## Section 5: Fairness-Accuracy Trade-off Justification

### Why Fairness Matters in Healthcare

"Biomarker-driven diagnoses affect treatment decisions. If our model is unfair, it can 
perpetuate health inequities:
- Minority patients misdiagnosed → worse outcomes
- Health system appears to treat everyone equally (technically true) but perpetuates bias
- Trust in healthcare erodes in affected communities

Fairness is not optional. It's essential for healthcare legitimacy."

### The Trade-off

| Scenario | AUC | EO Gap | Recommendation |
|---|---|---|---|
| Max accuracy (baseline) | 0.92 | 0.15 | ❌ NO—unfair |
| Balanced (final) | 0.90 | 0.02 | ✓ YES—fair & accurate |
| Max fairness | 0.88 | < 0.01 | ? Maybe (need clinical input) |

"Our final model balances both: good accuracy (0.90) AND fairness (EO = 0.02). 
This is our recommendation."

---

## Section 6: Frameworks Referenced

- **ISTE780 Phase 2:** Disparate impact, equalized odds, cost-weighting
- **ISTE780 Phase 3:** Fairness regularization, stratified validation
- **IDAI700 EQUITAS:** Binding criteria, procedural justice, civic literacy
- **BIO630:** Algorithm robustness validation
- **Quantum-inspired fairness:** Multi-objective optimization under uncertainty

---

## Conclusion

"Fair biomarker discovery requires action at every stage: preprocessing (BIOL550), 
modeling (DSCI601), and governance (both). By operationalizing ISTE780 metrics 
and IDAI700 principles, we demonstrate that fairness and accuracy are compatible, 
not opposed. This model is ready for deployment under the conditions outlined above."

---

END TEMPLATE 4

---

---

## SUMMARY: When to Use Each Template

| Template | Week | File | Time to Fill |
|---|---|---|---|
| 1. Weekly Methods Memo | W1–W14 (every week) | `biol550/methods_memos/Week_[N].md` | 45 min |
| 2. Spine Ledger Entry | W1–W14 (every week) | `biol550/spine_ledger.md` | 15 min |
| 3. Data Card | W1 (create), ongoing (update) | `docs/data_card.md` | 1 hour (W1), 15 min (updates) |
| 4. Ethics & Fairness Writeup | W11 | `dsci601/ethics_fairness_writeup.md` | 2–3 hours |

**Pro tip:** Copy these templates into your GitHub repo's `/templates/` directory on Day 1. 
Then every week, just copy the template, fill in blanks, and commit.

---

**Ready? Here's your Week 1 workflow:**

1. Create GitHub repo (from [335])
2. Copy these templates into `/templates/` directory
3. Read [344] (prior course integration)
4. Read [345] (week-by-week map)
5. Fill in Template 1 (Week 1 Methods Memo) using IDAI700 framing
6. Fill in Template 3 (Data Card) with your dataset
7. Add Template 2 entry to spine_ledger.md
8. Commit everything

**That's Week 1. You've got this.** 🚀

