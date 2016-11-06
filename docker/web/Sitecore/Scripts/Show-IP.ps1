$ip = Get-NetAdapter | select -First 1 | Get-NetIPAddress | ? { $_.AddressFamily -eq "IPv4"} | select -Property IPAddress |  % { $_.IPAddress }

Write-Host ("{0}: Container IP {1}." -f [DateTime]::Now.ToString("HH:mm:ss:fff"), $ip)