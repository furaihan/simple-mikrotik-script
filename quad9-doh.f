/ip dns
set allow-remote-requests=yes cache-max-ttl=2d cache-size=8192KiB \
    query-server-timeout=4s query-total-timeout=20s servers=\
    9.9.9.9,149.112.112.112,2620:fe::fe,2620:fe::fe:9 use-doh-server=\
    https://dns.quad9.net/dns-query
/ip dns static
add address=104.16.248.249 name=cloudflare-dns.com type=A
add address=104.16.249.249 name=cloudflare-dns.com type=A
/ip firewall nat
add action=redirect chain=dstnat comment=DNS dst-port=53 protocol=udp \
    to-ports=53
add action=redirect chain=dstnat dst-port=53 protocol=tcp to-ports=53