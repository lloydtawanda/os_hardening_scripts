################################################
# 4.0 Logging and Auditing
################################################

# **********************************************
# 4.1 Configure System Accounting (auditd)
# **********************************************

# 4.1.1 Ensure auditing is enabled

# 4.1.1.1 Ensure auditd is installed (Scored)
dnf install audit audit-libs -y 

# 4.1.1.2 Ensure auditd service is enabled (Scored)
systemctl --now enable auditd

# 4.1.1.3 Ensure auditing for processes that start prior to auditd is enabled (Scored)
echo 'GRUB_CMDLINE_LINUX="audit=1"' | sudo tee -a /etc/default/grub 
grub2-mkconfig -o /boot/grub2/grub.cfg

# 4.1.1.4 Ensure audit_backlog_limit is sufficient (Scored)
echo 'GRUB_CMDLINE_LINUX="audit_backlog_limit=8192"' | sudo tee -a /etc/default/grub
grub2-mkconfig -o /boot/grub2/grub.cfg

# 4.1.2 Configure Data Retention

# 4.1.2.1 Ensure audit log storage size is configured (Scored)
# TODO:
# Set the following parameter in /etc/audit/auditd.conf in accordance with site policy:
# max_log_file = <MB>

# 4.1.2.2 Ensure audit logs are not automatically deleted (Scored)
sed -i "/max_log_file_action/ c\max_log_file_action = keep_logs" /etc/audit/auditd.conf

# 4.1.2.3 Ensure system is disabled when audit logs are full (Scored)
cat >> /etc/audit/auditd.conf <<EOT
space_left_action = email
action_mail_acct = root
admin_space_left_action = halt
EOT

# 4.1.3 Ensure changes to system administration scope (sudoers) is collected (Scored)
echo "-w /etc/sudoers -p wa -k scope" | sudo tee -a  /etc/audit/rules.d/scope.rules
echo "-w /etc/sudoers.d/ -p wa -k scope" | sudo tee -a  /etc/audit/rules.d/scope.rules

# 4.1.4 Ensure login and logout events are collected (Scored)
echo "-w /var/log/faillog -p wa -k logins" | sudo tee -a  /etc/audit/rules.d/audit.rules
echo "-w /var/log/lastlog -p wa -k logins" | sudo tee -a  /etc/audit/rules.d/audit.rules

# 4.1.5 Ensure session initiation information is collected (Scored)
tee -a /etc/audit/rules.d/logins.rules > /dev/null <<EOT
-w /var/run/utmp -p wa -k session
-w /var/log/wtmp -p wa -k logins
-w /var/log/btmp -p wa -k logins
EOT

# 4.1.6 Ensure events that modify date and time information are collected (Scored)
tee -a /etc/audit/rules.d/time-change.rules > /dev/null <<EOT
-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change
-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k timechange
-a always,exit -F arch=b64 -S clock_settime -k time-change
-a always,exit -F arch=b32 -S clock_settime -k time-change
-w /etc/localtime -p wa -k time-change
EOT

# 4.1.7 Ensure events that modify the system's Mandatory Access Controls are collected (Scored)
tee -a  /etc/audit/rules.d/MAC-policy.rules > /dev/null <<EOT
-w /etc/selinux/ -p wa -k MAC-policy
-w /usr/share/selinux/ -p wa -k MAC-policy
EOT

# 4.1.8 Ensure events that modify the system's network environment are collected (Scored)
tee -a  /etc/audit/rules.d/system-locale.rules > /dev/null <<EOT
a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale
-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale
-w /etc/issue -p wa -k system-locale
-w /etc/issue.net -p wa -k system-locale
-w /etc/hosts -p wa -k system-locale
-w /etc/sysconfig/network -p wa -k system-locale
EOT

