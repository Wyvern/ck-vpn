FROM s390x/alpine
LABEL MAINTAINER="vpn@ifree.net"

RUN apk update  && apk upgrade && apk add --no-cache iptables libressl strongswan

# Strongswan Configuration
ADD ./vpn_config/ipsec.conf /etc/ipsec.conf
ADD ./vpn_config/strongswan.conf /etc/strongswan.conf

# Apps launch
ADD init.sh /usr/bin/init

# Web
ADD web /www
VOLUME /www

ENV PROFILE StrongSwan
ENV PSK   asdfjkl

EXPOSE 500/udp 4500/udp
CMD /usr/bin/init
