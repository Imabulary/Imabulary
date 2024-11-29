FROM node:21-alpine3.18

EXPOSE 80
EXPOSE 443
EXPOSE 5000

WORKDIR /server

ARG BUILD_OS=linux

RUN if [ "$BUILD_OS" = "macos" ]; then \
    apk --no-cache add fftw-dev g++ make py3-pip vips vips-dev; \
    else \
    apk --no-cache add g++ make py3-pip; \
    fi

COPY package.json .
ARG NODE_ENV

RUN if [ "$NODE_ENV" = "development" ]; \
    then npm install; \
    else npm install --omit=dev; \
    fi

COPY . ./

RUN npm install --force @img/sharp-linuxmusl-arm64 && npx prisma generate

CMD ["npm", "run", "start:dev"]
