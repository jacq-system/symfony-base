FROM ghcr.io/krkabol/php-fpm-noroot-socket:main@sha256:ff89b8990579a5dfcc540e454846e8253a2ae2f787c1cb018e25d3460a1efd0a
USER root

RUN  apt-get update && apt-get dist-upgrade -y && \
        apt-get install -y --no-install-recommends \
        libicu-dev && \
        apt-get autoclean -y && \
        apt-get remove -y wget && \
        apt-get autoremove -y && \
        rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

RUN  docker-php-ext-install intl opcache pdo pdo_mysql \
     && docker-php-ext-enable opcache

USER www
