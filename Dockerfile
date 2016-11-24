FROM alpine
MAINTAINER vpn <vpn@ifree.net>

# See http://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management#Advanced_APK_Usage
RUN apk update && apk upgrade && apk add --no-cache iptables openssl strongswan


# Strongswan Configuration
ADD ./vpn_config/ipsec.conf /etc/ipsec.conf
ADD ./vpn_config/strongswan.conf /etc/strongswan.conf

# Apps
Add init.sh /usr/bin/init

# Web
ADD web /www

VOLUME /www
VOLUME /lib/modules:/lib/modules

ENV PROFILE IPSecVPN
ENV PSK   wyvern
ENV SERVER   ifree.net

EXPOSE 80 500/udp 4500/udp

# ENTRYPOINT ["/usr/local/bin/init"]
CMD /usr/bin/init
