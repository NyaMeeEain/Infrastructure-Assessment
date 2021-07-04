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
$Username = "<>"
$Password = "<>"
$Pass = ConvertTo-SecureString $Password -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential `
($Username, $Pass)
```
### AAD Basic Enumeration
```
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
### Objects Enumeration
```
Get-AzureADUser | Get-AzureADUserCreatedObject
Get-AzureADUserOwnedObject -ObjectId <Email>
```
### Groups Enumerations
```
Get-AzureADGroup -All $true
Get-AzureADGroup -ObjectId <ObjectID>
Get-AzureADGroup -SearchString "Soe" | fl *
Get-AzureADGroup -All $true |?{$_.Displayname -match "admin"}
Get-AzureADMSGroup | ?{$_.GroupTypes -eq 'DynamicMembership'}
Get-AzureADGroup -All $true | ?{$_.OnPremisesSecurityIdentifier -ne $null}
Get-AzureADGroup -All $true | ?{$_.OnPremisesSecurityIdentifier -eq $null}
Get-AzureADGroupMember -ObjectId <ObjecID> #Members of Group
Get-AzureADUser -SearchString 'Admin' | GetAzureADUserMembership
Get-AzureADUserMembership -ObjectId <Email>
```
### Roles Enumerations
Account Administrator, Service Administrator, and Co-Administrator are the three classic subscription administrator roles in Azure.

**Account Administrator**
**Service Administrator**
**Co-Administrator**
Classic subscription administrators have full access to the Azure subscription. They can manage resources using the Azure portal.The Service Administrator and the Co-Administrators have the equivalent access of users who have been assigned the Owner role.

```
Get-AzureADDirectoryRole
Get-AzureADDirectoryRole -Filter "DisplayName eq 'GlobalAdministrator'" | Get-AzureADDirectoryRoleMember
```
### Devices Enumeration
```
Get-AzureADDevice -All $true | fl *
Get-AzureADDeviceConfiguration | fl *
Get-AzureADDevice -All $true | Get-AzureADDeviceRegisteredOwner
Get-AzureADDevice -All $true | Get-AzureADDeviceRegisteredUser
Get-AzureADUserOwnedDevice -ObjectId <Email>
```
### Apps Enumeration
```
Get-AzureADApplication -All $true
et-AzureADApplication -ObjectId <ObjectID> | fl *
Get-AzureADApplication -All $true | ?{$_.DisplayName -match "app"}

```
### Application and service principal objects 
AD application is defined by its one and only application object, which resides in the Azure AD tenant where the application was registered.an application must be registered with an Azure AD tenant. When you register your application with Azure AD, you're creating an identity configuration for your application that allows it to integrate with Azure AD.
```
Get-AzureADServicePrincipal | GetAzureADServicePrincipalMembership
Get-AzureADServicePrincipal -ObjectId <objectID> | Get-AzureADServicePrincipalOwner |fl *
Get-AzureADServicePrincipal -ObjectId <ObjectID> | Get-AzureADServicePrincipalOwnedObject
Get-AzureADServicePrincipal -ObjectId <ObjectID> | Get-AzureADServicePrincipalCreatedObject
Get-AzureADServicePrincipal -ObjectId <ObjectID> | GetAzureADServicePrincipalMembership |fl *
```
