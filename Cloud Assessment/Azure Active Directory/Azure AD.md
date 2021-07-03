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
### AzureAD Enumeration
```
$passwd = ConvertTo-SecureString "<>" -AsPlainText -Force
$creds = New-Object System.Management.Automation.PSCredential
("John@insomnia.onmicrosoft.com", $passwd)
Connect-AzureAD -Credential $creds
Get-AzureADCurrentSessionInfo
Get-AzureADTenantDetail
Get-AzureADUser -All $true
Get-AzureADUser -ObjectId emailid
Get-AzureADUser -SearchString "admin"
Get-AzureADUser -All $true |?{$_.Displayname -match "admin"}
Get-AzureADUser -ObjectId Emailid | fl *
Get-AzureADUser -All $true | ?{$_.OnPremisesSecurityIdentifier -ne $null}
Get-AzureADUser -All $true | ?{$_.OnPremisesSecurityIdentifier -eq $null}

```