# 4.1.9 Ensure discretionary access control permission modification events are collected (Scored)
tee -a  /etc/audit/rules.d/perm_mod.rules > /dev/null <<EOT
-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F
auid!=4294967295 -k perm_mod
-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F
auid!=4294967295 -k perm_mod
-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F
auid>=1000 -F auid!=4294967295 -k perm_mod
-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F
auid>=1000 -F auid!=4294967295 -k perm_mod
-a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S
removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295
-k perm_mod
-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S
removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295
-k perm_mod
EOT

# 4.1.10 Ensure unsuccessful unauthorized file access attempts are collected (Scored)
tee -a  /etc/audit/rules.d/access.rules > /dev/null <<EOT
-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S
ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access
-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S
ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access
-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S
ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access
-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S
ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access
EOT

# 4.1.11 Ensure events that modify user/group information are collected (Scored)
tee -a  /etc/audit/rules.d/identity.rules > /dev/null <<EOT
-w /etc/group -p wa -k identity
-w /etc/passwd -p wa -k identity
-w /etc/gshadow -p wa -k identity
-w /etc/shadow -p wa -k identity
-w /etc/security/opasswd -p wa -k identity
EOT

# 4.1.12 Ensure successful file system mounts are collected (Scored)
tee -a   /etc/audit/rules.d/mounts.rules > /dev/null <<EOT
-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k
mounts
-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k
mounts
EOT

#  4.1.13 Ensure use of privileged commands is collected (Scored)
#  TODO: remediate

# 4.1.14 Ensure file deletion events by users are collected (Scored)
tee -a   /etc/audit/rules.d/delete.rules > /dev/null <<EOT
-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F
auid>=1000 -F auid!=4294967295 -k delete
-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F
auid>=1000 -F auid!=4294967295 -k delete
EOT

# 4.1.15 Ensure kernel module loading and unloading is collected (Scored)
tee -a  /etc/audit/rules.d/modules.rules > /dev/null <<EOT
-w /sbin/insmod -p x -k modules
-w /sbin/rmmod -p x -k modules
-w /sbin/modprobe -p x -k modules
-a always,exit -F arch=b64 -S init_module -S delete_module -k modules
EOT

# 4.1.16 Ensure system administrator actions (sudolog) are collected (Scored)
tee -a  /etc/audit/rules.d/audit.rules > /dev/null <<EOT
-w /var/log/sudo.log -p wa -k actions
EOT

# 4.1.17 Ensure the audit configuration is immutable (Scored)
tee -a  /etc/audit/rules.d/99-finalize.rules > /dev/null <<EOT
-e 2
EOT

# **********************************************
# 4.2 Configure Logging
# **********************************************

# 4.2.1 Configure rsyslog

# 4.2.1.1 Ensure rsyslog is installed (Scored)
dnf install rsyslog -y

# 4.2.1.2 Ensure rsyslog Service is enabled (Scored)
systemctl --now enable rsyslog

# 4.2.1.3 Ensure rsyslog default file permissions configured (Scored)
sed -i '/$FileCreateMode/ c\$FileCreateMode 0640'  /etc/rsyslog.conf  /etc/rsyslog.d/*.conf

# 4.2.1.4 Ensure logging is configured (Not Scored)
# TODO: remediate

# 4.2.1.5 Ensure rsyslog is configured to send logs to a remote log host (Scored)
# TODO: remediate

# 4.2.1.6 Ensure remote rsyslog messages are only accepted on designated log hosts. (Not Scored)
# TODO: remediate

# 4.2.2 Configure journald

# 4.2.2.1 Ensure journald is configured to send logs to rsyslog (Scored)
# 4.2.2.2 Ensure journald is configured to compress large log files (Scored)
# 4.2.2.3 Ensure journald is configured to write logfiles to persistent disk (Scored)
tee -a /etc/systemd/journald.conf > /dev/null <<EOT
ForwardToSyslog=yes
Compress=yes
Storage=persistent
EOT

# 4.2.3 Ensure permissions on all logfiles are configured (Scored)
find /var/log -type f -exec chmod g-wx,o-rwx "{}" + -o -type d -exec chmod gw,o-rwx "{}" +

# 4.3 Ensure logrotate is configured (Not Scored)
# TODO: remediate


