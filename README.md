# Sitecore :heart: Docker = Socker

...

## Prerequisites

1. Windows 10 Anniversary update with latest updates
2. Docker for Windows v1.12.3-beta29.2 or later
3. Docker Compose 1.9.0-rc2 or later (Get it from [https://ci.appveyor.com/project/docker/compose](https://ci.appveyor.com/project/docker/compose))

## Preperations

1. Place Sitecore "Data" and "Website" folders in `/docker/sitecore-*/Sitecore`
2. Place license.xml in `/docker/sitecore-*/Sitecore/Data`
3. Build private images:

````
docker build -t sitecore:8.1.160519 .\docker\sitecore-81rev160519
docker build -t traefik:win .\docker\traefik-win
````

## Usage

- Start containers:

````
docker-compose build
docker-compose up
````
- Open IP of web container in browser (IP is in the compose output)
- Open Socker.sln.
	- Add files, edit code, build - watcher script updates the running containers.
	- Refresh browser, repeat...
- When you're done:

````
docker-compose down
````

>TIP: You can try running multiple Sitecore instances behind a load balancer with `docker-compose up --file .\docker-compose.scale.yml`