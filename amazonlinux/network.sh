################################################################
# Network Configuration
################################################################

# **********************************************
# 3.1 Network Parameters(Host Only) 
# **********************************************

# 3.1.1  Ensure IP forwarding is disabled (Scored)


check_ip_forward_disabled=$(sysctl net.ipv4.ip_forward)
check_ip_forward_status=$(grep "net\.ipv4\.ip_forward" /etc/sysctl.conf /etc/sysctl.d/*)
if [[ ${check_ip_forwarding_disabled} != 'net.ipv4.ip_forward = 0' || ${check_ip_forward_status} != 'net.ipv4.ip_forward = 0' ]];
then 
    sed -i '/net.ipv4.ip_forward/ c\net.ipv4.ip_forward = 0' /etc/sysctl.conf /etc/sysctl.d/*
    sysctl -w net.ipv4.ip_forward=0
    sysctl -w net.ipv4.route.flush=1
fi

# 3.1.2  Ensure packet redirect sending is disabled (Scored)

check_all_packet_redirect_disabled=$(sysctl net.ipv4.conf.all.send_redirects) 
check_default_packet_redirect_disabled=$(sysctl net.ipv4.conf.default.send_redirects)
check_all_packet_redirect_status=$(grep "net\.ipv4\.conf\.all\.send_redirects" /etc/sysctl.conf/etc/sysctl.d/*)
check_default_packet_redirect_status=$(grep "net\.ipv4\.conf\.default\.send_redirects" /etc/sysctl.conf/etc/sysctl.d/*)
 
if [[ ${check_all_packet_redirect_disabled} != 'net.ipv4.conf.all.send_redirects = 0' || ${check_all_packet_redirect_status} != 'net.ipv4.conf.all.send_redirects = 0' || ${check_default_packet_redirect_disabled} != 'net.ipv4.conf.default.send_redirects = 0' || ${check_default_packet_redirect_status} != 'net.ipv4.conf.default.send_redirects = 0' ]];
then 
    sed -i '/net.ipv4.conf.all.send_redirects/ c\net.ipv4.conf.all.send_redirects = 0' /etc/sysctl.conf/etc/sysctl.d/*
    sed -i '/net.ipv4.conf.default.send_redirects/ c\net.ipv4.conf.default.send_redirects = 0' /etc/sysctl.conf/etc/sysctl.d/*
    sysctl -w net.ipv4.conf.all.send_redirects=0
    sysctl -w net.ipv4.conf.default.send_redirects=0
    sysctl -w net.ipv4.route.flush=1
fi


# **********************************************
# 3.2 Network Parameters(Host and Router) 
# **********************************************

#3.2.1

sed -i '/net.ipv4.conf.all.accept_source_route/ c\net.ipv4.conf.all.accept_source_route = 0'
sed -i 'net.ipv4.conf.default.accept_source_route/ c\net.ipv4.conf.default.accept_source_route = 0'
sysctl -w net.ipv4.conf.all.accept_source_route=0
sysctl -w net.ipv4.conf.default.accept_source_route=0
sysctl -w net.ipv4.route.flush=1

#3.2.2

sed -i '/net.ipv4.conf.all.accept_redirects/ c\net.ipv4.conf.all.accept_redirects = 0'
sed -i '/net.ipv4.conf.default.accept_redirects/ c\net.ipv4.conf.default.accept_redirects = 0'
sysctl -w net.ipv4.conf.all.accept_redirects=0
sysctl -w net.ipv4.conf.default.accept_redirects=0
sysctl -w net.ipv4.route.flush=1

#3.2.3

sed -i '/net.ipv4.conf.all.secure_redirects/ c\net.ipv4.conf.all.secure_redirects = 0'
sed -i '/net.ipv4.conf.default.secure_redirects/ c\net.ipv4.conf.default.secure_redirects = 0'
sysctl -w net.ipv4.conf.all.secure_redirects=0
sysctl -w net.ipv4.conf.default.secure_redirects=0
sysctl -w net.ipv4.route.flush=1

#3.2.4

sed -i '/net.ipv4.conf.all.log_martians/ c\net.ipv4.conf.all.log_martians = 1'
sed -i '/net.ipv4.conf.default.log_martians/ c\net.ipv4.conf.default.log_martians = 1'
sysctl -w net.ipv4.conf.all.log_martians=1
sysctl -w net.ipv4.conf.default.log_martians=1
sysctl -w net.ipv4.route.flush=1

#3.2.5

sed -i '/net.ipv4.icmp_echo_ignore_broadcasts/ c\net.ipv4.icmp_echo_ignore_broadcasts = 1'
sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1
sysctl -w net.ipv4.route.flush=1

#3.2.6

sed -i '/net.ipv4.icmp_ignore_bogus_error_responses/ c\net.ipv4.icmp_ignore_bogus_error_responses = 1'
sysctl -w net.ipv4.icmp_ignore_bogus_error_responses=1
sysctl -w net.ipv4.route.flush=1

#3.2.7

sed -i '/net.ipv4.conf.all.rp_filter/ c\net.ipv4.conf.all.rp_filter = 1'
sed -i '/net.ipv4.conf.default.rp_filter/ c\net.ipv4.conf.default.rp_filter = 1'
sysctl -w net.ipv4.conf.all.rp_filter=1
sysctl -w net.ipv4.conf.default.rp_filter=1
sysctl -w net.ipv4.route.flush=1

#3.2.8

sed -i '/net.ipv4.tcp_syncookies/ c\net.ipv4.tcp_syncookies = 1'
sysctl -w net.ipv4.tcp_syncookies=1
sysctl -w net.ipv4.route.flush=1

# **********************************************
# 3.3 IPv6
# **********************************************

#3.3.1

sed -i '/net.ipv6.conf.all.accept_ra/ c\net.ipv6.conf.all.accept_ra = 0'
sed -i '/net.ipv6.conf.default.accept_ra/ c\net.ipv6.conf.default.accept_ra = 0'
sysctl -w net.ipv6.conf.all.accept_ra=0
sysctl -w net.ipv6.conf.default.accept_ra=0
sysctl -w net.ipv6.route.flush=1

#3.3.2

sed -i '/net.ipv6.conf.all.accept_redirects/ c\net.ipv6.conf.all.accept_redirects = 0'
sed -i '/net.ipv6.conf.default.accept_redirects/ c\net.ipv6.conf.default.accept_redirects = 0'
sysctl -w net.ipv6.conf.all.accept_redirects=0
sysctl -w net.ipv6.conf.default.accept_redirects=0
sysctl -w net.ipv6.route.flush=1

#3.3.3 To Edit 

#Edit /boot/grub/grub.conf to include ipv6.disable=1 on all kernel lines.

# **********************************************
# 3.4 TCP Wrappers
# **********************************************

#3.4.1

yum install tcp_wrappers

#3.4.2

echo "ALL: <net>/<mask>, <net>/<mask>, ..." >/etc/hosts.allow
#where each <net>/<mask> combination (for example, "192.168.1.0/255.255.255.0")
#represents one network block in use by your organization that requires access to this
#system.

#3.4.3

#Run the following command to create /etc/hosts.deny :
echo "ALL: ALL" >> /etc/hosts.deny

#3.4.4

chown root:root /etc/hosts.allow
chmod 644 /etc/hosts.allow

#3.4.5

chown root:root /etc/hosts.deny
chmod 644 /etc/hosts.deny

# **********************************************
# 3.5 Uncommon Network Protocols
# **********************************************

#3.5.1

#Run the following commands and verify the output is as indicated:
## modprobe -n -v dccp
#install /bin/true
## lsmod | grep dccp
#<No output>

#Edit or create the file /etc/modprobe.d/CIS.conf and add the following line:
cat >> /etc/modprobe.d/CIS.conf <<EOH
install dccp /bin/true
install sctp /bin/true
install rds /bin/true
install tipc /bin/true
EOH
#3.5.2

#Run the following commands and verify the output is as indicated:
## modprobe -n -v sctp
#install /bin/true
## lsmod | grep sctp
#<No output>

#Edit or create the file /etc/modprobe.d/CIS.conf and add the following line:


#3.5.3

#Run the following commands and verify the output is as indicated:
## modprobe -n -v rds
#install /bin/true
## lsmod | grep rds
#<No output>

#Edit or create the file /etc/modprobe.d/CIS.conf and add the following line:


#3.5.4

#Run the following commands and verify the output is as indicated:
## modprobe -n -v tipc
#install /bin/true
## lsmod | grep tipc
#<No output>

#Edit or create the file /etc/modprobe.d/CIS.conf and add the following line:


# **********************************************
# 3.6 Firewall Configuration
# **********************************************

#3.6.1

yum install iptables

#3.6.2

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

#3.6.3

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -s 127.0.0.0/8 -j DROP

#3.6.4

iptables -A OUTPUT -p tcp -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p udp -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p icmp -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -p udp -m state --state ESTABLISHED -j ACCEPT
iptables -A INPUT -p icmp -m state --state ESTABLISHED -j ACCEPT

#3.6.5

# iptables -L INPUT -v -n
#For each port identified in the audit which does not have a firewall rule establish a proper
#rule for accepting inbound connections:

#Todo iptables -A INPUT -p <protocol> --dport <port> -m state --state NEW -j ACCEPT

