FROM nginx:latest
MAINTAINER Yakhub
ARG Value=80
EXPOSE ${Value}
VOLUME ["/STORAGE"]
RUN apt-get update && apt-get install curl -y
RUN mkdir dir1
WORKDIR /dir1
ENV USER=dummyuser