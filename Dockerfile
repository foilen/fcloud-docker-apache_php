FROM ubuntu:18.04

RUN export TERM=dumb ; export DEBIAN_FRONTEND=noninteractive ; apt-get update && apt-get install -y \
    apache2 \
    haproxy=1.8.\* msmtp supervisor \
    gnupg2 \
    php7.2=7.2.19-0ubuntu0.18.04.1 \
    php-apcu php-curl php-gd php-imagick php-imap php-intl php-mbstring php-memcache php-memcached php-mysql php-pgsql php-ps php-pspell php-recode php-sqlite3 php-tidy php-xmlrpc php-xml php-zip \
    curl less vim wget \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN export TERM=dumb ; export DEBIAN_FRONTEND=noninteractive ; \
    echo "deb https://dl.bintray.com/foilen/debian stable main" > /etc/apt/sources.list.d/foilen.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61 && \
    apt-get update && apt-get install -y \
    sendmail-to-msmtp=1.0.0 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite

CMD /bin/bash
