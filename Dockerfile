FROM node:10 as build-env
WORKDIR /work
COPY . /work
RUN yarn
RUN yarn build

FROM node:10
ENV NODE_ENV production
WORKDIR /work
COPY . /work
COPY --from=build-env /work/.nuxt /work/.nuxt
RUN yarn
CMD ["yarn", "start"]
