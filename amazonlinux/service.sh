################################################
# 2.0 SERVICES
################################################

# **********************************************
# 2.1 INETD SERVICES
# **********************************************

# 2.1.1 Ensure chargen services are not enabled (Scored)
# 2.1.2 Ensure daytime services are not enabled (Scored)
# 2.1.3 Ensure discard services are not enabled (Scored)
# 2.1.4 Ensure echo services are not enabled (Scored)
# 2.1.5 Ensure time services are not enabled (Scored)
# 2.1.6 Ensure rsh server is not enabled (Scored)
# 2.1.7 Ensure talk server is not enabled (Scored)
# 2.1.8 Ensure telnet server is not enabled (Scored)
# 2.1.9 Ensure tftp server is not enabled (Scored)
# 2.1.10 Ensure rsync service is not enabled (Scored)
# 2.1.11 Ensure xinetd is not enabled (Scored)

inetd_services=(
    chargen-dgram
    chargen-stream
    daytime-dgram
    daytime-stream
    discard-dgram 
    discard-stream
    echo-dgram
    echo-stream
    time-dgram
    time-stream
    rexec
    rlogin
    rsh
    talk
    telnet
    tftp
    rsync
    xinetd
)

for service in ${inetd_services}
do
    chkconfig ${service} off
done

# **********************************************
# 2.2 SPECIAL PURPOSES SERVICES
# **********************************************

# 2.2.1 Time Synchronization

# 2.2.1.1 Ensure time synchronization is in use (Not Scored)
check_ntp_installed=$(rpm -q ntp)
if [ check_ntp_installed == 'package ntp is not installed' ];
then
    yum install ntp -y
fi

check_chrony_installed=$(rpm -q chrony)
if [ check_chrony_installed == 'package chrony is not installed' ];
then
    yum install chrony -y
fi

# 2.2.1.2 Ensure ntp is configured (Scored)
echo 'restrict -4 default kod nomodify notrap nopeer noquery' | sudo tee -a /etc/ntp.conf >> /dev/null
echo 'restrict -6 default kod nomodify notrap nopeer noquery' | sudo tee -a /etc/ntp.conf >> /dev/null

# 2.2.1.3 Ensure chrony is configured (Scored)
echo 'OPTIONS="-u chrony"' | sudo tee -a  /etc/sysconfig/chronyd >> /dev/null

# 2.2.2 Ensure X Window System is not installed (Scored)
check_xwindows_installed=$(rpm -qa xorg-x11*)
if [ check_xwindows_installed != '' ];
then
    yum remove xorg-x11* -y
fi

# 2.2.3 Ensure Avahi Server is not enabled (Scored)
# 2.2.4 Ensure CUPS is not enabled (Scored)
# 2.2.5 Ensure DHCP Server is not enabled (Scored)
# 2.2.6 Ensure LDAP server is not enabled (Scored)
# 2.2.7 Ensure NFS and RPC are not enabled (Scored)
# 2.2.8 Ensure DNS Server is not enabled (Scored)
# 2.2.9 Ensure FTP Server is not enabled (Scored)
# 2.2.10 Ensure HTTP server is not enabled (Scored)
# 2.2.11 Ensure IMAP and POP3 server is not enabled (Scored)
# 2.2.12 Ensure Samba is not enabled (Scored)
# 2.2.13 Ensure HTTP Proxy Server is not enabled (Scored)
# 2.2.14 Ensure SNMP Server is not enabled (Scored)
# 2.2.16 Ensure NIS Server is not enabled (Scored)


ss_list=(
    avahi-daemon
    cups
    dhcpd
    slapd
    nfs
    rpcbind
    named
    vsftpd
    httpd
    dovecot
    smb
    squid
    snmpd
    ypserv
)

for ss in ${ss_list[*]}
do 
    chkconfig ${ss} off
done

# 2.2.15 Ensure mail transfer agent is configured for local-only mode (Scored)  
mail_conf_file="/etc/postfix/main.cf"
if [ ! -f "$mail_conf_file" ]
then
    echo 'inet_interfaces = loopback-only' | sudo tee -a ${mail_conf_file} >> /dev/null
else
    sed -i '/inet_interfaces/ c\inet_interfaces = loopback-only' ${mail_conf_file}
fi

service postfix restart

# 2.2.16 Ensure NIS Server is not enabled (Scored)
chkconfig ypserv off

# **********************************************
# 2.3 SERVICE CLIENTS
# **********************************************

# 2.3.1 Ensure NIS Client is not installed (Scored)
# 2.3.2 Ensure rsh client is not installed (Scored)
# 2.3.3 Ensure talk client is not installed (Scored)
# 2.3.4 Ensure telnet client is not installed (Scored)
# 2.3.5 Ensure LDAP client is not installed (Scored)

service_clients=(
    ypbind
    rsh
    talk
    telnet
    openldap-clients
)

for client in ${service_clients[*]}:
do
    check_client_installed=$(rpm -q ${client})
    if [ check_client_installed != 'package ${client} is not installed' ];
    then
        yum remove ${client}
    fi
done



############################################################################################# END
