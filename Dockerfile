FROM ghcr.io/biodiversity-cz/php-fpm-noroot-socket:main@sha256:00f08e9f4ac001dd64fcde42d58193cb5c4303f2baab14b210570df5ff93c49e
USER root

RUN  apt-get update && apt-get dist-upgrade -y && \
        apt-get install -y --no-install-recommends \
        libicu-dev \
        libpng-dev  && \
        apt-get autoclean -y && \
        apt-get remove -y wget && \
        apt-get autoremove -y && \
        rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

RUN  docker-php-ext-install intl pdo pdo_mysql \
     && docker-php-ext-install gd

COPY ./www.conf /usr/local/etc/php-fpm.d/zz-docker.conf

USER www