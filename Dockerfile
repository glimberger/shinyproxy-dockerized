FROM openjdk:8-jre

MAINTAINER Guillaume Limberger guillaume.limberger@lecnam.net

RUN mkdir -p /opt/shinyproxy/

COPY shinyproxy/target/shinyproxy-1.1.0.jar /opt/shinyproxy/shinyproxy.jar

COPY application.yml /opt/shinyproxy/application.yml

WORKDIR /opt/shinyproxy/
CMD ["java", "-jar", "/opt/shinyproxy/shinyproxy.jar"]