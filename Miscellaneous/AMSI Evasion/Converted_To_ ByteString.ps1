$byteArray = [IO.File]::ReadAllBytes("$pwd\\Source.dll")
$keyArray = @(12, 85, 65)
$keyPosition = 0
for($i=0; $i -lt $byteArray.count ; $i++)
				{
					 $byteArray[$i] = $byteArray[$i] -bxor $KeyArray[$keyposition]
				 	 $keyposition += 1
				 	 if ($keyposition -eq $keyArray.Length) {$keyposition = 0}
				}
$byteString = ($byteArray | ForEach-Object ToString) -join ','
$byteString