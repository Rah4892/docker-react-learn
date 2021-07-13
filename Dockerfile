FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#adding change for git commit 

#container for production
FROM nginx

#copying the results of the previous container 
COPY --from=0 /app/build /usr/share/nginx/html
