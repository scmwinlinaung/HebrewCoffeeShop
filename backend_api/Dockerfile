FROM node:10.16.3
# Create app directory
WORKDIR /usr/src/app
COPY package*.json /usr/src/app/

RUN npm install -g nodemon
RUN npm install 
COPY . .

ENV MONGODB_URL = mongodb://127.0.0.1:27020/restaurant_management_system
ENV PORT=8080
ENV JWT_KEY=#Yo392*(#()SLASP)

EXPOSE 8083
ENTRYPOINT ["nodemon", "/usr/src/app/server.js"]