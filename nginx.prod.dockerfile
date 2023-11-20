FROM nginx:stable-alpine

ENV NGINXUSER=laravel

ENV NGINXGROUP=laravel


RUN mkdir -p /var/www/html/public

ADD default.prod.conf /etc/nginx/conf.d/default.conf
ADD ismael.informaticamajada.es.pem /etc/nginx/certs/ismael.informaticamajada.es.pem
ADD ismael.informaticamajada.es-key.pem /etc/nginx/certs/ismael.informaticamajada.es-key.pem


RUN sed -i "s/user www-data/user ${NGINXUSER}/g" /etc/nginx/nginx.conf


RUN adduser -g ${NGINXGROUP} -s /bin/sh -D ${NGINXUSER}