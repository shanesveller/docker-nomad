FROM alpine:3.3

ENV NOMAD_VERSION=0.3.1 \
    NOMAD_SHA256=467fcebe9f0a349063a4f16c97cb71d9c57451fc1f10cdb2292761cf56542671
RUN apk add --no-cache --update ca-certificates wget && \
    wget -O /nomad_${NOMAD_VERSION}_linux_amd64.zip https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip && \
    echo "${NOMAD_SHA256}  nomad_${NOMAD_VERSION}_linux_amd64.zip" > /nomad.sha256 && \
    sha256sum -c /nomad.sha256 && \
    cd /usr/local/bin && \
    unzip /nomad_${NOMAD_VERSION}_linux_amd64.zip && \
    apk del ca-certificates wget && \
    rm -rfv /nomad* /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/nomad"]
