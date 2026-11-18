# IAM-JML-003 — Leaver: Employee Offboarding

**Scenario:** Simulated employee separation | **Account:** James Carter (`jcarter`) | **Directory:** `COOLTECHLAB.COM`

> Lab-only exercise with simulated HR authorization. No production HR ticket, approval workflow, or actual employee separation is claimed.

## Request

Disable the fictional employee's Active Directory account and remove Finance departmental security group membership. Preserve the account record for lab audit evidence.

## Pre-change baseline (reported PowerShell output)

| Attribute | Observed |
| --- | --- |
| Name | James Carter |
| Username | `jcarter` |
| Department | Finance |
| Title | Financial Systems Analyst |
| Enabled | True |
| Groups | `Domain Users`, `SG-Finance-Users` |

## Lab procedure

The following commands were provided for execution in the authorized lab:

```powershell
Disable-ADAccount -Identity "jcarter"
Remove-ADGroupMember -Identity "SG-Finance-Users" -Members "jcarter" -Confirm:$false
```

## Post-change verification (reported PowerShell output)

```text
Name           : James Carter
SamAccountName : jcarter
Department     : Finance
Title          : Financial Systems Analyst
Enabled        : False

Name
----
Domain Users
```

**Result: Passed at the Active Directory account and group-membership level.** The identity still exists, `Enabled` is `False`, and neither `SG-Finance-Users` nor `SG-IT-Users` appears in the returned group list. `Domain Users` remains present.

## Scope and limitations

A disabled AD account prevents normal new AD authentication, but this evidence does not independently verify termination of existing sessions, cloud identities, application-local accounts, access tokens, VPN sessions, or resource-specific permissions. No interactive login test or production approval was captured.

## Screenshot evidence (pending upload)

- [ ] `screenshots/11-leaver-before-account-status.png`
- [ ] `screenshots/12-leaver-before-group-membership.png`
- [ ] `screenshots/13-leaver-after-account-disabled.png`
- [ ] `screenshots/14-leaver-after-group-removal.png`

## Security takeaways

- Establish a baseline before making access changes.
- Disable accounts promptly under an authorized offboarding request.
- Remove obsolete departmental security group membership.
- Verify both account status and group membership afterward.
- Keep evidence claims bounded to the controls actually tested.
