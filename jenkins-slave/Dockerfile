FROM jenkins/inbound-agent:latest

WORKDIR /home/jenkins

USER 0

RUN apt-get update && \
    apt-get install -qy net-tools \
        curl

# Docker installation
RUN curl -sSL https://get.docker.com/ | sh