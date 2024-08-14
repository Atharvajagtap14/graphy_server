FROM node:hydrogen-buster

# Update the package list and upgrade git to the fixed version
RUN apt-get update && \
    apt-get install -y git=1:2.20.1-2+deb10u9 && \
    apt-get install -y git-man=1:2.20.1-2+deb10u9 && \
    apt-get clean

COPY graphserver.js .
COPY package.json .
COPY UScities.json .
RUN npm install &&\
    apk update &&\
    apk upgrade

EXPOSE 4000
CMD node graphserver.js
