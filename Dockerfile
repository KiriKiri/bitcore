FROM node:carbon
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY lerna.json ./

COPY ./packages/bitcore-build/package.json ./packages/bitcore-build/package.json
COPY ./packages/bitcore-mnemonic/package.json ./packages/bitcore-mnemonic/package.json
COPY ./packages/bitcore-lib/package.json ./packages/bitcore-lib/package.json
COPY ./packages/bitcore-lib-cash/package.json ./packages/bitcore-lib-cash/package.json
COPY ./packages/bitcore-p2p/package.json ./packages/bitcore-p2p/package.json
COPY ./packages/bitcore-p2p-cash/package.json ./packages/bitcore-p2p-cash/package.json
COPY ./packages/bitcore-wallet-client/package.json ./packages/bitcore-wallet-client/package.json
COPY ./packages/bitcore-client/package.json ./packages/bitcore-client/package.json
COPY ./packages/bitcore-wallet/package.json ./packages/bitcore-wallet/package.json
COPY ./packages/bitcore-wallet-client/package.json ./packages/bitcore-wallet-client/package.json
COPY ./packages/bitcore-wallet-service/package.json ./packages/bitcore-wallet-service/package.json
COPY ./packages/bitcore-node/package.json ./packages/bitcore-node/package.json
COPY ./packages/insight/package.json ./packages/insight/package.json

# RUN apk update && apk upgrade && \
#     apk add --no-cache bash git openssh python make

WORKDIR /usr/src/app
COPY . .
RUN npm install
RUN npm run bootstrap
RUN npm run compile

CMD ["npm", "run", "node"]