FROM debian:13-slim

COPY src/run.sh /usr/local/bin/



RUN chmod -R +x /usr/local/bin/*; \
    apt-get update; \
    apt-get -y install curl \
                    gcc \
                    yasm \
                    gnutls-dev \
                    libunistring-dev \
                    pkg-config \
                    make



RUN [run.sh]