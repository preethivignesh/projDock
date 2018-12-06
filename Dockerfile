FROM ubuntu:17.10
MAINTAINER Raghuveer.M <raghuveer.mudiraj@gmail.com>

ENV http_proxy "http://194.138.0.26:9400"
ENV https_proxy "http://194.138.0.26:9400"

#Update Repository
RUN apt-get update -y
 
#Install Apache
RUN apt-get install -y apache2
 
#Install PHP Modules
RUN apt-get install -y php7.1 libapache2-mod-php7.1 php7.1-cli php7.1-common php7.1-mbstring php7.1-gd php7.1-intl php7.1-xml php7.1-mysql php7.1-mcrypt php7.1-zip
 
#Copy Application Files
RUN rm -rf /var/www/html/*
ADD website /var/www/html
 
#Configure Apache (Optional)
RUN chown -R www-data:www-data /var/www
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
 
#Open port 80
EXPOSE 80
 
#Start Apache service
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
