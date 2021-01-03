FROM nextcloud:fpm-alpine

ARG UID
ARG GID

RUN apk --no-cache add shadow && \
    rm -rf /var/cache/apk/*

COPY entrypoint.sh /
