FROM	 phusion/baseimage
MAINTAINER Lysander Vogelzang <lysander@nuclyus.nl>

RUN \
	add-apt-repository -y ppa:nginx/stable && \
	apt-get update && \
	apt-get install -y \ 
	nginx \
    php5-fpm \
    php5-curl \
    php5-gd \
    php5-geoip \
    php5-imagick \
    php5-imap \
    php5-json \
    php5-mcrypt \
    php5-memcache \
    php5-memcached \
    php5-mongo \
    php5-mssql \
    php5-mysqlnd \
    php5-pgsql \
    php5-redis \
    php5-sqlite \
    php5-xdebug \
    php5-xmlrpc \
    php5-xcache && \
	rm -rf /var/lib/apt/lists/* && \
	chown -R www-data:www-data /var/lib/nginx && \
	mkdir /cache/ && \
	chown www-data:www-data 750 /cache/ && \
	mkdir /logs/ && \
	chown www-data:www-data 750 /logs/
	
# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/cache/", "/logs/"]

# Always log from these containers
ENV LOG True

# Define default command.
CMD ["/sbin/my_init"]