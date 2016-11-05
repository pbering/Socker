FROM sitecore:8.2.160729

SHELL ["powershell", "-NoProfile", "-Command", "$ErrorActionPreference = 'Stop';"] 

ADD Sitecore/ /Sitecore

CMD C:\Sitecore\Scripts\Setup-ConnectionStrings.ps1; \
    C:\Sitecore\Scripts\Show-IP.ps1; \
    C:\Sitecore\Scripts\Watch-Directory.ps1 -Path 'C:\Workspace' -Destination 'C:\Sitecore\Website'