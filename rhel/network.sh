################################################################
# 3 Network Configuration
################################################################

# **********************************************
# 3.1 Network Parameters(Host Only) 
# **********************************************

# 3.1.1 Ensure IP forwarding is disabled (Scored)
sudo grep -Els "^\s*net\.ipv4\.ip_forward\s*=\s*1" /etc/sysctl.conf \
/etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf | while \
read filename; do sudo sed -ri "s/^\s*(net\.ipv4\.ip_forward\s*)(=)(\s*\S+\b).*$/# 
*REMOVED* \1/" $filename; done; sysctl -w net.ipv4.ip_forward=0; sysctl -w net.ipv4.route.flush=1

sudo grep -Els "^\s*net\.ipv6\.conf\.all\.forwarding\s*=\s*1" /etc/sysctl.conf \
/etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf | while \
read filename; do sudo sed -ri \
"s/^\s*(net\.ipv6\.conf\.all\.forwarding\s*)(=)(\s*\S+\b).*$/# *REMOVED* \1/" \
$filename; done; sysctl -w net.ipv6.conf.all.forwarding=0; sysctl -w net.ipv6.route.flush=1

# 3.1.2 Ensure packet redirect sending is disabled (Scored)
# *******************************************
# 3.2 Network Parameters (Host and Router)
# *******************************************

# 3.2.1 Ensure source routed packets are not accepted (Scored)
# 3.2.2 Ensure ICMP redirects are not accepted (Scored)
# 3.2.3 Ensure secure ICMP redirects are not accepted (Scored)
# 3.2.4 Ensure suspicious packets are logged (Scored)

tee -a /etc/sysctl.conf > /dev/null <<EOT
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv6.conf.all.accept_source_route = 0
net.ipv6.conf.default.accept_source_route = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv6.conf.default.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1
EOT

sysctl -w net.ipv4.conf.all.send_redirects=0
sysctl -w net.ipv4.conf.default.send_redirects=0
sysctl -w net.ipv4.route.flush=1
sysctl -w net.ipv4.conf.all.accept_source_route=0
sysctl -w net.ipv4.conf.default.accept_source_route=0
sysctl -w net.ipv6.conf.all.accept_source_route=0
sysctl -w net.ipv6.conf.default.accept_source_route=0
sysctl -w net.ipv4.route.flush=1
sysctl -w net.ipv6.route.flush=1
sysctl -w net.ipv4.conf.all.accept_redirects=0
sysctl -w net.ipv4.conf.default.accept_redirects=0
sysctl -w net.ipv6.conf.all.accept_redirects=0
sysctl -w net.ipv6.conf.default.accept_redirects=0
sysctl -w net.ipv4.route.flush=1
sysctl -w net.ipv6.route.flush=1
sysctl -w net.ipv4.conf.all.secure_redirects=0
sysctl -w net.ipv4.conf.default.secure_redirects=0
sysctl -w net.ipv4.route.flush=1

