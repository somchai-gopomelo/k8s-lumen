FROM pongsak/centos-phpfpm-nginx-lumen:2.0
MAINTAINER "Pongsak Prabparn" <pongsak@rebatemango.com>

WORKDIR /var/www/html

COPY ./project /var/www/html/

COPY ./project/composer.json ./project/composer.lock* ./
ENV COMPOSER_VENDOR_DIR=/var/www/html/vendor
RUN composer install --no-scripts --no-autoloader --ansi --no-interaction

RUN chmod -R 777 /var/www/html/storage && \
	chmod -R 777 /var/www/html/bootstrap

# copy in app code as late as possible, as it changes the most
WORKDIR /var/www/html
RUN composer update

# Set the port 80 
EXPOSE 80

# Executing supervisord
CMD ["supervisord" , "-n"]
