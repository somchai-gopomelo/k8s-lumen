FROM pongsak/centos-phpfpm-nginx-lumen:2.0
MAINTAINER "Pongsak Prabparn" <pongsak@rebatemango.com>

COPY ./blog /var/www/html/

WORKDIR /var/www/html

RUN composer update

# Set the port to 80 
EXPOSE 80

# Executing supervisord
CMD ["supervisord" , "-n"]

