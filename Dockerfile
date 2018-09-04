FROM pongsak/centos-phpfpm-nginx-lumen:2.0
MAINTAINER "Pongsak Prabparn" <pongsak@rebatemango.com>

WORKDIR /var/www/html

COPY ./blog /var/www/html/

RUN echo "$PWD"

RUN composer update

# Set the port to 80 
EXPOSE 80

# Executing supervisord
#CMD ["supervisord" , "-n" && "bash", "-c", "composer update"]
CMD "/usr/bin/supervisord"; bash -c "composer update && php artisan";
