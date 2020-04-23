FROM node:alpine AS stage0
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=stage0 /app/build /usr/share/nginx/html