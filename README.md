# TinyMe Test Project

Test project for TinyMe CI/CD pipeline with FastAPI, PostgreSQL, and Redis.

## Quick Start

```bash
pip install -r requirements.txt
pytest
```

## CI/CD Pipeline

The pipeline includes 16 stages:
1. Lint (ruff)
2. Secrets Scan (trufflehog)
3. SAST Scan (bandit + semgrep)
4. Test (pytest with PostgreSQL and Redis services)
5. Build (Python package)
6. SBOM Generation (cyclonedx)
7. Docker Build
8. Container Signing (cosign)
9. Vulnerability Scan (trivy)
10. Policy Check (conftest)
11. Deploy Staging (helm)
12. Smoke Test
13. Approval Gate
14. Deploy Production (helm)
15. Health Check
16. Rollback Ready
