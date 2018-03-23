$ErrorActionPreference = "STOP"

docker build -t sitecore-iis .\images\sitecore-iis
docker build -t sitecore:8.2.170728 .\images\sitecore-82rev170728
#docker build -t traefik:win .\images\traefik-win