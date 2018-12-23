# iptables.sh
# Configurations script for ip-tables
# Constantin Lazari, 2016-07-27
# Tested ubuntu version: 16.04
#####################################

# Properties
MY_LAN_IP="192.168.1.31" 		#Fixed IP
ROUTER_LAN_IP="192.168.1.1"
LAN_IP_RANGE="192.168.1.0/8"
LAN_INTERFACE="eth0" #Network-Card connecting to LAN
EXT_INTERFACE="eth0" #Network-Card connecting to Universe
PATH_TO_RULES="/etc/iptables/rules.v4"

echo "Setting up IP-tables for a secure ubuntu system"

echo " 1. Deleting all existing Rules"
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain

echo " 2. Opening all ports"
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
# More specified(only port 22)
# iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# echo " 3. Allowing ICMP with max 3 connections and max of 3 new connections per second"
#iptables -A INPUT -p icmp -m limit --limit 3/second --limit-burst 3 -j ACCEPT
# Client
echo " 3. Allowing ping to the universe, but only responding to local ping requests"
iptables -A INPUT -p icmp -m icmp --icmp-type echo-reply -j ACCEPT
iptables -A OUTPUT -p icmp -m icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -p icmp -s $LAN_IP_RANGE -m icmp --icmp-type echo-request -j ACCEPT
iptables -A OUTPUT -p icmp -d $LAN_IP_RANGE -m icmp --icmp-type echo-reply -j ACCEPT

# Allow traffic related to existing connections
# Changes: 2016-07-22: 50 --> 500
echo " 4. Allowing traffic related to existing connections"
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -m limit --limit 500/second --limit-burst 500 -j ACCEPT

echo " 5. Accepting SSH-requests from LAN"
iptables -A INPUT -p tcp -i $LAN_INTERFACE --dport 22 -d $MY_LAN_IP -s $LAN_IP_RANGE -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -p tcp -o $LAN_INTERFACE --sport 22 -s $MY_LAN_IP -d $LAN_IP_RANGE -m state --state ESTABLISHED,RELATED -j ACCEPT

echo " 6. Allowing Basic Services:"
echo "    - HTTP"
iptables -A INPUT -p tcp --sport 80 -m conntrack --ctstate NEW -m limit --limit 500/minute --limit-burst 2000 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT
echo "    - HTTPS"
iptables -A INPUT -p tcp --sport 443 -m conntrack --ctstate NEW -m limit --limit 500/minute --limit-burst 20000 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT
echo "    - DNS"
iptables -A INPUT -p tcp -i $EXT_INTERFACE --dport 53 -j ACCEPT
iptables -A INPUT -p udp -i $EXT_INTERFACE --dport 53 -j ACCEPT
iptables -A OUTPUT -p tcp -o $EXT_INTERFACE --dport 53 -j ACCEPT
iptables -A OUTPUT -p udp -o $EXT_INTERFACE --dport 53 -j ACCEPT
echo "    - WHOIS"
iptables -A INPUT -p tcp -i $EXT_INTERFACE --dport 43 -j ACCEPT
iptables -A OUTPUT -p tcp -o $EXT_INTERFACE --dport 43 -j ACCEPT
echo "    - Timeserver"
iptables -A INPUT -p udp -i $EXT_INTERFACE --dport 123 -j ACCEPT
iptables -A OUTPUT -p udp -o $EXT_INTERFACE --dport 123 -j ACCEPT
echo "    - Network Printing"
iptables -A INPUT -p udp -i $EXT_INTERFACE --dport 5353 -j ACCEPT
iptables -A OUTPUT -p udp -o $EXT_INTERFACE --dport 5353 -j ACCEPT

#echo "    - SAMBA"
#iptables -A INPUT -p tcp -i $LAN_INTERFACE --dport 137:139 -d $MY_LAN_IP -s $LAN_IP_RANGE -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
#iptables -A INPUT -p udp -i $LAN_INTERFACE --dport 137:139 -d $MY_LAN_IP -s $LAN_IP_RANGE -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
#iptables -A OUTPUT -p tcp -o $LAN_INTERFACE --sport 137:139 -s $MY_LAN_IP -d $LAN_IP_RANGE -m state --state ESTABLISHED,RELATED -j ACCEPT
#iptables -A OUTPUT -p udp -o $LAN_INTERFACE --sport 137:139 -s $MY_LAN_IP -d $LAN_IP_RANGE -m state --state ESTABLISHED,RELATED -j ACCEPT
# echo "    - Emails"
#iptables -A INPUT -p tcp -i $EXT_INTERFACE --dport https --sport 1024:65535 -m state --state NEW -j ACCEPT
#iptables -A INPUT -p tcp -i $EXT_INTERFACE --dport pop3 -j ACCEPT
#iptables -A INPUT -p tcp -i $EXT_INTERFACE --dport smtp -j ACCEPT

echo " 7. Allowing loopback"
iptables -I INPUT 1 -i lo -p all -j ACCEPT
#iptables -A INPUT -i lo -j ACCEPT
#iptables -A OUTPUT -o lo -j ACCEPT

### Removed ... to restrictive ?
#echo " Shutting all doors (aka ports)"
#iptables -P INPUT DROP
#iptables -P OUTPUT DROP
#iptables -P FORWARD DROP

#echo "    c) Allow protocols (http/https)"
# Allow new regular www connections (http:80, https:443, rtmp:1935 [8085-8095 are for cultures])
#iptables -A OUTPUT -p tcp -o $EXT_INTERFACE -m state --state NEW -m multiport --dports 80,443,1935,8085:8095 -j ACCEPT
#iptables -A INPUT -p tcp -i $EXT_INTERFACE  -m state --state ESTABLISHED,RELATED -m multiport --dports 80,443,1935,8085:8095 -j ACCEPT

# Allow all established connections from and to anywhere
#iptables -A INPUT -i $EXT_INTERFACE -m state --state ESTABLISHED,RELATED -j ACCEPT
#iptables -A OUTPUT -o $EXT_INTERFACE -m state --state ESTABLISHED,RELATED -j ACCEPT
### Removed (end)


echo " 7. Droping everything not allowed"
echo "    - Incoming and forwarding traffic"
iptables -P INPUT DROP
iptables -P FORWARD DROP

#echo "    b) Drop IPv6 incomming and forwarding"
#ip6tables -P INPUT DROP
#ip6tables -P FORWARD DROP

echo "    - Whatever else is left"
iptables -A INPUT -j DROP

echo "Writing Rules-File"
iptables-save > $PATH_TO_RULES

echo "Finished: Your Ruleset can be found in $PATH_TO_RULES"
