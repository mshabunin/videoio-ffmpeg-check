FROM ubuntu:20.04

RUN \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
        build-essential \
        software-properties-common \
        pkg-config \
        git wget ccache xz-utils cmake ninja-build yasm

WORKDIR /scripts
