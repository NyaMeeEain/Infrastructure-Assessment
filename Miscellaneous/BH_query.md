### ASREPRoasting
```
MATCH (u:User {dontreqpreauth:true}), (c:Computer), p=shortestPath((u)-[*1..]->(c)) RETURN p
```

### Kerberoasting
```
MATCH (u:User {hasspn:true}) RETURN u
MATCH (u:User {hasspn:true}), (c:Computer), p=shortestPath((u)-[*1..]->(c)) RETURN p

```

### Unconstrained Delegation
```
MATCH (c:Computer {unconstraineddelegation:true}) RETURN c
MATCH (u:User {owned:true}), (c:Computer {unconstraineddelegation:true}), p=shortestPath((u)-[*1..]->(c)) RETURN p

```
