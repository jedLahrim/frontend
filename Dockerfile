FROM node:16-alpine AS builder
WORKDIR /frontend
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 3000:3000
COPY --from=builder /frontend/build usr/share/nginx/html