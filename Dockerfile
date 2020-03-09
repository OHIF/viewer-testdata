#
# BUILD: docker build --tag ohif/viewer-testdata:latest .
# RUN: docker run -p 5985:5985 -p 5984:5984 ohif/viewer-testdata:latest
#
FROM couchdb:2.3.1

# Install prerequisites
RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get -y install apt-utils \
	git-core \
	software-properties-common \
	nodejs \
	supervisor

# Grab Source
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
RUN git clone https://github.com/dcmjs-org/dicomweb-server.git /usr/src/app
RUN git pull
WORKDIR /usr/src/app

# Restore deps
RUN npm ci

# Override config
COPY ./config/server-config.js config/development.js

# Setup Entrypoint
COPY ./config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod 777 /usr/src/entrypoint.sh
RUN chmod 777 /usr/src/dicomweb-server-service.sh
RUN chmod 777 /usr/src/couchdb-service.sh

RUN npm install pouchdb-server

EXPOSE 5984
EXPOSE 5985
CMD ["supervisord", "-n"]