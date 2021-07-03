### Azure Active Directory
Application Service Principals part of Azure AD which allows an authenticated user to enumerate. If you are able to access Office 365 services, you are part of Azure Active Directory to enumerate the authenticated user within Azure AD environment. 

```
az ad user list --output=table --query='[].{Created:createdDateTime,UPN:userPrincipalName,Name:displayName,Email:mail,UserId:mailNickname,Enabled:accountEnabled}'
az ad sp list --output=table --query='[].{Name:displayName,Enabled:accountEnabled,URL:homepage,Publisher:publisherName,MetadataURL:samlMetadataUrl}'
```

### Enumeration
```
Get-AADIntLoginInformation -UserName <>
Get-AADIntTenantID -Domain <>
Get-AADIntTenantDomains -Domain <>
Invoke-AADIntReconAsOutsider -DomainName <>
```
