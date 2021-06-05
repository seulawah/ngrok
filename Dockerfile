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
    


# Set environment variables.
ENV HOME /

# Define working directory.
WORKDIR /

RUN echo root:kunemuse | chpasswd
RUN mkdir -p /var/run/sshd
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "LD_LIBRARY_PATH=/usr/lib64-nvidia" >> /root/.bashrc
RUN echo "export LD_LIBRARY_PATH" >> /root/.bashrc

RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip

RUN unzip ngrok-stable-linux-amd64.zip

RUN chmod +x ngrok
RUN ./ngrok tcp 22

