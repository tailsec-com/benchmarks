#!/bin/bash
set -e

SCANNER="scan-k8s"
MANIFESTS="./vulnerable-apps/k8s-manifests"
RESULTS="./results/k8s-benchmark.json"

echo "Running $SCANNER on $MANIFESTS..."

$SCANNER "$MANIFESTS" --format json > "$RESULTS"

# Calculate metrics
TOTAL=$(cat "$RESULTS" | jq '.summary.total')
CRITICAL=$(cat "$RESULTS" | jq '.summary.critical')

echo "Benchmark Results:"
echo "  Total findings: $TOTAL"
echo "  Critical: $CRITICAL"

# Compare against expected
EXPECTED="./expected-results/k8s-results.json"
if [ -f "$EXPECTED" ]; then
    EXPECTED_COUNT=$(cat "$EXPECTED" | jq '.expected')
    DIFF=$((TOTAL - EXPECTED_COUNT))
    echo "  vs Expected: $EXPECTED_COUNT (diff: $DIFF)"
fi