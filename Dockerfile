FROM node:carbon

# RUN apk update && apk upgrade && \
#     apk add --no-cache bash git openssh python make

WORKDIR /usr/src/app
COPY . .
RUN npm install
RUN npm run bootstrap
RUN npm run compile

CMD ["nohup", "npm", "run", "node", "&"]
CMD ["nohup", "npm", "run", "insight-previous", "&"]