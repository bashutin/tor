#!/bin/sh

# Add to /etc/tor/torrc
#VirtualAddrNetworkIPv4 10.192.0.0/10
#AutomapHostsOnResolve 1
#TransPort 192.168.50.111:9040
#DNSPort 192.168.50.111:5353

# Tor's TransPort
_trans_port="9040"

# your internal interface
_inc_if="enp9s0"

iptables -F
iptables -t nat -F

iptables -t nat -A PREROUTING -i $_inc_if -p udp --dport 53 -j REDIRECT --to-ports 5353
iptables -t nat -A PREROUTING -i $_inc_if -p udp --dport 5353 -j REDIRECT --to-ports 5353
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 22 -j ACCEPT
iptables -t nat -A PREROUTING -i $_inc_if -p tcp --syn -j REDIRECT --to-ports $_trans_port
