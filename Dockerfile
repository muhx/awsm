FROM ghcr.io/muhx/mkdocs-material-insiders:latest as build

# Set build directory
WORKDIR /usr/src/build

# Copy files necessary for build
COPY . /usr/src/build

RUN mkdocs build --config-file mkdocs.yml

FROM nginx:1.21.0-alpine as prod

LABEL org.opencontainers.image.source https://github.com/muhx/awsm

COPY --from=build /usr/src/build/site/ /var/www/site/

ADD nginx/default.conf /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]