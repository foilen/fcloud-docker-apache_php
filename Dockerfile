FROM ubuntu:18.04

RUN export TERM=dumb ; export DEBIAN_FRONTEND=noninteractive ; apt-get update && apt-get install -y \
    software-properties-common \
  && add-apt-repository -y ppa:ondrej/php \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN export TERM=dumb ; export DEBIAN_FRONTEND=noninteractive ; apt-get update && apt-get install -y \
    apache2 \
    haproxy=1.8.\* msmtp postfix=3.3.0-1ubuntu0.2 supervisor \
    php7.1=7.1.25-1+ubuntu18.04.1+deb.sury.org+1 \
    php7.1-apcu php7.1-curl php7.1-gd php7.1-imagick php7.1-imap php7.1-intl php7.1-mbstring php7.1-memcache php7.1-memcached php7.1-mysql php7.1-pgsql php7.1-ps php7.1-pspell php7.1-recode php7.1-sqlite3 php7.1-tidy php7.1-xmlrpc php7.1-xml \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --set php /usr/bin/php7.1 && \
  update-alternatives --set phar /usr/bin/phar7.1 && \
  update-alternatives --set phar.phar /usr/bin/phar.phar7.1

RUN a2enmod rewrite

CMD /bin/bash
