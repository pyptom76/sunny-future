FROM alpine:latest

COPY ./content /workdir/

RUN apk add --no-cache runit caddy curl\
    && chmod +x /workdir/service/*/run \
    && ln -s /workdir/service/* /etc/service/

ENV XDG_CONFIG_HOME /workdir
ENV XDG_DATA_HOME /usr/share/caddy

ENTRYPOINT ["runsvdir", "-P", "/etc/service"]
