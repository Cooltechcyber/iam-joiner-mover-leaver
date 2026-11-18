# IAM-JML-001: read-only validation commands plus documented corrective action.
# Run only in the authorized COOLTECHLAB.COM lab environment.
Import-Module ActiveDirectory

# Verify user attributes and enabled state
Get-ADUser -Identity "jcarter" -Properties Enabled,Department,Title |
    Select-Object Name,Enabled,Department,Title

# Verify departmental group memberships
Get-ADPrincipalGroupMembership -Identity "jcarter" |
    Select-Object Name

# Corrective action performed during the lab (intentionally commented out).
# Run only when authorization has been confirmed:
# Enable-ADAccount -Identity "jcarter"
