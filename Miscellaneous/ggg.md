```
certutil -encode 20200321162811_BloodHound.zip test.txt
type test.txt
echo -n "<base64-encoded-value>" | base64 -d > bloodhound-result.zip
```
