FROM node:alpine
RUN apk add --no-cache bash curl coreutils
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
ENV NVM_DIR="/root/.nvm"
RUN echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"' > /root/.bashrc
RUN echo -e '#! /bin/bash\n\
source /root/.bashrc\n\
bash -eo pipefail'\
>> /bin/entrypoint
RUN chmod 0755 /bin/entrypoint

ENTRYPOINT /bin/entrypoint
