FROM node:lts-alpine

WORKDIR /app

COPY package*.json ./

COPY client/package*.json client/
RUN npm run install-client --only=production

COPY socket/package*.json socket/
RUN npm run install-socket --only=production

COPY server/package*.json server/
RUN npm run install-server --only=production

COPY client/ client/
RUN npm run build --prefix client

COPY socket/ socket/
RUN npm run socket --prefix socket

EXPOSE 8080

COPY server/  server/

USER node

CMD [ "npm", "start", "--prefix", "server" ]

EXPOSE 5000