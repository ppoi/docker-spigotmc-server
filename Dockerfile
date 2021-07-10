FROM alpine:3.11

RUN apk add --no-cache openjdk11-jdk git curl python3  && pip3 install mcstatus && mkdir /minecraft /spigot-tools

ADD spigotmc /spigot-tools

EXPOSE 25565 8123
VOLUME /minecraft

ENV REVISION="1.16.1" \
    SPIGOT_BUILDTOOLS_URL="https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar" \
    SPIGOT_BUILD_MEM="1024M" \
    SPIGOT_SERVER_MEM="2G" \
    SPIGOT_SERVER_GC="+UseConcMarkSweepGC" \
    SERVER_PORT=25565 \
    EULA="false"

HEALTHCHECK --start-period=1m CMD /usr/bin/mcstatus localhost:$SERVER_PORT ping

WORKDIR /minecraft
ENTRYPOINT ["/bin/sh", "/spigot-tools/spigotmc"]
CMD []