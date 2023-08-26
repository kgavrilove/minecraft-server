FROM alpine:latest

RUN apk --update add wget git

RUN apk add openjdk17-jre-headless

WORKDIR /minecraft

RUN wget -O paper.jar https://api.papermc.io/v2/projects/paper/versions/1.20.1/builds/164/downloads/paper-1.20.1-164.jar

RUN mkdir server

COPY /minecraft/server/eula.txt /minecraft/server

RUN mv paper.jar server/paper.jar

EXPOSE ${MINECRAFT_PORT}

CMD ["sh", "-c", "java -Xms${MIN_MEMORY}G -Xmx${MAX_MEMORY}G -jar server/paper.jar --nogui"]
