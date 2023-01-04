FROM node:19.3.0
WORKDIR /server

COPY package.json .
ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
    then npm install; \
    else npm install --only=production; \
    fi

COPY . ./
# CMD ["npm", "run", "start:dev"]
