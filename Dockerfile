# wiremock Dockerfile
#
# https://github.com/carlosroman/docker-wiremock
#

# Pull base image.
FROM openjdk:8-alpine

ENV WM_PKG_NAME wiremock-standalone
ENV WM_VERSION 2.6.0

RUN apk --no-cache --virtual .build-dependencies add wget \
    && apk --no-cache --upgrade add ca-certificates \
    && update-ca-certificates --fresh \
    && cd / \
    && wget https://repo1.maven.org/maven2/com/github/tomakehurst/$WM_PKG_NAME/$WM_VERSION/$WM_PKG_NAME-$WM_VERSION.jar \
    && mkdir -p /opt/wiremock/ \
    && apk del .build-dependencies \
    && mv $WM_PKG_NAME-$WM_VERSION.jar /opt/wiremock/wiremock.jar

# Define mountable directories.
VOLUME ["/wiremock/__files", "/wiremock/mappings"]

WORKDIR /wiremock

# Define default command.
ENTRYPOINT exec java -jar /opt/wiremock/wiremock.jar
# ENTRYPOINT pwd && ls -la

# Expose ports.
#   - 8080: HTTP
EXPOSE 8080

