# Stage 1: Build the Angular application
# Author Sanu
FROM node:14 as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY .. .
RUN npm run build --prod

# Stage 2: Serve the Angular application using Nginx
FROM nginx:latest
COPY  /app/dist/interview-shield /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
