FROM ubuntu:14.04

RUN export TERM=dumb ; apt-get update && apt-get install -y software-properties-common \
  && add-apt-repository ppa:vbernat/haproxy-1.6 \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN export TERM=dumb ; apt-get update && apt-get install -y \
    apache2 \
    haproxy=1.6.\* msmtp supervisor \
    php5 php5-curl php5-gd php5-imagick php5-imap php5-intl php5-mcrypt php5-memcache php5-memcached php5-ming php5-mysql php5-pgsql php5-ps php5-pspell php5-recode php5-sqlite php5-tidy php5-xcache php5-xmlrpc php5-xsl \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

CMD /bin/bash

