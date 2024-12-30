FROM ubuntu:latest

RUN apt-get -y update && \
    apt-get install -y zip && \
    apt-get clean

COPY . /cmscriptsVolume