# BIOL550 × DSCI601: One-Page Visual Summary
## Integration Strategy at a Glance

---

## THE CONCEPT

```
                        SHARED PROJECT
                         One Dataset
                      One Pipeline
                      One Story
                          ↓
        ┌───────────────────────────────────┐
        │  Fair RNA Biomarker Discovery     │
        │  for Equitable Disease Risk       │
        │     Stratification                │
        └───────────────────────────────────┘
                    ↙           ↖
            BIOL550           DSCI601
         (Weeks 1–14)       (Weeks 1–14)
            Biology           Data Science
            Methods           Modeling
            Fairness Audit    Fairness Metrics
```

---

## BIOL550 STRUCTURE

```
WEEKLY CYCLE (14 × 15 points = 210 points)
┌──────────────────────────────────────────────────────┐
│  MONDAY–WEDNESDAY: Learn omics method              │
│  ├─ Read 1–2 papers on bias modes                  │
│  ├─ Class discussion + mini-lecture                │
│  └─ Identify 3–4 failure modes                     │
│                                                    │
│  THURSDAY–FRIDAY: Deliver 3 artifacts (15 pts)    │
│  ├─ A: Methods Memo (2 pages, 5 pts)              │
│  │     └─ What? Why? Failure modes? Connection?   │
│  ├─ B: Code (Functional, 5 pts)                   │
│  │     └─ Toy implementation tested               │
│  └─ C: Spine Ledger (1 decision, 5 pts)           │
│        └─ Permanent pipeline improvement + rationale
│                                                    │
│  FRIDAY EVENING: Push to GitHub `/biol550/`        │
└──────────────────────────────────────────────────────┘

WEEK 7:  Midterm Synthesis Memo (3 pages, 40 pts)
         Integrate W1–W7 decisions

WEEK 14: Capstone Presentation (15–20 min, 30 pts)
         + Final Code + README (20 pts)
         
SHARED:  Data Card (50 pts) + Architecture (50 pts)
         Both signed by instructors
         
TOTAL: 400 points
```

---

## DSCI601 STRUCTURE

```
STANDARD PROJECT-BASED TIMELINE
┌──────────────────────────────────────────────────────┐
│  W2–3:   Advisor meeting #1 (15%)                  │
│  W4:     Preliminary Proposal + Presentation (10%) │
│  W7:     Related Work Survey (10%)                 │
│  W8:     Advisor meeting #2 (15%)                  │
│  W9–10:  Approach + Architecture Writeup (10%)     │
│  W10:    Code Review + Peer Feedback (5%)          │
│  W11:    Ethics & Fairness Writeup (5%)            │
│  W13:    Endterm Demo + Code (12%)                 │
│  W14:    Final Report (8%)                         │
│                                                    │
│  Uses BIOL550's fair features as input             │
│  Operationalizes EQUITAS in model fairness         │
│                                                    │
│  TOTAL: 120 points                                 │
└──────────────────────────────────────────────────────┘
```

---

## WEEKLY HANDOFF PATTERN

```
BIOL550 (Friday)          DSCI601 (Monday–Friday)
────────────────────      ────────────────────────
Methods Memo W[N]    →    Advisor reads for context
Code W[N]            →    Pulls features/insights
Spine Ledger W[N]    →    Uses decision for modeling
                          
                     →    Feedback on fairness implications
                          (Async, or in monthly sync)
```

---

## FAIRNESS JOURNEY: Disparate Impact Timeline

```
BASELINE (Week 1)              MITIGATION (Weeks 11–12)       FINAL (Week 14)
┌─────────────────┐            ┌──────────────────────┐       ┌────────────┐
│ Data assembled  │            │ Preprocessing audit: │       │ Model:     │
│ Protected attr  │      →      │ DI = 0.35 (fails)    │   →   │ DI = 0.88  │
│ documented      │            │                      │       │ (passes)   │
│ DI = ? (unknown)│            │ Augmentation applied │       │            │
│                 │            │ Scaling stratified   │       │ Report:    │
│ QUESTION:       │            │ New DI = 0.75        │       │ Before/    │
│ Is preprocessing│            │                      │       │ after      │
│ fair?           │            │ Fairness gaps        │       │ compared   │
│                 │            │ ready for DSCI601    │       │            │
└─────────────────┘            └──────────────────────┘       └────────────┘
```

---

## SHARED DELIVERABLES (Both Sign Off)

```
                    ┌─────────────────────┐
                    │  DATA CARD (W10)    │
                    │  2–3 pages          │
                    │  ✓ Source           │
                    │  ✓ Demographics     │
                    │  ✓ Preprocessing    │
                    │  ✓ Bias audit       │
                    │  ✓ Ethics           │
                    └─────────────────────┘
                             ↓
        ┌────────────────────────────────────────┐
        │  ARCHITECTURE MEMO (W10–W12)           │
        │  2–3 pages + diagram                   │
        │  ✓ Data flow                           │
        │  ✓ Key decisions                       │
        │  ✓ Tools & frameworks                  │
        │  ✓ Deployment plan                     │
        └────────────────────────────────────────┘
                             ↓
        ┌────────────────────────────────────────┐
        │  FAIRNESS REPORT (W9–W12)              │
        │  5–8 pages + visualizations            │
        │  ✓ Baseline DI (preprocessing)         │
        │  ✓ Model DI (classification)           │
        │  ✓ Mitigation strategies applied       │
        │  ✓ Before/after results                │
        │  ✓ Limitations & future work           │
        └────────────────────────────────────────┘
                             ↓
        ┌────────────────────────────────────────┐
        │  GITHUB REPO (W1–W14)                  │
        │  Fully reproducible + open-source      │
        │  ✓ /biol550/ preprocessing code        │
        │  ✓ /dsci601/ modeling code             │
        │  ✓ /docs/ all memos + reports          │
        │  ✓ environment.yml (Docker/conda)      │
        │  ✓ README + working example            │
        │  ✓ CC-BY-4.0 license                   │
        └────────────────────────────────────────┘
```

