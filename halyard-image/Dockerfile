FROM us-docker.pkg.dev/spinnaker-community/docker/halyard:stable

USER 0

RUN apk update && \
    apk add -q --no-progress git

WORKDIR /app
ADD install_krew.sh install_krew.sh
RUN ./install_krew.sh

ADD entrypoint.sh entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]