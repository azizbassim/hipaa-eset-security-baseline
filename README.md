# hipaa-eset-security-baseline
Security controls and automation scripts for HIPAA-compliant endpoint protection using ESET Protect.
# HIPAA & ESET Security Baseline

## Objective
This project demonstrates a security controls framework for healthcare organizations using **ESET Protect** to meet specific **HIPAA Security Rule** requirements (45 CFR Part 164.312).

## Mapped Controls
| HIPAA Requirement | ESET Implementation | Automation Script |
|-------------------|---------------------|--------------------|
| 164.312(a)(1) - Access Control | ESET IAM & User Roles | `scripts/iam-audit.ps1` |
| 164.312(e)(1) - Transmission Security | ESET SSL/TLS Enforcement | `scripts/tls-policy.json` |
| 164.312(b) - Audit Controls | ESET Log Collection | `scripts/log-export.py` |

## Scripts Overview
- **`iam-audit.ps1`**: PowerShell script to export ESET user roles and permissions for audit review.
- **`tls-policy.json`**: Example policy configuration for enforcing encrypted communication.
- **`log-export.py`**: Python script using ESET Protect API to pull security logs.

## How to Use (for MSP Partners)
1. Clone this repository.
2. Ensure you have ESET Protect Cloud API credentials.
3. Run scripts in a test environment first.
4. Adapt JSON policies to your organizational hierarchy.

## Future Enhancements
- GitHub Action to validate JSON policy syntax.
- Integration with Netlify for policy documentation hosting.
