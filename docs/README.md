# BIOL550 (High Throughput Sequencing Analysis)

This repo contains my BIOL550 lab notes, reports, and reproducible analysis artifacts.

## Documentation hierarchy

- [Course notes hub](BIOL550-Notes.md)
- [Lab task hub](BIOL550-Lab/task_n_desc.md)
- [Group project documentation map](group_project/DOCUMENTATION_MAP.md)
- [Group project workspace README](group_project/README.md)
- [Group project work log](group_project/WORKLOG.md)
- [Mouse process doc](group_project/mouse/PROCESS_mouse_fastq_fastqc_fastx.md)
- [Mouse TODO](group_project/mouse/TODO_mouse.md)
- [Mouse QC remediation plan](group_project/mouse/TODO_qc_remediation.md)

Use this order when navigating the project:
1. course requirement or context
2. group-project hub
3. mouse workflow or remediation detail
4. notebook/report outputs

## What’s included
- Lab reports (`BIOL550-Lab/lab*/`)
- Course notes (`BIOL550-Notes.md`)
- Helper docs/checklists (`BIOL550-Lab/task_n_desc.md`)
- Group project workflow notes + log (`group_project/mouse/PROCESS_mouse_fastq_fastqc_fastx.md`, `group_project/WORKLOG.md`)

> Tooling note (2026-03-05): FASTX shows up in the pipeline because it’s what we started with for the class workflow; for “targeted trimming” (adapters/known end sequences), prefer `fastp` (and `cutadapt` for primer/amplicon trimming). Details live in `BIOL550-Notes.md` (“fastp vs FASTX Toolkit”).

## What’s intentionally excluded
To keep this repository public-friendly and lightweight, course-distributed PDFs/handouts and other large binary artifacts are ignored (see `.gitignore`).
