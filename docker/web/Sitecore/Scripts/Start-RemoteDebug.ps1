Write-Host ("{0}: Starting 'msvsmon.exe'..." -f [DateTime]::Now.ToString("HH:mm:ss:fff"))

& "C:\Program Files\Microsoft Visual Studio 14.0\Common7\IDE\Remote Debugger\x86\msvsmon.exe" /silent /noauth /anyuser;

Write-Host ("{0}: Started 'msvsmon.exe' on port 4020." -f [DateTime]::Now.ToString("HH:mm:ss:fff"))