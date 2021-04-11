FROM jenkins/jenkins:lts

#using root to run the below script
USER root
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y git curl dpkg gpg tar npm \
    && rm -rf /var/lib/apt/lists/*

# install sfdx
ARG SALESFORCE_CLI_VERSION=latest
ENV DEBIAN_FRONTEND=noninteractive
RUN npm install -g npm
RUN npm install --global sfdx-cli@${SALESFORCE_CLI_VERSION}

ENV SFDX_CONTAINER_MODE true
ENV SHELL /bin/bash