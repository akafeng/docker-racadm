FROM debian:bookworm-slim AS builder

ARG RACADM_VERSION="11.3.0.0"

RUN set -eux \
    && apt-get update -qyy \
    && apt-get install -qyy --no-install-recommends --no-install-suggests \
        openssl \
        ca-certificates \
        libargtable2-0 \
        iputils-ping \
    && rm -rf /var/lib/apt/lists/* /var/log/* \
    \
    && ln -sf /usr/lib/x86_64-linux-gnu/libssl.so.3 /usr/lib/x86_64-linux-gnu/libssl.so \
    && ldconfig

COPY file/idracadm7_${RACADM_VERSION} /usr/local/bin/racadm

ENTRYPOINT ["/usr/local/bin/racadm"]
