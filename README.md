# Socker = Sitecore :heart: Docker

Is is now possible to run Sitecore completely in Docker natively, you don't have to mess around with databases, IIS or anything, you don't even have to have SQL Server or IIS installed on your machine.
 
This repository shows how a solution running Sitecore is wired up for development with the following features:

- Databases is persisted between restarts
- Project output are automatically synced into running containers when changes are detected
- Load balancing multiple Sitecore instances
- Streaming log output

So why develop Sitecore solutions with Docker?

- Getting complete solutions up and running is *very* fast
- Isolate dependecies and versions (like Mongo, Solr, Windows patches) used for each solution without polluting your machine
- Minimize disk space usage, you only have 1 copy of each Sitecore version as a Docker images
- Potentially run your code inside the *same* container locally as in production 

## Prerequisites

1. Windows 10 Anniversary update with latest updates
2. Docker for Windows v1.12.3-beta29.2 or later (beta channel: [https://download.docker.com/win/beta/InstallDocker.msi](https://download.docker.com/win/beta/InstallDocker.msi))
3. Docker Compose 1.9.0-rc2 or later (latest: [https://ci.appveyor.com/project/docker/compose](https://ci.appveyor.com/project/docker/compose))

## Preparations

### Base images

1. Place Sitecore "Data" and "Website" folders in `/docker/sitecore-*/Sitecore`
2. Build private images:
	
````
docker build -t sitecore:8.1.160519 .\docker\sitecore-81rev160519
docker build -t traefik:win .\docker\traefik-win
````
	
### Solution

1. Place "license.xml" in `/docker/web/Sitecore/Data`
2. Place Sitecore databases in `/data`

## Daily usage

- Start containers:

````
docker-compose build
docker-compose up
````

- Open IP of web container in browser (IP is in the compose output)
- Open Socker.sln.
	- Add files, edit code, build - watcher script updates the running containers.
	- Refresh browser, repeat...
- When you're done, press CTRL+C to stop

If you do not care about the output from containers you can start in "detached" mode with `docker-compose up -d` and then use `docker-compose stop` or `docker-compose down` to remove everything. 

>TIP: You can attach to the web containers to watch output from Sitecore logs with `docker exec socker_web_1 powershell C:/Sitecore/UDP.ps1`

>TIP: You can start multiple Sitecore instances behind a load balancer with `docker-compose --file .\docker-compose.scale.yml up`