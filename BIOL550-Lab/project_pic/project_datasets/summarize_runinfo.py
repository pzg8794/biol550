#!/usr/bin/env python3

import csv
import glob
import os
from typing import Optional


def to_int(value: str) -> Optional[int]:
    try:
        return int(float(value))
    except Exception:
        return None


def to_float(value: str) -> Optional[float]:
    try:
        return float(value)
    except Exception:
        return None


def fmt_len(value: Optional[float]) -> str:
    if value is None:
        return "NA"
    as_int = int(value)
    return str(as_int) if abs(value - as_int) < 1e-9 else f"{value:.1f}"


def fmt_spots(value: Optional[int]) -> str:
    if value is None:
        return "NA"
    return f"{value/1e6:.1f}M"


def show_set(values: set[str]) -> str:
    values = sorted(values)
    if len(values) <= 2:
        return ", ".join(values)
    return ", ".join(values[:2]) + f" (+{len(values) - 2} more)"


def summarize(path: str) -> dict:
    with open(path, newline="") as f:
        reader = csv.DictReader(f)

        min_len = max_len = None
        min_spots = max_spots = None
        layouts: set[str] = set()
        organisms: set[str] = set()
        strategies: set[str] = set()
        total = 0

        for row in reader:
            total += 1
            layouts.add(((row.get("LibraryLayout") or "").strip()) or "NA")
            organisms.add(((row.get("ScientificName") or "").strip()) or "NA")
            strategies.add(((row.get("LibraryStrategy") or "").strip()) or "NA")

            L = to_float(row.get("avgLength") or row.get("avgSpotLen") or "")
            S = to_int(row.get("spots") or "")

            if L is not None:
                min_len = L if min_len is None else min(min_len, L)
                max_len = L if max_len is None else max(max_len, L)
            if S is not None:
                min_spots = S if min_spots is None else min(min_spots, S)
                max_spots = S if max_spots is None else max(max_spots, S)

    return {
        "total": total,
        "layouts": layouts,
        "organisms": organisms,
        "strategies": strategies,
        "min_len": min_len,
        "max_len": max_len,
        "min_spots": min_spots,
        "max_spots": max_spots,
    }


def main() -> None:
    paths = sorted(glob.glob("*_runinfo.csv"))
    for path in paths:
        proj = os.path.basename(path).replace("_runinfo.csv", "")
        s = summarize(path)
        print(
            f"{proj}\t"
            f"total={s['total']}\t"
            f"Layout={show_set(s['layouts'])}\t"
            f"Strategy={show_set(s['strategies'])}\t"
            f"Organism={show_set(s['organisms'])}\t"
            f"avgLength={fmt_len(s['min_len'])}–{fmt_len(s['max_len'])}\t"
            f"spots={fmt_spots(s['min_spots'])}–{fmt_spots(s['max_spots'])}"
        )


if __name__ == "__main__":
    main()
