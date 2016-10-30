FROM sitecore:8.1.160519

SHELL ["powershell", "-NoProfile", "-Command", "$ErrorActionPreference = 'Stop';"] 

RUN Set-Itemproperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name ServerPriorityTimeLimit -Value 0 -Type DWord

ADD /Sitecore /Sitecore

CMD C:\Sitecore\Setup.ps1; C:\Sitecore\Watch.ps1 -Path 'C:\Workspace' -Destination 'C:\Sitecore\Website'