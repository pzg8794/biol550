# Change Proposals — Mouse Weekly Report (2026-03-04)

**Target report:** `/Users/pitergarcia/DataScience/Semester5/BIOL550/group_project/mouse/reports/BIOL550_Weekly_Report_Mouse_SRA_FastQC_2026-03-04.html`

These proposals are derived from patterns/instructor expectations captured across the course transcripts (especially the QC + server-operations weeks). Each item includes:

- **Ask:** what to change
- **Meaning/definition:** what the concept means (so the change is defensible)
- **Suggestion (before → after):** a concrete text edit

---

## 1) Make the “weekly report expectation” explicit (interpretation, not just screenshots)

- **Ask:** Add 1–2 sentences stating that the weekly report should include *interpretation* of QC outputs (what patterns mean, and what you will do next), not only plots/tables.
- **Meaning/definition:** In multiple transcripts, the instructor frames deliverables as “document it for a boss/lab” and expects “what do you see + what does it imply + what do you do next” (not just showing outputs).
- **Suggestion (before → after):**
  - **Before (Quick Review intro):** “I summarized FastQC by parsing each `*_fastqc.zip` with Python…”
  - **After:** “Following the course weekly-report expectation, I focus on *interpretation* (what the QC patterns imply) and *next actions* (what tool/step should change next), not only the screenshots/tables.”

---

## 2) Add a concrete server-load / coordination sentence (what we did to be good citizens)

- **Ask:** Add one sentence that explicitly ties your pipeline design to server etiquette: coordinating concurrency + monitoring load + using shared directories.
- **Meaning/definition:** **System load** is a composite indicator of how busy the server is (CPU + waiting/IO). The course repeatedly emphasizes coordinating downloads/compute and using shared group directories to avoid duplicated downloads and permission issues.
- **Suggestion (before → after):**
  - **Before (Accomplishments paragraph 2):** “...resumable pipeline (...) so the team can run consistently without overloading shared compute/storage resources.”
  - **After:** “...resumable pipeline (...) so the team can run consistently without overloading shared compute/storage resources; we coordinated concurrency and monitored server status (e.g., `who`/`top`) to avoid saturating bandwidth/CPU during downloads and QC.”

---

## 3) Clarify what `PASS/WARN/FAIL` means (triage signals, not a “grade”)

- **Ask:** Add one sentence explaining that FastQC module flags are *triage* and must be interpreted in RNA-seq context (e.g., duplication can be expected).
- **Meaning/definition:** FastQC modules are *heuristics*; RNA-seq often triggers warnings (composition bias, duplication) that are not automatically fatal. The important part is whether warnings are systematic, whether there are outliers, and whether issues affect downstream steps.
- **Suggestion (before → after):**
  - **Before:** “...collapsing mates to SRR-level module outcomes (worst-of-mates)...”
  - **After:** “FastQC `PASS/WARN/FAIL` flags are treated as triage heuristics (especially in RNA-seq where some WARN/FAIL patterns are common); the report focuses on systematic issues vs outliers and what changes the downstream pipeline should make.”

---

## 4) Tighten the SRA Toolkit “why these flags” explanation (split mates + gzip)

- **Ask:** Add a compact parenthetical defining what `--split-files` and `--gzip` accomplish and why we used them.
- **Meaning/definition:** `--split-files` produces separate mate files (`_1` / `_2`) for paired-end runs; `--gzip` keeps FASTQs compressed to save disk and reduce IO (and most downstream tools can read gzipped FASTQ).
- **Suggestion (before → after):**
  - **Before (Methods / example commands):** “`fastq-dump --split-files --gzip SRR30333743`”
  - **After:** “`fastq-dump --split-files --gzip SRR30333743` (split paired-end mates into `_1/_2`; keep compressed to reduce storage/IO).”

---

## 5) Make the severity score defensible (it’s a *ranking heuristic*)

- **Ask:** Add one sentence clarifying the severity score is a local heuristic to prioritize review, not a standard metric.
- **Meaning/definition:** `severity = 3×FAIL + WARN` is a simple weighted count that intentionally over-weights FAIL vs WARN to rank “what to inspect first.”
- **Suggestion (before → after):**
  - **Before:** “...computing a simple report-level severity score (`3×FAIL + WARN`).”
  - **After:** “...computing a simple report-level severity score (`3×FAIL + WARN`) as a *ranking heuristic* to prioritize which SRRs to inspect first (not as a formal QC metric).”

---

## 6) Strengthen the “adapters” logic with one crisp sentence (trimming ≠ clipping)

- **Ask:** Keep your current claim (it’s correct), but make it even more explicit that quality trimming won’t remove adapter signal, so adapter clipping is the correct next step.
- **Meaning/definition:** **Quality trimming** removes low-quality tail bases; **adapter clipping** removes technical adapter sequence (or read-through) and typically requires knowing or detecting adapter sequences.
- **Suggestion (before → after):**
  - **Before (after-row under the first figure):** “...trimming ... is not expected to remove adapter signal; adapter clipping is required.”
  - **After:** “...quality trimming is not expected to remove adapter signal because it targets base-quality tails, not technical sequences; adapter clipping (e.g., `fastx_clipper` or a modern trimmer such as `fastp`) is the correct next step before re-running FastQC.”

---

## 7) Optional: Add one line acknowledging “QC time buffer” (aligns with course timeline)

- **Ask:** Add one short sentence that the course schedule allocates buffer time for QC iteration (download → QC → cleanup → re-QC).
- **Meaning/definition:** This sets expectations that multiple QC iterations are normal and part of the planned timeline, not “we are stuck.”
- **Suggestion (before → after):**
  - **Before (Goals):** “Next week... add adapter clipping... re-run FastQC...”
  - **After:** “This aligns with the course timeline that intentionally allocates multiple weeks for QC iteration (download → QC → cleanup → re-QC) before alignment.”

