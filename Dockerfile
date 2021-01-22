FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#In AWS ElasticBeanstalk will make the port mapping to the port 80. basically -> 80:80
EXPOSE 80
#We will copy only the '/app/build' folder from the last procces to '/usr/share/nginx/html'
COPY --from=0 /app/build /usr/share/nginx/html
