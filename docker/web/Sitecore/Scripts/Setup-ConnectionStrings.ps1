# Get environment variables
$sqlPassword = $env:sa_password
$sqlServer = $env:sql_server

Write-Host ("Sql server name '{0}'." -f $sqlServer)

# Update connection strings
$cfgPath = "C:\Sitecore\Website\App_Config\ConnectionStrings.config"
$cfg = Get-Content $cfgPath
$cfg.Replace("user;", "sa;").Replace("password;", "$sqlPassword;").Replace("(server);", "$sqlServer;") | Out-File $cfgPath -Encoding ASCII

# Show file updated
Write-Host ("{0}: Updated '{1}'." -f [DateTime]::Now.ToString("HH:mm:ss:fff"), $cfgPath)