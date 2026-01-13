FROM php:8.2-apache
COPY ./api /var/www/html/
RUN docker-php-ext-install pdo pdo_mysql
EXPOSE 80
CMD ["apache2-foreground"]
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

