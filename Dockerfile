FROM node:lts-alpine

WORKDIR /app

COPY package*.json ./

COPY client/package*.json client/
RUN npm run install-client --only=production

COPY socket/package*.json client/
RUN npm run install-socket --only=production

COPY server/package*.json server/
RUN npm run install-server --only=production

COPY client/ client/
RUN npm run build --prefix client

COPY socket/ socket/
RUN npm start --prefix socket

COPY server/  server/

USER node

CMD [ "npm", "start", "--prefix", "server" ]

EXPOSE 5000