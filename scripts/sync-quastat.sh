#!/usr/bin/env bash
# Fetch the latest QuaStat main index.html (private repo; needs `gh auth login` with access) and
# overwrite quastat/app/index.html byte-for-byte. Prints the sha256. Commit and push yourself.
set -euo pipefail
REPO="${QUASTAT_REPO:-benjaminxu2023-glitch/quastat}"
REF="${QUASTAT_REF:-main}"
cd "$(dirname "$0")/.."
tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT
gh api -H "Accept: application/vnd.github.raw" "repos/${REPO}/contents/index.html?ref=${REF}" > "$tmp"
test -s "$tmp" || { echo "empty download" >&2; exit 1; }
sha="$(gh api "repos/${REPO}/commits/${REF}" -q .sha)"
mkdir -p quastat/app
mv "$tmp" quastat/app/index.html
trap - EXIT
echo "quastat ${REPO}@${REF} (${sha})"
sha256sum quastat/app/index.html
