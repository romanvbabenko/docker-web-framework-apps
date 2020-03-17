FROM node:12.14.1-alpine3.10 as builder
WORKDIR /app
COPY package.json yarn.lock ./
COPY src ./src
COPY public public
RUN yarn install && yarn build

FROM nginx:1.17.7-alpine
ENV PROXY_API_TARGET=http://localhost:3000
COPY --from=builder /app/build /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx-default.conf.template /etc/nginx/conf.d/default.conf.template
EXPOSE 80
CMD envsubst '\$PROXY_API_TARGET' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
