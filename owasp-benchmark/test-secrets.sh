#!/bin/bash
set -e

SCANNER="scan-secrets"
MANIFESTS="./vulnerable-apps"
RESULTS="./results/secrets-benchmark.json"

echo "Running $SCANNER on $MANIFESTS..."

$SCANNER "$MANIFESTS" --format json > "$RESULTS"

# Calculate metrics
TOTAL=$(cat "$RESULTS" | jq '.summary.total')
HIGH=$(cat "$RESULTS" | jq '.summary.high')

echo "Benchmark Results:"
echo "  Total findings: $TOTAL"
echo "  High: $HIGH"