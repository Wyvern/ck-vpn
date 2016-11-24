#IPSec VPN IKEv2

```docker
docker run --name vpn -d --privileged -p 80:80 -p 500:500/udp -p 4500:4500/udp -v /lib/modules:/lib/modules:ro -e SERVER=\<vpn server> -e PSK=\<key> wyvern/vpn
```