FROM microsoft/windowsservercore

RUN mkdir C:\Sitecore\Website \
    && powershell -NoProfile -Command \
        Add-WindowsFeature Web-Server; \
        Add-WindowsFeature NET-Framework-45-ASPNET; \
        Add-WindowsFeature Web-Asp-Net45; \
        Import-Module IISAdministration; \        
        Import-Module WebAdministration; \
        New-IISSite -Name 'Sitecore' -PhysicalPath 'C:\Sitecore\Website' -BindingInformation '*:80:'; \
        Set-ItemProperty 'IIS:\apppools\DefaultAppPool' -Name 'enable32BitAppOnWin64' -Value 'True'; \
        Remove-IISSite -Name 'Default Web Site' -Confirm:$false;

EXPOSE 80

ADD Sitecore/ /Sitecore