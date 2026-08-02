#!/usr/bin/env python3
"""Validate the codes array in mtga-code-slammer.ahk."""
import re
import sys

PATH = "mtga-code-slammer.ahk"


def extract_codes(text):
    match = re.search(r"strings := \[(.*?)\]", text, re.S)
    if not match:
        sys.exit(f"could not find strings array in {PATH}")
    return re.findall(r'"([^"]*)"', match.group(1))


def main():
    codes = extract_codes(open(PATH).read())

    errors = []
    if not codes:
        errors.append("no codes found")

    seen = {}
    for code in codes:
        if not code.strip():
            errors.append("empty code entry")
            continue
        key = code.lower()
        if key in seen:
            errors.append(f"duplicate code (case-insensitive): {seen[key]!r} and {code!r}")
        else:
            seen[key] = code

    if errors:
        for e in errors:
            print(e, file=sys.stderr)
        sys.exit(1)

    print(f"{len(codes)} codes, no duplicates")


if __name__ == "__main__":
    main()
