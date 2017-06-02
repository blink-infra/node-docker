FROM node:alpine
RUN apk add --no-cache bash curl coreutils
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
ENV NVM_DIR="/root/.nvm"
RUN echo -e '#! /bin/bash\n\
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"\n\
nvm'\
>> /bin/nvm
RUN chmod 0755 /bin/nvm
