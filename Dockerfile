FROM ubuntu:15.10

RUN sed s/archive/old-releases/g /etc/apt/sources.list > /etc/apt/sources.list.2 && \
    mv /etc/apt/sources.list.2 /etc/apt/sources.list


RUN export TERM=dumb ; export DEBIAN_FRONTEND=noninteractive ; apt-get update && apt-get install -y \
	apt-transport-https ca-certificates \
    apache2 \
    liblua5.3-0 \
    msmtp supervisor \
    gnupg2 \
    php5=5.6.11+dfsg-1ubuntu3.4 \
    php5-apcu php5-curl php5-gd php5-imagick php5-imap php5-intl php5-memcache php5-memcached php5-mysql php5-pgsql php5-ps php5-pspell php5-recode php5-sqlite php5-tidy php5-xmlrpc \
    curl less vim wget \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN export TERM=dumb ; export DEBIAN_FRONTEND=noninteractive ; \
    echo "deb https://dl.bintray.com/foilen/debian stable main" > /etc/apt/sources.list.d/foilen.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61 && \
    apt-get update && apt-get install -y \
    sendmail-to-msmtp=1.0.0 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN cd /tmp && \
	wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4.3_amd64.deb && \
	wget http://archive.ubuntu.com/ubuntu/pool/main/h/haproxy/haproxy_1.8.8-1ubuntu0.4_amd64.deb && \
	dpkg -i libssl1.1_1.1.0g-2ubuntu4.3_amd64.deb haproxy_1.8.8-1ubuntu0.4_amd64.deb && \
	rm libssl1.1_1.1.0g-2ubuntu4.3_amd64.deb haproxy_1.8.8-1ubuntu0.4_amd64.deb

RUN a2enmod rewrite

CMD /bin/bash
