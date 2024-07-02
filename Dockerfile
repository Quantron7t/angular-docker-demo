# Stage 1: Build Angular app
FROM node:latest AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build --prod

# Stage 2: Serve the app using NGINX
FROM nginx:stable-alpine3.19-slim
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist/angular-docker-demo/browser /usr/share/nginx/html
# observation below did not alter default nginx 80 port  
# EXPOSE 4000
CMD ["nginx", "-g", "daemon off;"]

