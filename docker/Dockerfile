FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
            build-essential \
            wget \
            libssl-dev \
            zlib1g-dev \
            ccache \
            openjdk-8-jdk \
            git && \
    wget -qO- "https://cmake.org/files/v3.18/cmake-3.18.3-Linux-x86_64.tar.gz" \
        | tar --strip-components=1 -xz -C /usr/local

WORKDIR /workdir

COPY docker/entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT [ "/workdir/entrypoint.sh" ]
