FROM node:8

# Create app directory
WORKDIR /server

COPY /server .
RUN npm init -y
RUN npm install ts-node
RUN npm install express
RUN npm install typescript
RUN npm i @types/node
RUN npm i q
RUN npm i lodash
RUN npm i --save-dev  @types/es6-promise
RUN npm i web-push

EXPOSE 9000

CMD [ "./node_modules/.bin/ts-node", "./server.ts" ]
