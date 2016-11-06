FROM sitecore-iis

SHELL ["powershell", "-NoProfile", "-Command", "$ErrorActionPreference = 'Stop';"] 

ADD *.zip /Sitecore

RUN Expand-Archive -Path 'C:\Sitecore\Sitecore*.zip' -DestinationPath 'C:\Sitecore\Temp'; \
    Remove-Item 'C:\Sitecore\Sitecore*.zip' -Force;

RUN robocopy ((Resolve-Path -Path "C:\Sitecore\Temp\Sitecore*").Path) 'C:\Sitecore' /E /NP /NFL /NDL /NJH /NJS; \
    Remove-Item 'C:\Sitecore\Temp' -Recurse -Force;

RUN Remove-Item 'C:\Sitecore\Databases' -Recurse -Force;
