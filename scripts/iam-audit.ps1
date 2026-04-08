# iam-audit.ps1
# Purpose: Export ESET Protect user roles and permissions for HIPAA audit evidence.
# Requirements: ESET Protect API credentials stored as GitHub Secrets (if used in CI).

param(
    [Parameter(Mandatory=$false)]
    [string]$ApiUrl = "https://your-eset-protect-instance.com/api/v1.0",
    
    [Parameter(Mandatory=$false)]
    [string]$OutputFile = "eset-iam-audit.csv"
)

Write-Host "[*] Connecting to ESET Protect API at $ApiUrl"

# In a real environment, you would authenticate and query:
# $token = Get-EsetToken -Credential $cred
# $users = Invoke-EsetApi -Endpoint "/users" -Token $token

# Simulated output for demonstration
$auditData = @(
    [PSCustomObject]@{ User = "admin@healthcare.com"; Role = "Super Admin"; MFA = $true; LastLogin = "2025-03-15" },
    [PSCustomObject]@{ User = "tech@msp.com"; Role = "Endpoint Manager"; MFA = $false; LastLogin = "2025-03-14" },
    [PSCustomObject]@{ User = "auditor@clinic.org"; Role = "Read-Only Auditor"; MFA = $true; LastLogin = "2025-03-10" }
)

$auditData | Export-Csv -Path $OutputFile -NoTypeInformation
Write-Host "[+] IAM audit saved to $OutputFile"
Write-Host "[!] Action Item: Users with MFA=false require remediation per HIPAA 164.312(d)."
