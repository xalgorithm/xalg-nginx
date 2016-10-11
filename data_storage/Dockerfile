#nginx-data container
FROM alpine:latest
MAINTAINER Vincent Flesouras
VOLUME /app 
RUN apk add --no-cache \
    bash \
    zip
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
