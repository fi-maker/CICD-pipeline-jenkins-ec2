FROM node:18-alpine
WORKDIR /app

COPY package*.josn .
RUN npm install

COPY . .
RUN npm run build
EXPOSE 5000
CMD [ "node","dist/main" ]

