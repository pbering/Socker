$ErrorActionPreference = "STOP"

docker build -t sitecore-iis .\docker\sitecore-iis
docker build -t sitecore:8.2.160729 .\docker\sitecore-82rev160729
docker build -t sitecore:8.1.160519 .\docker\sitecore-81rev160519
docker build -t traefik:win .\docker\traefik-win