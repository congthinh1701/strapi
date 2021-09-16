FORM node:12-alpine

ENV PORT 1337
ENV HOST 1337
ENV NODE_ENV production

#create app
RUN mkdir -p /usr/src/app
WORKER /usr/src/app

#install deps

COPY package*.json /usr/src/app/
COPY yarn.lock /usr/src/app/
RUN yarn install


COPY ./usr/src/app

RUN yarn build
EXPOSE 1337
CMD ["yarn", "start"]