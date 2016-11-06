FROM microsoft/nanoserver

SHELL ["powershell", "-NoProfile", "-Command", "$ErrorActionPreference = 'Stop';"] 

ADD . /server/
ADD https://github.com/containous/traefik/releases/download/v1.1.0-rc3/traefik_windows-amd64 C:/server/traefik.exe

RUN Get-ChildItem -Path "C:\server" -Recurse | % { Unblock-File $_.FullName }

EXPOSE 80 8080

WORKDIR /server

ENTRYPOINT & .\traefik.exe