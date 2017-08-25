
FROM		centos:7
MAINTAINER 	JAkub Scholz "www@scholzj.com"

# Install needed software and users
USER root
RUN groupadd -r circleci && useradd -r -d /home/circleci -m -g circleci circleci
RUN yum install -y git tar curl wget gcc sudo && yum clean all
RUN echo "%circleci        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

# Install golang
RUN curl -s https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz | tar -xz -C /usr/local
ENV PATH /usr/local/go/bin:/home/circleci/go/bin:$PATH
ENV GOPATH /home/circleci/go

USER circleci
