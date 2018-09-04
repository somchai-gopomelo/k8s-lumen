FROM composer as composer
COPY . /app
RUN composer install --ignore-platform-reqs --no-scripts

FROM pongsak/centos-phpfpm-nginx-lumen:2.0
MAINTAINER "Pongsak Prabparn" <pongsak@rebatemango.com>

WORKDIR /var/www/html

COPY ./blog /var/www/html/

RUN echo "$PWD"

RUN composer update

COPY --from=composer /app/vendor /var/www/html/vendor

# Set the port to 80 
EXPOSE 80

# Executing supervisord
CMD ["/usr/bin/supervisord" && "bash", "-c", "composer update"]
