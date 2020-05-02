# syntax = docker/dockerfile:experimental

FROM php:7.4.5-fpm

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      bash \
      make \
      curl \
      wget \
      && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/

COPY ./install.mk /tmp/install.mk
RUN --mount=type=cache,target=/var/cache/install.mk \
    make -f /tmp/install.mk CACHE=/var/cacahe/install.mk install
