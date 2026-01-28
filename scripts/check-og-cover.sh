#!/usr/bin/env bash
set -e

BAD=0

# Target OG size
REQ_W=1200
REQ_H=630

# Find staged cover images
FILES=$(git diff --cached --name-only --diff-filter=ACM | \
  grep -E '(^|/)cover\.(png|jpg|jpeg)$' || true)

for f in $FILES; do
  if [[ ! -f "$f" ]]; then
    continue
  fi

  DIM=$(identify -format "%w %h" "$f" 2>/dev/null || true)
  if [[ -z "$DIM" ]]; then
    echo "❌ $f: cannot read image dimensions"
    BAD=1
    continue
  fi

  W=$(echo "$DIM" | cut -d' ' -f1)
  H=$(echo "$DIM" | cut -d' ' -f2)

  if [[ "$W" -ne "$REQ_W" || "$H" -ne "$REQ_H" ]]; then
    echo "❌ $f: ${W}x${H} (expected ${REQ_W}x${REQ_H})"
    BAD=1
  else
    echo "✅ $f: ${W}x${H}"
  fi
done

if [[ "$BAD" -ne 0 ]]; then
  echo
  echo "OpenGraph covers must be ${REQ_W}x${REQ_H}."
  echo "Fix the image or regenerate it before committing."
  exit 1
fi
