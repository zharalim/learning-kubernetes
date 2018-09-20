FROM node:8.12.0

COPY app.js package.json /home/node/app/

WORKDIR /home/node/app/

RUN npm install 

EXPOSE 8888

CMD [ "npm", "start" ]