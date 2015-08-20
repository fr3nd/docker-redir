FROM alpine:latest

MAINTAINER Carles Amigó, fr3nd@fr3nd.net

COPY redir.c /usr/src/redir.c
RUN apk add --update alpine-sdk && \
    gcc /usr/src/redir.c -o /usr/bin/redir && \
    strip /usr/bin/redir && \
    apk del alpine-sdk

CMD /usr/bin/redir
