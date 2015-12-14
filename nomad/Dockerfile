FROM frolvlad/alpine-glibc:3.2

ENV NOMAD_VERSION=0.2.1 \
    NOMAD_SHA256=a47881efc148cc37a8c94fb120c1d198371b9124e92668e8fc0badddef99cc2a
RUN apk add --update ca-certificates wget && \
    wget -O /nomad_${NOMAD_VERSION}_linux_amd64.zip https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip && \
    echo "${NOMAD_SHA256}  nomad_${NOMAD_VERSION}_linux_amd64.zip" > /nomad.sha256 && \
    sha256sum -c /nomad.sha256 && \
    cd /usr/local/bin && \
    unzip /nomad_${NOMAD_VERSION}_linux_amd64.zip && \
    apk del ca-certificates wget && \
    rm -rfv /nomad* /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/nomad"]
