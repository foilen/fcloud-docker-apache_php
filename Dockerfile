FROM ubuntu:20.10

# Update old APT Urls
RUN sed -i -re 's/([a-z]{2}\.)?archive.ubuntu.com|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list

# Apache and PHP
RUN export TERM=dumb ; export DEBIAN_FRONTEND=noninteractive ; apt-get update && apt-get install -y \
    apache2 \
    apt-utils \
    msmtp \
    gnupg2 \
    imagemagick \
    libapache2-mod-fcgid \
    php7.4=7.4.9-1ubuntu1.2 \
    php-apcu php-bcmath php-curl php-gd php-gmp php-imagick php-imap php-intl php-mbstring php-memcache php-memcached php-mysql php-pgsql php-ps php-pspell php-soap php-sqlite3 php-tidy php-xmlrpc php-xml php-zip \
    curl less vim wget \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Sending emails easily
RUN wget https://deploy.foilen.com/sendmail-to-msmtp/sendmail-to-msmtp_1.1.1_amd64.deb && \
  dpkg -i sendmail-to-msmtp_1.1.1_amd64.deb && \
  rm sendmail-to-msmtp_1.1.1_amd64.deb

RUN a2enmod \
  fcgid \
  headers \
  proxy_fcgi \
  rewrite

# ImageMagick can create PDF
COPY assets/policy.xml /etc/ImageMagick-6/policy.xml

CMD /bin/bash
