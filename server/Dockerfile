FROM node:21-alpine3.18

EXPOSE 80
EXPOSE 443
EXPOSE 5000

WORKDIR /server

RUN apk --no-cache add g++ make py3-pip

COPY package*.json ./
ARG NODE_ENV

RUN if [ "$NODE_ENV" = "development" ]; \
    then npm ci; \
    else npm ci --omit=dev; \
    fi

RUN npm install --force @img/sharp-linuxmusl-arm64

COPY . ./

RUN npx prisma generate
RUN npm run build

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
