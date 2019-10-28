#
# BUILD: docker build -t dicomweb-server:latest .
#
FROM node:10.16.3-slim

# Install Git
RUN apt-get update
RUN apt-get -y install git-core
RUN git --version
RUN git config --global user.name "dannyrb"
RUN git config --global user.email "danny.ri.brown@gmail.com"

# Grab Source
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
RUN git clone git://github.com/dcmjs-org/dicomweb-server /usr/src/app
WORKDIR /usr/src/app

# Restore deps
RUN npm ci

# Override config
COPY ./config/server-config.js config/development.js

# Setup Entrypoint
COPY ./config/entrypoint.sh /usr/src/
RUN chmod 777 /usr/src/entrypoint.sh

EXPOSE 5985
ENTRYPOINT npm start

## Currently unused
# CMD [ "node", "server.js" ]
# ["/usr/src/entrypoint.sh"]
# CMD ["nginx", "-g", "daemon off;"]