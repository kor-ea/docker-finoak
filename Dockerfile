FROM phusion/baseimage

CMD ["/sbin/my_init"]

RUN add-apt-repository ppa:ondrej/php
RUN apt-get update \
  && apt-get install -y --allow-unauthenticated php5.6-common php5.6-fpm php5.6-memcache php5.6-mongo php5.6-mysql

RUN mkdir -p /run/php
RUN mkdir -p /etc/service/php5.6-fpm
ADD conf/www.conf /etc/php/5.6/fpm/pool.d/www.conf
ADD conf/start.sh /etc/service/php5.6-fpm/run
RUN chmod +x /etc/service/php5.6-fpm/run

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
