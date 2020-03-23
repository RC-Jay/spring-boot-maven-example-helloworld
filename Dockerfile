FROM openjdk:8-jdk-alpine
MAINTAINER EmailHere

# Install Maven
RUN apk add --no-cache curl tar bash
ARG MAVEN_VERSION=3.3.9
ARG USER_HOME_DIR="/root"
RUN mkdir -p /usr/share/maven && \
curl -fsSL http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar -xzC /usr/share/maven --strip-components=1 && \
ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"
# speed up Maven JVM a bit
ENV MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1"
ENTRYPOINT ["/usr/bin/mvn"]

RUN mvn clean compile package -DskipTests=false test
COPY target/FinalApp.SNAPSHOT.jar /opt/springBoot/lib/

ENTRYPOINT ["/usr/bin/java"]
CMD ["-jar", "/opt/springBoot/lib/FinalApp.SNAPSHOT.jar"]
VOLUME /var/lib/springBoot/configRepo
EXPOSE 8888