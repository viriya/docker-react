FROM node:alpine AS build1
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=build1 /app/build /usr/share/nginx/html