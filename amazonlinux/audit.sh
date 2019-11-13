################################################
# 4.0 Logging and Auditing
################################################

# **********************************************
# 4.1 Configure System Accounting (auditd)
# **********************************************

# 4.1.1 Configure Data Retention

# 4.1.1.1 Ensure audit log storage size is configured (Not Scored)
# TODO: Set the following parameter in /etc/audit/auditd.conf in accordance with site policy => max_log_file = <MB>

# 4.1.1.2 Ensure system is disabled when audit logs are full (Scored)

audit_file="/etc/audit/auditd.conf"
sed -i '/space_left_action/ c\space_left_action = email' ${audit_file}
sed -i '/action_mail_acct/ c\action_mail_acct = root' ${audit_file}
sed -i '/admin_space_left_action/ c\admin_space_left_action = halt' ${audit_file}

# 4.1.1.3 Ensure audit logs are not automatically deleted (Scored)
sed -i '/max_log_file_action/ c\max_log_file_action = keep_logs' ${audit_file}

# 4.1.2 Ensure auditd service is enabled (Scored)
chkconfig auditd on

# 4.1.3 Ensure auditing for processes that start prior to auditd is enabled (Scored)
sed 's/^kernel.*/& audit=1/' /boot/grub/menu.lst

# 4.1.4 Ensure events that modify date and time information are collected (Scored)
# 4.1.5 Ensure events that modify user/group information are collected (Scored)
# 4.1.6 Ensure events that modify the system's network environment are collected (Scored)
# 4.1.7 Ensure events that modify the system's Mandatory Access Controls are collected (Scored)
# 4.1.8 Ensure login and logout events are collected (Scored)
# 4.1.9 Ensure session initiation information is collected (Scored)
# 4.1.10 Ensure discretionary access control permission modification events are collected (Scored)
# 4.1.11 Ensure unsuccessful unauthorized file access attempts are collected (Scored)
# 4.1.12 Ensure use of privileged commands is collected (Scored)
# 4.1.13 Ensure successful file system mounts are collected (Scored)
# 4.1.14 Ensure file deletion events by users are collected (Scored)
# 4.1.15 Ensure changes to system administration scope (sudoers) is collected (Scored)
# 4.1.16 Ensure system administrator actions (sudolog) are collected (Scored)
# 4.1.17 Ensure kernel module loading and unloading is collected (Scored)
# 4.1.18 Ensure the audit configuration is immutable (Scored)

cat >>  /etc/audit/audit.rules <<EOL
-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change
-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k timechange
-a always,exit -F arch=b64 -S clock_settime -k time-change
-a always,exit -F arch=b32 -S clock_settime -k time-change
-w /etc/localtime -p wa -k time-change
-w /etc/group -p wa -k identity
-w /etc/passwd -p wa -k identity
-w /etc/gshadow -p wa -k identity
-w /etc/shadow -p wa -k identity
-w /etc/security/opasswd -p wa -k identity
-a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale
-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale
-w /etc/issue -p wa -k system-locale
-w /etc/issue.net -p wa -k system-locale
-w /etc/hosts -p wa -k system-locale
-w /etc/sysconfig/network -p wa -k system-locale
-w /etc/sysconfig/network-scripts/ -p wa -k system-locale
-w /etc/selinux/ -p wa -k MAC-policy
-w /usr/share/selinux/ -p wa -k MAC-policy
-w /var/log/lastlog -p wa -k logins
-w /var/run/faillock/ -p wa -k logins
-w /var/run/utmp -p wa -k session
-w /var/log/wtmp -p wa -k logins
-w /var/log/btmp -p wa -k logins
-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=500 -F
auid!=4294967295 -k perm_mod
-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=500 -F
auid!=4294967295 -k perm_mod
-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F
auid>=500 -F auid!=4294967295 -k perm_mod
-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F
auid>=500 -F auid!=4294967295 -k perm_mod
-a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S
removexattr -S lremovexattr -S fremovexattr -F auid>=500 -F auid!=4294967295
-k perm_mod
-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S
removexattr -S lremovexattr -S fremovexattr -F auid>=500 -F auid!=4294967295
-k perm_mod
-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S
ftruncate -F exit=-EACCES -F auid>=500 -F auid!=4294967295 -k access
-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S
ftruncate -F exit=-EACCES -F auid>=500 -F auid!=4294967295 -k access
-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S
ftruncate -F exit=-EPERM -F auid>=500 -F auid!=4294967295 -k access
-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S
ftruncate -F exit=-EPERM -F auid>=500 -F auid!=4294967295 -k access
-a always,exit -F arch=b64 -S mount -F auid>=500 -F auid!=4294967295 -k
mounts
-a always,exit -F arch=b32 -S mount -F auid>=500 -F auid!=4294967295 -k
mounts
-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F
auid>=500 -F auid!=4294967295 -k delete
-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F
auid>=500 -F auid!=4294967295 -k delete
-w /etc/sudoers -p wa -k scope
-w /etc/sudoers.d/ -p wa -k scope
-w /var/log/sudo.log -p wa -k actions
-w /sbin/insmod -p x -k modules
-w /sbin/rmmod -p x -k modules
-w /sbin/modprobe -p x -k modules
-a always,exit -F arch=b64 -S init_module -S delete_module -k modules
-e 2
EOL

# **********************************************
# 4.2 Configure Logging
# **********************************************

# 4.2.1 Configure rsyslog
# 4.2.1.1 Ensure rsyslog Service is enabled (Scored)
chkconfig rsyslog on

