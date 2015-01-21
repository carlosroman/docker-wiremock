# wiremock Dockerfile
#
# https://github.com/carlosroman/docker-wiremock
#

# Pull base image.
FROM dockerfile/java:oracle-java8

ENV WM_PKG_NAME wiremock
ENV WM_VERSION 1.53

RUN \
  cd / && \
  wget https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock/$WM_VERSION/$WM_PKG_NAME-$WM_VERSION-standalone.jar && \
  mkdir /$WM_PKG_NAME && mv $WM_PKG_NAME-$WM_VERSION-standalone.jar /$WM_PKG_NAME/$WM_PKG_NAME.jar

# Define mountable directories.
VOLUME ["/wiremock/__files", "/wiremock/mappings"]

WORKDIR /wiremock

# Define default command.
ENTRYPOINT exec java -jar wiremock.jar
# ENTRYPOINT pwd && ls -la

# Expose ports.
#   - 8080: HTTP
EXPOSE 8080

