FROM openjdk:8-jdk-alpine
MAINTAINER EmailHere
COPY target/FinalApp.SNAPSHOT.jar /opt/springBoot/lib/

ENTRYPOINT ["/usr/bin/java"]
CMD ["-jar", "/opt/springBoot/lib/FinalApp.SNAPSHOT.jar"]
VOLUME /var/lib/springBoot/configRepo
EXPOSE 8888