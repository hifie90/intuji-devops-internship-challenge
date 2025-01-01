# Use the official PHP-Apache image as the base
FROM php:8.0-apache

# Enable mod_rewrite for Apache (useful for PHP projects)
RUN a2enmod rewrite

# Copy the entire project into the container
COPY . /var/www/html/

# Set permissions for the web server
RUN chown -R www-data:www-data /var/www/html/

# Expose port 80 (HTTP)
EXPOSE 80

# Set the directory index to index.php (or index.html)
RUN echo "DirectoryIndex index.php index.html" >> /etc/apache2/apache2.conf

RUN echo "<Directory /var/www/html/>" >> /etc/apache2/apache2.conf
RUN echo "    AllowOverride All" >> /etc/apache2/apache2.conf
RUN echo "    Require all granted" >> /etc/apache2/apache2.conf
RUN echo "</Directory>" >> /etc/apache2/apache2.conf
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf


# Start the Apache server
CMD ["apache2-foreground"]


# #----------------------For nginx-------------------------
# # Stage 1: Build PHP with required extensions
# FROM php:8.0-fpm as php-fpm

# # Install required PHP extensions
# RUN docker-php-ext-install mysqli pdo pdo_mysql

# # Stage 2: Set up NGINX
# FROM nginx:latest

# # Copy NGINX configuration file
# COPY nginx.conf /etc/nginx/nginx.conf

# # Copy the PHP files from the PHP-FPM stage to the nginx web root
# COPY --from=php-fpm /var/www/html /usr/share/nginx/html

# # Set permissions for the web server
# RUN chown -R www-data:www-data /usr/share/nginx/html

# # Expose port 80 for NGINX
# EXPOSE 80

# # Start nginx server
# CMD ["nginx", "-g", "daemon off;"]
