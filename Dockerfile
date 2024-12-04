MAINTAINER hrenumanu@gmail.com
FROM nginx:latest
WORKDIR /var/www/html
COPY /var/www/html .
Expose 8081

