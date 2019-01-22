FROM node:carbon
WORKDIR /usr/src/app
COPY . .
RUN rm -rf node_modules
RUN npm install

CMD ["npm", "run", "node"]