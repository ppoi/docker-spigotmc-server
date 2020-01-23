# SpigotMC Docker image #

Docker image for [SpigotMC](https://www.spigotmc.org/), based on AlpineLinux 3.11 and OpenJDK11.

## 1. USAGE ##

````
docker run --detach --volume /path/to/datadir:/minecraft --publish 25565:25565 tbdev/spigotmc:latest
````

#### Volumes ####
- `/minecraft`: Minecraft(SpigotMC) server dir.

#### Ports ####
- `25565/tcp`: Minecraft(SpigotMC) service port.

## 2. Environment Variables ##

- `REVISION`: Revision number of SpigotMC. default:`1.15.2`
- `SPIGOT_BUILDTOOLS_URL`: URL of SpigotMC BuildTools.jar distribution. default:`https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar`
- `SPIGOT_BUILD_MEM`: Heap size for building SpigotMC server.jar. default:`1024M`
- `SPIGOT_SERVER_MEM`: Heap size for running SpigotMC server. default:`2G`
- `SPIGOT_SERVER_GC`: JVM GC Options for runnning SpigotMC server. default:`+UseConcMarkSweepGC`
- `SERVER_PORT`: TCP Port for SpigotMC server. specify appropriate number if you change port setting in your server.properties. default:`25565`
- `EULA`: if set `true`, then generate `eula.txt` as that is agree. default:`false`