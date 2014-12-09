# wiremock Dockerfile
#
# https://github.com/carlosroman/docker-wiremock
#

# Pull base image.
FROM dockerfile/java:oracle-java8

ENV WM_PKG_NAME wiremock
ENV WM_VERSION 1.52

RUN \
  cd / && \
  wget https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock/$WM_VERSION/$WM_PKG_NAME-$WM_VERSION-standalone.jar && \
  mkdir /$WM_PKG_NAME && mv $WM_PKG_NAME-$WM_VERSION-standalone.jar /$WM_PKG_NAME/$WM_PKG_NAME.jar

# Define mountable directories.
VOLUME ["/data"]

# Define default command.
# CMD ["java -jar /wiremock/wiremock.jar"]
ENTRYPOINT ["java", "-jar", "/wiremock/wiremock.jar"]

# Expose ports.
#   - 8080: HTTP
EXPOSE 8080

