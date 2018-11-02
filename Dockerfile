FROM node:8

# Create app directory
WORKDIR /app

COPY package.json /app
RUN npm install
COPY . /app

EXPOSE 9000

CMD [ "node", "./build/server.js" ]
