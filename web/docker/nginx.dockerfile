FROM nginx:alpine

COPY docker/nginx.docker.conf /etc/nginx/conf.d/default.conf
COPY htdocs /var/www/htdocs