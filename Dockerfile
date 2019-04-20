FROM alpine:3.9
RUN apk add --no-cache git bash
COPY docker-entrypoint.sh /
COPY fetcher.sh /
RUN git clone --depth 1 --branch source https://github.com/lepsipraha7/cityvizor.git /source
ENTRYPOINT ["/docker-entrypoint.sh"]
