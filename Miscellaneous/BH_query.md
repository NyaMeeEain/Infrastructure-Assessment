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
