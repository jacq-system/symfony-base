FROM ghcr.io/biodiversity-cz/php-fpm-noroot-socket:main@sha256:c96241d287a1b38bdadc0e3e9b2e1446e87fd36bcb6b7f9252d096ea4273448b
USER root

RUN  apt-get update && apt-get dist-upgrade -y && \
        apt-get install -y --no-install-recommends \
        libicu-dev \
        libpng-dev  && \
        apt-get autoclean -y && \
        apt-get remove -y wget && \
        apt-get autoremove -y && \
        rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

RUN  docker-php-ext-install intl opcache pdo pdo_mysql \
     && docker-php-ext-enable opcache \
     && docker-php-ext-install gd


USER www
