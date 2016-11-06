$ErrorActionPreference = "STOP"

docker build -t sitecore-iis .\images\sitecore-iis
docker build -t sitecore:8.2.160729 .\images\sitecore-82rev160729
docker build -t sitecore:8.1.160519 .\images\sitecore-81rev160519
docker build -t traefik:win .\images\traefik-win