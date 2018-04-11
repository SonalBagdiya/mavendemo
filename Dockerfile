FROM jetty:9.3-jre8-alpine

#RUN apk add --no-cache bash
ENV JETTY_HOME /usr/local/jetty
ENV JETTY_BASE /var/lib/jetty

RUN  \
  export DEBIAN_FRONTEND=noninteractive && \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y vim wget curl git maven
COPY . /app 
RUN mvn install 
COPY target/CounterWebApp.war $JETTY_BASE/webapps/CounterWebApp.war

EXPOSE 8080
WORKDIR $JETTY_BASE

#FROM java:8

  
#WORKDIR /app
##CMD ["java -jar spring-petclinic-1.5.1.jar"] (5)
