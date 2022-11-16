FROM debian:10

ARG PRIVATE_IP
ARG MINNAKER_VERSION
ENV PRIVATE_IP=${PRIVATE_IP}
ENV MINNAKER_VERSION=${MINNAKER_VERSION}

RUN apt-get update && \
    apt-get install -y curl \
    git \
    tar \ 
    sudo \
    iproute2 \
    uuid-runtime \
    systemd \
    initscripts

WORKDIR /spinnaker

RUN curl -Ls https://github.com/armory/minnaker/archive/v${MINNAKER_VERSION}.tar.gz -o "v${MINNAKER_VERSION}.tar.gz" && \
    tar -zxf "v${MINNAKER_VERSION}.tar.gz"

# Copying kubectl
COPY --from=bitnami/kubectl /opt/bitnami/kubectl/bin/kubectl /usr/bin/

WORKDIR /spinnaker/minnaker-${MINNAKER_VERSION}

# ENTRYPOINT [ "./scripts/install.sh" ]
# CMD ["-o" "-P" "$PRIVATE_IP"]