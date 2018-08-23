FROM pongsak/centos-phpfpm-nginx:4.0
MAINTAINER "Pongsak Prabparn" <pongsak@rebatemango.com>

RUN composer global require "laravel/lumen-installer"

COPY ./nginx/00-default /etc/nginx/conf.d/default.conf

COPY ./blog /var/www/html/

# Add laravel to PATH
ENV PATH=$PATH:/root/.composer/vendor/bin

RUN echo $PATH

# Set the port to 80 
EXPOSE 80

# Executing supervisord
CMD ["supervisord" , "-n"]

# docker build --rm -t centos-phpfpm-nginx-laravel . 

