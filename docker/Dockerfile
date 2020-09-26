FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
            build-essential \
            cmake \
            libssl-dev \
            zlib1g-dev \
            ccache \
            openjdk-8-jdk \
            git

WORKDIR /workdir

COPY docker/example example
COPY docker/entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT [ "/workdir/entrypoint.sh" ]
