#!/bin/bash
set -e

SCANNER="scan-sast"
MANIFESTS="./vulnerable-apps"
RESULTS="./results/sast-benchmark.json"

echo "Running $SCANNER on $MANIFESTS..."

$SCANNER "$MANIFESTS" --format json --language javascript > "$RESULTS"

# Calculate metrics
TOTAL=$(cat "$RESULTS" | jq '.summary.total')
MEDIUM=$(cat "$RESULTS" | jq '.summary.medium')

echo "Benchmark Results:"
echo "  Total findings: $TOTAL"
echo "  Medium: $MEDIUM"