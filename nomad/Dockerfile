FROM alpine:3.3

ENV NOMAD_VERSION=0.2.2 \
    NOMAD_SHA256=2de82ab923e93a91ce772caab6a4b96964269891fc413b380e270cfcee540586
RUN apk add --update ca-certificates wget && \
    wget -O /nomad_${NOMAD_VERSION}_linux_amd64.zip https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip && \
    echo "${NOMAD_SHA256}  nomad_${NOMAD_VERSION}_linux_amd64.zip" > /nomad.sha256 && \
    sha256sum -c /nomad.sha256 && \
    cd /usr/local/bin && \
    unzip /nomad_${NOMAD_VERSION}_linux_amd64.zip && \
    apk del ca-certificates wget && \
    rm -rfv /nomad* /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/nomad"]
