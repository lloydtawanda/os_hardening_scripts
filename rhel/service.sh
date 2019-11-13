################################################
# 2.0 SERVICES
################################################

# **********************************************
# 2.1 INETD SERVICES
# **********************************************

# 2.1.1 Ensure xinetd is not installed (Scored)
dnf remove xinetd -y >> /dev/null

# **********************************************
# 2.2 Special Purpose Services
# **********************************************

# 2.2 Special Purpose Services

# 2.2.1.1 Ensure time synchronization is in use (Not Scored)
dnf install chrony -y >> /dev/null

# 2.2.1.2 Ensure chrony is configured (Scored)
# TODO: remediate

# 2.2.2 Ensure X Window System is not installed (Scored)
dnf remove xorg-x11* -y >> /dev/null

#  2.2.3 Ensure rsync service is not enabled (Scored)
systemctl --now disable rsyncd

# 2.2.4 Ensure Avahi Server is not enabled (Scored)
systemctl --now disable avahi-daemon

# 2.2.5 Ensure SNMP Server is not enabled (Scored)
systemctl --now disable snmpd

# 2.2.6 Ensure HTTP Proxy Server is not enabled (Scored)
systemctl --now disable squid

# 2.2.7 Ensure Samba is not enabled (Scored)
systemctl --now disable smb

# 2.2.8 Ensure IMAP and POP3 server is not enabled (Scored)
systemctl --now disable dovecot

# 2.2.9 Ensure HTTP server is not enabled (Scored)
systemctl --now disable httpd

# 2.2.10 Ensure FTP Server is not enabled (Scored)
systemctl --now disable vsftpd

# 2.2.11 Ensure DNS Server is not enabled (Scored)
systemctl --now disable named

# 2.2.12 Ensure NFS is not enabled (Scored)
systemctl --now disable nfs

# 2.2.13 Ensure RPC is not enabled (Scored)
systemctl --now disable rpcbind

# 2.2.14 Ensure LDAP server is not enabled (Scored)
systemctl --now disable slapd

# 2.2.15 Ensure DHCP Server is not enabled (Scored)
systemctl --now disable dhcpd

# 2.2.16 Ensure CUPS is not enabled (Scored)
systemctl --now disable cups

# 2.2.17 Ensure NIS Server is not enabled (Scored)
systemctl --now disable ypserv

# 2.2.18 Ensure mail transfer agent is configured for local-only mode (Scored)
tee -a /etc/postfix/main.cf > /dev/null <<EOT
inet_interfaces = loopback-only
EOT
systemctl restart postfix

# ****************************************************************************
# 2.3 Service Clients
# ****************************************************************************

# 2.3.1 Ensure NIS Client is not installed (Scored)
dnf remove ypbind -y >> /dev/null

# 2.3.2 Ensure telnet client is not installed (Scored)
dnf remove telnet -y >> /dev/null

# 2.3.3 Ensure LDAP client is not installed (Scored)
dnf remove openldap-clients -y >> /dev/null

##############################################################################END