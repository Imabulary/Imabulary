FROM node:21-alpine3.18

EXPOSE 80
EXPOSE 443
EXPOSE 5000

WORKDIR /server

COPY package.json .
ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
    then npm install; \
    else npm install --only=production \
    fi

RUN npm install --force @img/sharp-linuxmusl-arm64
RUN npx prisma generate

COPY . ./
CMD ["npm", "run", "start:dev"]