# 3.2.5 Ensure broadcast ICMP requests are ignored (Scored)
sudo grep -Els "^\s*net\.ipv4\.icmp_echo_ignore_broadcasts\s*=\s*0" \
/etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf \
/run/sysctl.d/*.conf | while read filename; do sudo sed -ri \
"s/^\s*(net\.ipv4\.icmp_echo_ignore_broadcasts\s*)(=)(\s*\S+\b).*$/#
*REMOVED* \1/" $filename; done; sysctl -w net.icmp_echo_ignore_broadcasts=1;
sysctl -w net.ipv4.route.flush=1

# 3.2.6 Ensure bogus ICMP responses are ignored (Scored)
sudo grep -Els "^\s*net\.ipv4\.icmp_ignore_bogus_error_responses\s*=\s*0" \
/etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf \
/run/sysctl.d/*.conf | while read filename; do sudo sed -ri \
"s/^\s*(net\.ipv4\.icmp_ignore_bogus_error_responses\s*)(=)(\s*\S+\b).*$/#
*REMOVED* \1/" $filename; done; 
sysctl -w net.ipv4.icmp_ignore_bogus_error_responses=1; 
sysctl -w net.ipv4.route.flush=1

# 3.2.7 Ensure Reverse Path Filtering is enabled (Scored)
sudo grep -Els "^\s*net\.ipv4\.conf\.all\.rp_filter\s*=\s*0" /etc/sysctl.conf \
/etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf | while \
read filename; do sudo sed -ri \
"s/^\s*(net\.ipv4\.net.ipv4.conf\.all\.rp_filter\s*)(=)(\s*\S+\b).*$/#
*REMOVED* \1/" $filename; done; sysctl -w net.ipv4.conf.all.rp_filter=1;
sysctl -w net.ipv4.route.flush=1

tee -a /etc/sysctl.conf > /dev/null <<EOT 
net.ipv4.conf.default.rp_filter=1
EOT

sysctl -w net.ipv4.conf.default.rp_filter=1
sysctl -w net.ipv4.route.flush=1

# 3.2.8 Ensure TCP SYN Cookies is enabled (Scored)
sudo grep -Els "^\s*net\.ipv4\.tcp_syncookies\s*=\s*[02]*" /etc/sysctl.conf \
/etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf | while \
read filename; do sudo sed -ri \
"s/^\s*(net\.ipv4\.tcp_syncookies\s*)(=)(\s*\S+\b).*$/# 
*REMOVED* \1/" $filename; done; sysctl -w net.ipv4.tcp_syncookies=1;
sysctl -w net.ipv4.route.flush=1

# 3.2.9 Ensure IPv6 router advertisements are not accepted (Scored)
tee -a /etc/sysctl.conf > /dev/null <<EOT 
net.ipv6.conf.all.accept_ra = 0
net.ipv6.conf.default.accept_ra = 0
EOT

sysctl -w net.ipv6.conf.all.accept_ra=0
sysctl -w net.ipv6.conf.default.accept_ra=0
sysctl -w net.ipv6.route.flush=1

# *********************************************************************
# 3.3 Uncommon Network Protocols
# *********************************************************************
 
# 3.3.1 Ensure DCCP is disabled (Scored)
# 3.3.2 Ensure SCTP is disabled (Scored)
# 3.3.3 Ensure RDS is disabled (Scored)
# 3.3.4 Ensure TIPC is disabled (Scored)
tee -a /etc/modprobe.d/ > /dev/null <<EOT 
install dccp /bin/true
install sctp /bin/true
install rds /bin/true
EOT

# *********************************************************************
# 3.4 Firewall Configuration
# *********************************************************************

# 3.4.1 Ensure Firewall software is installed

# 3.4.1.1 Ensure a Firewall package is installed (Scored)
dnf install firewalld -y

# 3.4.2 Configure firewalld

# 3.4.2.1 Ensure firewalld service is enabled and running (Scored)
systemctl --now enable firewalld

# 3.4.2.2 Ensure iptables is not enabled (Scored)
systemctl --now mask iptables

# 3.4.2.3 Ensure nftables is not enabled (Scored)
systemctl --now mask nftables

# 3.4.2.4 Ensure default zone is set (Scored)
firewall-cmd --set-default-zone=public

# 3.4.2.5 Ensure network interfaces are assigned to appropriate zone (Not Scored)
# TODO: firewall-cmd --zone=<Zone NAME> --change-interface=<INTERFACE NAME>

# 3.4.2.6 Ensure unnecessary services and ports are not accepted (Not Scored)
# TODO: firewall-cmd --remove-service=<service>

# 3.4.3 Configure nftables
# 3.4.3.1 Ensure iptables are flushed (Not Scored)
# TODO: remediate

# 3.4.3.2 Ensure a table exists (Scored)
nft create table inet filter

# 3.4.3.3 Ensure base chains exist (Not Scored)
# TODO: remediate

# 3.4.3.4 Ensure loopback traffic is configured (Scored)
nft add rule inet filter input iif lo accept
nft create rule inet filter input ip saddr 127.0.0.0/8 counter drop
nft add rule inet filter input ip6 saddr ::1 counter drop

# 3.4.3.5 Ensure outbound and established connections are configured (Not Scored)
# TODO:remediate

# 3.4.3.6 Ensure default deny firewall policy (Scored)
nft chain inet filter input { policy drop \; }
nft chain inet filter forward { policy drop \; }
nft chain inet filter output { policy drop \; }

# 3.4.3.7 Ensure nftables service is enabled (Scored)
systemctl --now enable nftables

# 3.4.3.8 Ensure nftables rules are permanent (Scored)
tee -a  /etc/sysconfig/nftables.conf > /dev/null <<EOT 
include "/etc/nftables/nftables.rules"
EOT

# 3.4.4 Configure iptables

# 3.4.4.1 Configure IPv4 iptables
# 3.4.4.1.1 Ensure default deny firewall policy (Scored)

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# 3.4.4.1.2 Ensure loopback traffic is configured (Scored)
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -s 127.0.0.0/8 -j DROP

# 3.4.4.1.3 Ensure outbound and established connections are configured (Not Scored)
# TODO: remediate

# 3.4.4.1.4 Ensure firewall rules exist for all open ports (Scored)
iptables -A INPUT -p <protocol> --dport <port> -m state --state NEW -j ACCEPT

# 3.4.4.2 Configure IPv6 ip6tables
# 3.4.4.2.1 Ensure IPv6 default deny firewall policy (Scored)
ip6tables -P INPUT DROP
ip6tables -P OUTPUT DROP
ip6tables -P FORWARD DROP

# 3.4.4.2.2 Ensure IPv6 loopback traffic is configured (Scored)
ip6tables -A INPUT -i lo -j ACCEPT
ip6tables -A OUTPUT -o lo -j ACCEPT
ip6tables -A INPUT -s ::1 -j DROP

# 3.4.4.2.3 Ensure IPv6 outbound and established connections are configured (Not Scored)
ip6tables -A OUTPUT -p tcp -m state --state NEW,ESTABLISHED -j ACCEPT
ip6tables -A OUTPUT -p udp -m state --state NEW,ESTABLISHED -j ACCEPT
ip6tables -A OUTPUT -p icmp -m state --state NEW,ESTABLISHED -j ACCEPT
ip6tables -A INPUT -p tcp -m state --state ESTABLISHED -j ACCEPT
ip6tables -A INPUT -p udp -m state --state ESTABLISHED -j ACCEPT
ip6tables -A INPUT -p icmp -m state --state ESTABLISHED -j ACCEPT

# 3.4.4.2.4 Ensure IPv6 firewall rules exist for all open ports (Not Scored)
# TODO: remediate

# 3.5 Ensure wireless interfaces are disabled (Scored)
nmcli radio all off

# 3.6 Disable IPv6 (Not Scored)
# TODO: remediate

#############################################################################END