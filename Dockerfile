
FROM		centos:7
MAINTAINER 	JAkub Scholz "www@scholzj.com"

# Install needed software and users
USER root
RUN groupadd -r circleci && useradd -r -d /home/circleci -m -g circleci circleci
RUN yum install -y git tar curl wget gcc sudo && yum clean all
RUN echo "%circleci        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

# Install golang
RUN curl -o /tmp/golang.tar.gz https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz && tar -C /usr/local -xzf /tmp/golang.tar.gz
ENV PATH /usr/local/go/bin:$PATH

USER circleci