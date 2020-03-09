#
# BUILD: docker build --tag ohif/viewer-testdata:latest .
# RUN: docker run -p 5985:5985 -p 5984:5984 ohif/viewer-testdata:latest
#
FROM node:13.10.1-slim

# Install prerequisites
RUN apt-get update
RUN apt-get -y install git-core \
	supervisor

# Grab Source
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
RUN git clone https://github.com/dcmjs-org/dicomweb-server.git /usr/src/app
RUN git pull
WORKDIR /usr/src/app

# Restore deps
RUN npm ci
RUN npm install pouchdb-server

# Override config
COPY ./config/server-config.js config/development.js

# Copy the script to run dicomweb-server
COPY ./config/dicomweb-server-service.sh /usr/src/dicomweb-server-service.sh
RUN chmod 777 /usr/src/dicomweb-server-service.sh

# Setup Supervisord
COPY ./config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 5984 5985
CMD ["supervisord", "-n"]