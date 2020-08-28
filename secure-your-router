{
#SOURCE https://help.mikrotik.com/docs/display/ROS/Building+Your+First+Firewall
#Protect the router itself
#	work with new connections to decrease load on a router;
#	create address-list for IP addresses, that are allowed to access your router;
#	enable ICMP access (optionally);
#	drop everything else, log=yes might be added to log packets that hit the specific rule;

/ip firewall filter
add action=accept chain=input comment="default configuration" connection-state=established,related
add action=accept chain=input src-address-list=allowed_to_router
add action=accept chain=input protocol=icmp
add action=drop chain=input
/ip firewall address-list
add address=192.168.88.2-192.168.88.254 list=allowed_to_router

#Protect the LAN devices
#We will create address-list with name "not_in_internet" which we will use for the future firewall rules:

/ip firewall address-list
add address=0.0.0.0/8 comment=RFC6890 list=not_in_internet
add address=172.16.0.0/12 comment=RFC6890 list=not_in_internet
add address=192.168.0.0/16 comment=RFC6890 list=not_in_internet
add address=10.0.0.0/8 comment=RFC6890 list=not_in_internet
add address=169.254.0.0/16 comment=RFC6890 list=not_in_internet
add address=127.0.0.0/8 comment=RFC6890 list=not_in_internet
add address=224.0.0.0/4 comment=Multicast list=not_in_internet
add address=198.18.0.0/15 comment=RFC6890 list=not_in_internet
add address=192.0.0.0/24 comment=RFC6890 list=not_in_internet
add address=192.0.2.0/24 comment=RFC6890 list=not_in_internet
add address=198.51.100.0/24 comment=RFC6890 list=not_in_internet
add address=203.0.113.0/24 comment=RFC6890 list=not_in_internet
add address=100.64.0.0/10 comment=RFC6890 list=not_in_internet
add address=240.0.0.0/4 comment=RFC6890 list=not_in_internet
add address=192.88.99.0/24 comment="6to4 relay Anycast [RFC 3068]" list=not_in_internet

#jump to ICMP chain to drop unwanted ICMP messages

/ip firewall filter
  add chain=icmp protocol=icmp icmp-options=0:0 action=accept \
    comment="echo reply"
  add chain=icmp protocol=icmp icmp-options=3:0 action=accept \
    comment="net unreachable"
  add chain=icmp protocol=icmp icmp-options=3:1 action=accept \
    comment="host unreachable"
  add chain=icmp protocol=icmp icmp-options=3:4 action=accept \
    comment="host unreachable fragmentation required"
  add chain=icmp protocol=icmp icmp-options=8:0 action=accept \
    comment="allow echo request"
  add chain=icmp protocol=icmp icmp-options=11:0 action=accept \
    comment="allow time exceed"
  add chain=icmp protocol=icmp icmp-options=12:0 action=accept \
    comment="allow parameter bad"
  add chain=icmp action=drop comment="deny all other types"
  
#set policy for read user so they cant reboot your router without permission
/user group set read policy=!reboot

local DisableService do={
/ip service
set ftp disabled=yes
set www disabled=yes
set ssh disabled=yes
set api disabled=yes
set api-ssl disabled=yes
}

#DISABLE UNUSED SERVICES (Remove the hashtag # below to disable unused services)
#$DisableService
}
