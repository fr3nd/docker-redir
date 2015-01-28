FROM ubuntu:14.04

MAINTAINER Carles Amigó, fr3nd@fr3nd.net

RUN apt-get update && apt-get install -y \
      redir

CMD /usr/bin/redir
