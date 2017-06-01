FROM node:alpine
RUN apk add --no-cache bash curl
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
ENV NVM_DIR="/root/.nvm"
RUN echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"' > /root/.bashrc

ENTRYPOINT /bin/bash
