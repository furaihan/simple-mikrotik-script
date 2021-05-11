/ip firewall raw
add action=add-dst-to-address-list address-list=VIDEO-STREAMING \
    address-list-timeout=5d chain=prerouting comment=TWITCH content=\
    .twitchcdn.com disabled=no !dscp !dst-address !dst-address-list \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=add-dst-to-address-list address-list=VIDEO-STREAMING \
    address-list-timeout=5d chain=prerouting comment=TIKTOK content=\
    .tiktokcdn.com disabled=yes !dscp !dst-address !dst-address-list \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=add-dst-to-address-list address-list=VIDEO-STREAMING \
    address-list-timeout=5d chain=prerouting comment=YOUTUBE content=\
    .googlevideo.com disabled=yes !dscp !dst-address !dst-address-list \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=add-dst-to-address-list address-list=VIDEO-STREAMING \
    address-list-timeout=5d chain=prerouting comment="NIMO TV" content=\
    .nimo.tv disabled=no !dscp !dst-address !dst-address-list \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=jump chain=prerouting comment="GO TO VIDEO CHAIN" content=video \
    disabled=no !dscp !dst-address !dst-address-list !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options \
    jump-target=video !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=add-dst-to-address-list address-list=VIDEO-STREAMING \
    address-list-timeout=5d chain=video comment="FACEBOOK VIDEO" content=\
    .fbcdn.net disabled=no !dscp !dst-address !dst-address-list \
    !dst-address-type !dst-limit !dst-port !fragment !hotspot !icmp-options \
    !in-interface !in-interface-list !ingress-priority !ipsec-policy \
    !ipv4-options !limit log=no log-prefix="" !nth !out-interface \
    !out-interface-list !packet-size !per-connection-classifier !port \
    !priority !protocol !psd !random !src-address !src-address-list \
    !src-address-type !src-mac-address !src-port !tcp-flags !tcp-mss !time \
    !tls-host !ttl
add action=return chain=video comment="RETURN TO BEFORE VIDEO CHAIN" !content \
    disabled=no !dscp !dst-address !dst-address-list !dst-address-type \
    !dst-limit !dst-port !fragment !hotspot !icmp-options !in-interface \
    !in-interface-list !ingress-priority !ipsec-policy !ipv4-options !limit \
    log=no log-prefix="" !nth !out-interface !out-interface-list !packet-size \
    !per-connection-classifier !port !priority !protocol !psd !random \
    !src-address !src-address-list !src-address-type !src-mac-address \
    !src-port !tcp-flags !tcp-mss !time !tls-host !ttl
