FROM node
COPY . ./app
WORKDIR /app
EXPOSE 3001
RUN npm i
CMD npm run start:prod