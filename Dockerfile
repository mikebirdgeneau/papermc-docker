# JRE base
FROM arm64v8/openjdk:8-jre-slim

# Environment variables
ENV MC_VERSION="1.16.4" \
    PAPER_BUILD="latest" \
    MC_RAM="1G" \
    JAVA_OPTS=""

# Dependencies
ADD papermc.sh .
RUN apt-get update \
    apt-get install -y wget \
    apt-get install -y jq \
    rm -rf /var/lib/apt/lists/* \
    mkdir /papermc

# Start script
CMD ["sh", "./papermc.sh"]

# Container setup
EXPOSE 25565/tcp
EXPOSE 25565/udp
VOLUME /papermc
