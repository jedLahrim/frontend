FROM node:16-alpine as builder
WORKDIR /frontend
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /frontend/build usr/share/nginx/html

#