FROM alpine:3.2

ARG NOMAD_VERSION=0.2.0
COPY gpg hashicorp.gpg
RUN apk add --update gnupg libc6-compat openssl && \
    wget -O nomad_${NOMAD_VERSION}_linux_amd64.zip https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip && \
    wget -O nomad_${NOMAD_VERSION}_SHA256SUMS https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_SHA256SUMS && \
    wget -O nomad_${NOMAD_VERSION}_SHA256SUMS.sig https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_SHA256SUMS.sig && \
    sha256sum -c nomad_${NOMAD_VERSION}_SHA256SUMS 2>/dev/null | grep linux_amd64 | grep OK && \
    gpg --import hashicorp.gpg && \
    gpg --verify nomad_${NOMAD_VERSION}_SHA256SUMS.sig nomad_${NOMAD_VERSION}_SHA256SUMS && \
    cd /usr/local/bin && \
    unzip /nomad_${NOMAD_VERSION}_linux_amd64.zip && \
    ln -s /lib /lib64 && \
    apk del gnupg openssl && \
    rm -rfv /hasicorp.gpg /nomad*

VOLUME /data
ENTRYPOINT ["/usr/local/bin/nomad"]
CMD ["agent", "-server", "-data-dir", "/data"]
