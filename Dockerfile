FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#We will copy only the '/app/build' folder from the last procces to '/usr/share/nginx/html'
COPY --from=0 /app/build /usr/share/nginx/html
