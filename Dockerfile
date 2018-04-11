#FROM jetty:9.3-jre8-alpine

#RUN apk add --no-cache bash
#ENV JETTY_HOME /usr/local/jetty
#ENV JETTY_BASE /var/lib/jetty

#COPY target/CounterWebApp.war $JETTY_BASE/webapps/CounterWebApp.war

#EXPOSE 8080
#WORKDIR $JETTY_BASE

FROM maven:3.5-jdk-8-alpine
WORKDIR /app
COPY . /app/mavendemo /app (2)
RUN mvn install (3)
FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=1 /app/target/spring-petclinic-1.5.1.jar /app (4)
#CMD ["java -jar spring-petclinic-1.5.1.jar"] (5)
