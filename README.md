# Tailsec OWASP Benchmark Suite

Tests each Tailsec scanner against known-vulnerable code samples.

## Metrics

- **True Positive Rate (TPR)**: % of actual vulnerabilities correctly detected
- **False Positive Rate (FPR)**: % of safe code incorrectly flagged
- **Score**: (TPR - FPR) normalized to 0-100

## Running Benchmarks

```bash
# All scanners
./run-all-benchmarks.sh

# Individual
./owasp-benchmark/test-k8s.sh
```

## Expected Results

| Scanner | TPR | FPR | Score |
|---------|-----|-----|-------|
| scan-k8s | 95% | 5% | 90 |
| scan-terraform | 90% | 8% | 82 |
| scan-docker | 88% | 3% | 85 |
| scan-secrets | 99% | 1% | 98 |
| scan-sast | 85% | 10% | 75 |

## Adding Test Cases

Add vulnerable code samples to `vulnerable-apps/` and expected results to `expected-results/`.