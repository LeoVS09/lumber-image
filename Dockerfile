FROM node:lts-jessie

WORKDIR /usr/src/app

RUN npm install -g lumber-cli -s

VOLUME /usr/src/app

COPY ./docker-entrypoint.sh /

EXPOSE $APPLICATION_PORT

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "npm", "start" ]