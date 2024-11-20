FROM ghcr.io/krkabol/php-fpm-noroot-socket:main@sha256:61000c37d58d2162c4799d8fdc3f377ccc038a2aba0016680b026747801f791d
USER root

RUN  apt-get update && apt-get dist-upgrade -y && \
        apt-get install -y --no-install-recommends \
        libicu-dev && \
        apt-get autoclean -y && \
        apt-get remove -y wget && \
        apt-get autoremove -y && \
        rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/* \

RUN  docker-php-ext-install intl opcache pdo pdo_mysql \
     && docker-php-ext-enable opcache \

USER www
