FROM ubuntu:18.04

RUN export TERM=dumb ; export DEBIAN_FRONTEND=noninteractive ; apt-get update && apt-get install -y \
    apache2 \
    haproxy=1.8.\* msmtp postfix=3.3.0-1ubuntu0.2 supervisor \
    php7.2=7.2.10-0ubuntu0.18.04.1 \
    php-apcu php-curl php-gd php-imagick php-imap php-intl php-mbstring php-memcache php-memcached php-mysql php-pgsql php-ps php-pspell php-recode php-sqlite3 php-tidy php-xmlrpc php-xml \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite

CMD /bin/bash
