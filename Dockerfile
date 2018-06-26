FROM node

# Install packages needed for deployment
RUN apt-get update && \
    apt-get install -y \
    --no-install-recommends \
    ca-certificates \
    python3-dev \
    python3-pip \
    jq \
    rsync \
    unzip \
    ocaml \
    libelf-dev \
    locales \
    && rm -rf /var/lib/apt/lists/*
RUN pip3 install awscli

# Set locale
RUN sed -i 's/^# *\(en_GB.UTF-8\)/\1/' /etc/locale.gen && locale-gen
ENV LANG=en_GB.UTF-8

# Install nvm
USER node
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
ENV NVM_DIR="/home/node/.nvm"

# Set up nvm environment
USER root
COPY bash_profile /home/node/.bash_profile
RUN chown node:node /home/node/.bash_profile

# Install Docker (for remote builds)
RUN set -x &&\
    VER="latest" &&\
    curl -L -o /tmp/docker-$VER.tgz https://get.docker.com/builds/Linux/x86_64/docker-$VER.tgz &&\
    tar -xz -C /tmp -f /tmp/docker-$VER.tgz &&\
    mv /tmp/docker/* /usr/bin

# Install Terraform
ENV TERRAFORM_VERSION=0.11.7
RUN curl -o terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform.zip -d /usr/bin && rm -f terraform.zip
