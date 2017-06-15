FROM node
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
ENV NVM_DIR="/home/node/.nvm"
RUN mv /root/.nvm $NVM_DIR && chown -R node:node $NVM_DIR
RUN /bin/echo -e '#! /bin/bash\n\
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"\n\
nvm $@'\
>> /bin/nvm
RUN set -x &&\
    VER="latest" &&\
    curl -L -o /tmp/docker-$VER.tgz https://get.docker.com/builds/Linux/x86_64/docker-$VER.tgz &&\
    tar -xz -C /tmp -f /tmp/docker-$VER.tgz &&\
    mv /tmp/docker/* /usr/bin

RUN chmod 0755 /bin/nvm
