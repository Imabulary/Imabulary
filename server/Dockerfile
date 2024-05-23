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

ARG ADMIN_ACCOUNT
ARG SERVICE_ACCOUNT

RUN if [ -n "$ADMIN_ACCOUNT" ]; then echo "${ADMIN_ACCOUNT}" > admin-account.json; fi
RUN if [ -n "$SERVICE_ACCOUNT" ]; then echo "${SERVICE_ACCOUNT}" > service-account.json; fi

RUN npx prisma generate
RUN npm run build

CMD ["node", "dist/src/main.js"]
