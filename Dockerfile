FROM adoptopenjdk/openjdk11:alpine-jre

LABEL maintainer="alkoclick@gmail.com"

RUN rm -rf $JAVA_HOME
