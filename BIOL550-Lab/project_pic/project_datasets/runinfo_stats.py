#!/usr/bin/env python3

import csv
import statistics
import sys
from pathlib import Path


def to_int(value: str | None) -> int | None:
    if value is None:
        return None
    text = str(value).strip()
    if not text or text.lower() in {"na", "n/a", "nan"}:
        return None
    try:
        return int(float(text))
    except ValueError:
        return None


def summarize_runinfo(csv_path: Path) -> dict:
    with csv_path.open(newline="") as f:
        reader = csv.DictReader(f)
        rows = list(reader)

    spots = [to_int(r.get("spots")) for r in rows]
    spots = [s for s in spots if s is not None]

    avg_length = [to_int(r.get("avgLength") or r.get("avgSpotLen")) for r in rows]
    avg_length = [a for a in avg_length if a is not None]

    if not spots:
        raise ValueError(f"No numeric 'spots' values found in {csv_path}")

    return {
        "runs": len(rows),
        "spots_min": min(spots),
        "spots_max": max(spots),
        "spots_mean": statistics.mean(spots),
        "avgLength_min": min(avg_length) if avg_length else None,
        "avgLength_max": max(avg_length) if avg_length else None,
        "avgLength_mean": statistics.mean(avg_length) if avg_length else None,
    }


def main(argv: list[str]) -> int:
    if len(argv) < 2:
        print("Usage: runinfo_stats.py <runinfo1.csv> [runinfo2.csv ...]", file=sys.stderr)
        return 2

    for path_str in argv[1:]:
        csv_path = Path(path_str)
        s = summarize_runinfo(csv_path)
        avg_min = s["avgLength_min"]
        avg_max = s["avgLength_max"]
        avg_mean = s["avgLength_mean"]

        def fmt_int(x: int | None) -> str:
            return "NA" if x is None else f"{x:,d}"

        def fmt_mean(x: float | None) -> str:
            return "NA" if x is None else f"{x:,.2f}"

        print(csv_path.stem.replace("_runinfo", ""))
        print(f"  runs: {s['runs']}")
        print(f"  avgLength: {fmt_int(avg_min)}–{fmt_int(avg_max)} (mean {fmt_mean(avg_mean)})")
        print(
            f"  spots: {fmt_int(s['spots_min'])}–{fmt_int(s['spots_max'])} (mean {fmt_mean(s['spots_mean'])})"
        )

    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
