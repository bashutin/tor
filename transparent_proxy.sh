#!/bin/sh

# Add to /etc/tor/torrc
#TransPort 0.0.0.0:9040
#DNSPort 0.0.0.0:5354

# Tor's Ports
trans_port="9040"
dns_port='5354

# your internal interface
_inc_if="enp9s0"

iptables -F
iptables -t nat -F

iptables -t nat -A PREROUTING -i $_inc_if -p udp --dport 53 -j REDIRECT --to-ports $dns_port
iptables -t nat -A PREROUTING -i $_inc_if -p udp --dport 5353 -j REDIRECT --to-ports $dns_port
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 22 -j ACCEPT
iptables -t nat -A PREROUTING -i $_inc_if -p tcp --syn -j REDIRECT --to-ports $trans_port
