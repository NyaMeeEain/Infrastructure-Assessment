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
### Groups and Members Enumerations
**Microsoft 365**. Provides collaboration opportunities by giving members access to a shared mailbox, calendar, files, SharePoint site, and more. 
**Security**. Used to manage member and computer access to shared resources for a group of users. For example, you can create a security group for a specific security policy. By doing it this way, you can give a set of permissions to all the members at once, instead of having to add permissions to each member individually. A security group can have users, devices, groups and service principals as its members and users and service principals as its owners. 

**Assigned**. Lets you add specific users to be members of this group and to have unique permissions. 
**Dynamic user**. Lets you use dynamic membership rules to automatically add and remove members.
**Dynamic device**. Lets you use dynamic group rules to automatically add and remove devices.

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
### Roles and Permissions Enumerations
Account Administrator, Service Administrator, and Co-Administrator are the three classic subscription administrator roles in Azure.Classic subscription administrators have full access to the Azure subscription. They can manage resources using the Azure portal.The Service Administrator and the Co-Administrators have the equivalent access of users who have been assigned the Owner role.

**Account Administrator**

**Service Administrator**

**Co-Administrator**



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
### Azure App Service Enumeration
Azure App Service is an HTTP-based service for hosting web applications, REST APIs, and mobile back ends
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


### Reference 
** https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/

** https://docs.microsoft.com/en-us/powershell/module/azuread/get-azureadserviceprincipal?view=azureadps-2.0

** https://bootcamps.pentesteracademy.com/course/ad-azure-jun-21
