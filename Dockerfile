FROM alpine:3

RUN apk update \
    && apk add --no-cache git make gcc libc-dev bash \
    && git clone https://github.com/wolfcw/libfaketime.git \
    && cd libfaketime \
    && git checkout v0.9.8 \
    && make install \
    && cd .. \
    && rm -R libfaketime \
    && apk del git make gcc

ENV LD_PRELOAD=/usr/local/lib/faketime/libfaketime.so.1
ENV FAKETIME_DONT_FAKE_MONOTONIC=1
ENV FAKETIME_DONT_RESET=1
ENV FAKETIME_NO_CACHE=1

COPY entrypoint.sh /
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]