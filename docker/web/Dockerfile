FROM sitecore:8.2.170728

SHELL ["powershell", "-NoProfile", "-Command", "$ErrorActionPreference = 'Stop';"] 

ADD https://go.microsoft.com/fwlink/?LinkId=615470&clcid=0x409 C:/Sitecore/rtools_setup_x64.exe

RUN C:\Sitecore\rtools_setup_x64.exe /quiet /norestart; \
    while(ps rtools*) { Start-Sleep -Seconds 5 }; \
    Remove-Item C:\Sitecore\rtools_setup_x64.exe -Force;
    
ADD Sitecore/ /Sitecore

CMD C:\Sitecore\Scripts\Setup-ConnectionStrings.ps1; \
    C:\Sitecore\Scripts\Show-IP.ps1; \
    C:\Sitecore\Scripts\Start-RemoteDebug.ps1; \
    C:\Sitecore\Scripts\Watch-Directory.ps1 -Path 'C:\Workspace' -Destination 'C:\Sitecore\Website'