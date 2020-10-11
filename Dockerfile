FROM ubuntu:20.04

RUN export TERM=dumb ; export DEBIAN_FRONTEND=noninteractive ; apt-get update && apt-get install -y \
    apache2 \
    haproxy=2.0.\* msmtp supervisor \
    gnupg2 \
    php7.4=7.4.3-4ubuntu2.2 \
    php-apcu php-bcmath php-curl php-gd php-imagick php-imap php-intl php-mbstring php-memcache php-memcached php-mysql php-pgsql php-ps php-pspell php-soap php-sqlite3 php-tidy php-xmlrpc php-xml php-zip \
    curl less vim wget \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN export TERM=dumb ; export DEBIAN_FRONTEND=noninteractive ; \
    echo "deb https://dl.bintray.com/foilen/debian stable main" > /etc/apt/sources.list.d/foilen.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61 && \
    apt-get update && apt-get install -y \
    sendmail-to-msmtp=1.1.0 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite

CMD /bin/bash
