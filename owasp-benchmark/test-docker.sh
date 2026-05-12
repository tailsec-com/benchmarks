#!/bin/bash
set -e

SCANNER="scan-docker"
MANIFESTS="./vulnerable-apps"
RESULTS="./results/docker-benchmark.json"

echo "Running $SCANNER on $MANIFESTS..."

$SCANNER "$MANIFESTS" --format json --type dockerfile > "$RESULTS"

# Calculate metrics
TOTAL=$(cat "$RESULTS" | jq '.summary.total')
CRITICAL=$(cat "$RESULTS" | jq '.summary.critical')

echo "Benchmark Results:"
echo "  Total findings: $TOTAL"
echo "  Critical: $CRITICAL"