FROM debian:stable-20220622-slim

RUN apt-get update && \
    apt-get install python3-minimal -y && \
    apt-get install python3-pip -y

WORKDIR /app

RUN pip install --user pipenv
ENV PATH $PATH:/root/.local/bin