---

## INTEGRATION WITH PRIOR SEMESTERS

```
FALL 2024: FOUNDATION              SPRING 2025: APPLICATION         FUTURE: IMPACT
───────────────────────────────    ─────────────────────────────   ──────────────
BIO630: Algorithms                 BIOL550: Audit preprocessing     Research:
├─ Nussinov                         with fairness lens              Collaborate with
├─ Energy Min                       (apply BIO630 methods)          clinicians &
└─ Cross-validation                                                 patient advocates
                                   DSCI601: Train model
ISTE780: Fairness Metrics          constrained by fairness         Publication:
├─ 80 Rule                         (apply ISTE780 metrics)         Fairness-aware
├─ Cost-weighting                                                   bioinformatics
└─ Mitigation strategies           SHARED: Integrated fairness     methodology

IDAI700: Ethics Framework          report showing EQUITAS in
├─ EQUITAS                         action (operationalize IDAI700)
├─ Epistemic justice
└─ Structural power                All 3 prior courses are
                                   referenced & integrated
```

---

## MONTHLY SYNC CALL AGENDA

```
END OF JANUARY (W4)          END OF FEBRUARY (W8)      END OF MARCH (W12)    END OF APRIL (W14)
─────────────────────        ─────────────────────    ────────────────      ──────────────
✓ W1–W4 code review          ✓ Midterm synthesis      ✓ Fairness baseline  ✓ Celebrate!
✓ Data/fairness targets      ✓ W1–W8 narrative        ✓ Mitigation status  ✓ Discuss future
✓ GitHub structure check      ✓ Preprocessing         ✓ Report draft        ✓ Publication plan
✓ Timeline confirmation       complete               ✓ Demo readiness      ✓ Community
✓ Any blockers?              ✓ DSCI601 proposal      ✓ Any last blockers?  engagement
```

---

## SUCCESS CHECKLIST (By Week 14)

```
BIOL550 SIDE                    DSCI601 SIDE                SHARED
────────────────────────────    ────────────────────────    ──────────────────
☑ 14 methods memos             ☑ Proposal approved         ☑ GitHub repo public
☑ 14 code artifacts            ☑ Related work done         ☑ Data card signed
☑ 14 spine ledger entries      ☑ Approach finalized        ☑ Architecture signed
☑ Midterm synthesis            ☑ Architecture done         ☑ Fairness report signed
☑ Preprocessing pipeline       ☑ Ethics writeup done       ☑ README complete
  working end-to-end           ☑ Model trained            ☑ >20 shared commits
☑ Fairness audit complete      ☑ Fairness eval done        ☑ License: CC-BY-4.0
☑ Docker/conda working         ☑ Final report done         ☑ DOI generated
☑ Capstone presentation        ☑ Code documented          ☑ One unified story
  delivered                     ☑ Demo delivered

COMBINED DELIVERABLE: One publication-ready fairness-aware bioinformatics pipeline
                      with reproducible code, comprehensive documentation, and
                      demonstrated equity improvements.
```

---

## THREE-SENTENCE SUMMARY

1. **The Goal:** Build a fair RNA biomarker discovery pipeline that reduces algorithmic bias across ancestry/care settings while maintaining predictive accuracy.

2. **The Method:** BIOL550 audits preprocessing fairness weekly; DSCI601 models with fairness constraints; both integrate findings into a shared GitHub repo with comprehensive fairness documentation.

3. **The Impact:** Demonstrate that fairness-aware bioinformatics is teachable, reproducible, and operationalizes your EQUITAS framework from IDAI700 in real data.

---

## CONTACT & SUPPORT

| Need | Contact | When |
|---|---|---|
| BIOL550 methods question | BIOL550 instructor | Weekly office hours |
| DSCI601 modeling question | DSCI601 advisor | By appointment |
| Project integration issue | Both instructors | Monthly sync call |
| GitHub/technical issue | DSCI601 advisor or TA | Async via Slack/email |
| Fairness interpretation | BIOL550 instructor | Weekly |

---

## KEY DATES

| Event | Week | Due |
|---|---|---|
| GitHub repo created | 0 | Jan 15 |
| Advisor meeting #1 (DSCI601) | 2–3 | Jan 20 |
| Preliminary proposal (DSCI601) | 4 | Jan 27 |
| **Monthly Sync #1** | 4 | Jan 31 |
| Related work survey (DSCI601) | 7 | Feb 14 |
| Midterm synthesis (BIOL550) | 7 | Feb 17 |
| **Monthly Sync #2** | 8 | Feb 28 |
| Fairness report draft | 11 | Mar 24 |
| **Monthly Sync #3** | 12 | Mar 31 |
| Endterm demo (DSCI601) | 13 | Apr 7 |
| **Final sync + celebration** | 14 | Apr 14 |
| BIOL550 capstone presentation | 14 | Apr 16 |
| DSCI601 final report | 14 | Apr 20 |

---

## REMEMBER

**This is not two separate courses.  
This is one integrated research project  
graded along two complementary dimensions.**

- BIOL550 grades: Biological rigor + fairness audits
- DSCI601 grades: Modeling excellence + ethics integration
- Together: Proof that fairness & performance coexist

**You are not just completing a capstone.  
You are building proof that EQUITAS works.**

---

**Print this page. Post it above your desk. Refer to it weekly.  
Good luck.** 🧬📊✨

---

**Version:** 1.0 | **Date:** January 14, 2026 | **Status:** Ready to go
