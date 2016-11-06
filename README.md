# Socker = Sitecore :heart: Docker

Is is now possible to run Sitecore completely in Docker natively, you don't have to mess around with databases, IIS or anything, you don't even have to have SQL Server or IIS installed on your machine.

This repository shows how a solution running Sitecore is wired up for development with the following features:

- Databases is persisted between restarts
- Project output are automatically synced into running containers when changes are detected
- Remote debugging
- Streaming log output
- Load balancing multiple Sitecore instances

## Prerequisites

1. Windows 10 Anniversary update with latest updates
2. Docker for Windows v1.12.3-beta29.3 or later (beta channel: [https://download.docker.com/win/beta/InstallDocker.msi](https://download.docker.com/win/beta/InstallDocker.msi))

## Preparations

>NOTE: Base images are build and consumed locally in this example, but in a real life senario you would also push to an remote private repository like 
hub.docker.com, quay.io or an internal one, so that images can be shared within your organization.
Unfortunately it has to be **private** repositories due to Sitecore licensing terms so we can't share images in the community.

### Using Sitecore v8.1 rev. 160519

1. Copy **Sitecore 8.1 rev. 160519.zip** into **"/images/sitecore-81rev160519"**
2. Build private images:
	
	````
	docker build -t sitecore-iis .\images\sitecore-iis
	docker build -t sitecore:8.1.160519 .\images\sitecore-81rev160519
	````

3. Copy **license.xml** into **"/docker/web/Sitecore/Data"**
4. Copy database files from **Sitecore 8.1 rev. 160519.zip** into **"/docker/data"**

## Daily usage

### 1. Start containers

````
docker-compose build
docker-compose up
````

If you do not care about the output from containers you can start in "detached" mode with `docker-compose up -d` and then use `docker-compose stop` or `docker-compose down` to remove everything. 

### 2. Open solution

- Build
- Browse the IP of web container (IP is in the compose output or use `docker inspect`).
- Add files, edit code, build - watcher script updates the running containers...
	- Refresh browser, repeat...

#### Logs

You can attach to a container to watch output from Sitecore:

````
docker exec socker_web_1 powershell C:/Sitecore/Scripts/Stream-Log.ps1
````

#### Debugging

1. Open **Debug -> Attach to Process**
2. Click **Find** and select container under **Auto detected**
3. Select the **w3wp.exe** process
4. Click **Attach**

## More

### Using another Sitecore version

1. Copy **Sitecore 8.2 rev. 160729.zip** into **"/images/sitecore-82rev160729"**
2. Build private images:
	
	````
	docker build -t sitecore:8.2.160729 .\images\sitecore-82rev160729
	````

3. Change the version number in the **FROM** statement in **"/docker/web/Dockerfile"**
4. Replace "/src/WebApp/Web.config" with the Web.config from **Sitecore 8.2 rev. 160729.zip**
5. Copy database files from **Sitecore 8.2 rev. 160729.zip** into **"/docker/data"**

### Multiple Sitecore instances, load balanced

If you want to try out an loadbalanced environment you should also build [http://traefik.io](http://traefik.io) for Windows with:

````
docker build -t traefik:win .\images\traefik-win
````

You can then use `docker-compose --file .\docker-compose.scale.yml up` to start your containers.
