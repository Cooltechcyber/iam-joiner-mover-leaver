# IAM-JML-001 — Joiner onboarding and account-status remediation

**Scenario:** Simulated new hire | **Identity:** James Carter (`jcarter`) | **Environment:** On-premises Active Directory, `COOLTECHLAB.COM`

## Request

Provision a fictional IT Support Specialist with standard IT departmental membership, verify attributes and account state, and document exceptions.

## Expected configuration

- Department: Information Technology
- Title: IT Support Specialist
- Enabled: True
- Membership: `SG-IT-Users`; no HR or Finance departmental groups

## Observed results

1. ADUC screenshots showed `IAM-Lab/Users` and `IAM-Lab/Groups`, including three departmental security groups.
2. PowerShell returned `James Carter | Information Technology | IT Support Specialist | Enabled False`.
3. A group-membership query returned `Domain Users` and `SG-IT-Users`.
4. The analyst ran `Enable-ADAccount -Identity "jcarter"`.
5. A subsequent query returned `James Carter | Enabled True | Information Technology | IT Support Specialist`.

## Finding and remediation

**Finding:** Account disabled during initial post-provisioning validation.

**Impact:** A disabled AD account cannot normally authenticate.

**Action:** Enabled the lab account following the simulated onboarding authorization.

**Verification:** Account enabled state changed from False to True. No interactive login test was captured.

**Root cause:** Undetermined; no evidence establishing why the account was disabled.

## Outstanding validation

- Re-run `Get-ADPrincipalGroupMembership jcarter` after the enable operation.
- Optionally test interactive sign-in in the lab.
- Attach screenshots using the evidence filenames in `screenshots/README.md`.

## Lessons learned

Account creation and group assignment do not replace post-provisioning validation. Evidence should distinguish account status, group membership, and actual resource access.
