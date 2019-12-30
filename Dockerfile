FROM debian:8

RUN export TERM=dumb ; export DEBIAN_FRONTEND=noninteractive ; apt-get update && apt-get install -y \
  apt-transport-https ca-certificates \
    apache2 \
    msmtp supervisor \
    gnupg2 \
    init-system-helpers \
    php5=5.6.40+dfsg-0+deb8u8 \
    php5-apcu php5-curl php5-gd php5-imagick php5-imap php5-intl php5-memcache php5-memcached php5-mysql php5-pgsql php5-pspell php5-recode php5-sqlite php5-tidy php5-xmlrpc \
    curl less vim wget \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN export TERM=dumb ; export DEBIAN_FRONTEND=noninteractive ; \
    echo "deb https://dl.bintray.com/foilen/debian stable main" > /etc/apt/sources.list.d/foilen.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61 && \
    apt-get update && apt-get install -y \
    sendmail-to-msmtp=1.0.0 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN cd /tmp && \
  wget http://http.us.debian.org/debian/pool/main/h/haproxy/haproxy_1.8.19-1_amd64.deb && \
  wget http://http.us.debian.org/debian/pool/main/l/lua5.3/liblua5.3-0_5.3.3-1.1_amd64.deb && \
  wget http://http.us.debian.org/debian/pool/main/p/pcre2/libpcre2-8-0_10.32-5_amd64.deb && \
  wget http://http.us.debian.org/debian/pool/main/o/openssl/libssl1.1_1.1.1d-2_amd64.deb && \
  wget http://http.us.debian.org/debian/pool/main/g/glibc/libc6_2.28-10_amd64.deb && \
  dpkg -i *.deb && \
  rm *.deb

RUN a2enmod rewrite

CMD /bin/bash
