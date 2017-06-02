FROM node:alpine
RUN apk add --no-cache bash build-base curl coreutils python2
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
ENV NVM_DIR="/home/node/.nvm"
RUN mv /root/.nvm $NVM_DIR && chown -R node:node $NVM_DIR
RUN echo -e '#! /bin/bash\n\
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"\n\
nvm $@'\
>> /bin/nvm
RUN chmod 0755 /bin/nvm
