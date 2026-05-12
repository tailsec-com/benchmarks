#!/bin/bash
set -e

SCANNER="scan-terraform"
MANIFESTS="./vulnerable-apps/terraform-modules"
RESULTS="./results/terraform-benchmark.json"

echo "Running $SCANNER on $MANIFESTS..."

$SCANNER "$MANIFESTS" --format json > "$RESULTS"

# Calculate metrics
TOTAL=$(cat "$RESULTS" | jq '.summary.total')
HIGH=$(cat "$RESULTS" | jq '.summary.high')

echo "Benchmark Results:"
echo "  Total findings: $TOTAL"
echo "  High: $HIGH"

# Compare against expected
EXPECTED="./expected-results/terraform-results.json"
if [ -f "$EXPECTED" ]; then
    EXPECTED_COUNT=$(cat "$EXPECTED" | jq '.expected')
    DIFF=$((TOTAL - EXPECTED_COUNT))
    echo "  vs Expected: $EXPECTED_COUNT (diff: $DIFF)"
fi