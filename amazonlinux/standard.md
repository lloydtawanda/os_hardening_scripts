1 Initial Setup.....z
1.1 Filesystem Configuration............................................................................................................... 17
1.1.1.1 Ensure mounting of cramfs filesystems is disabled (Scored).............................. 18
1.1.1.2 Ensure mounting of freevxfs filesystems is disabled (Scored)............................ 20
1.1.1.3 Ensure mounting of jffs2 filesystems is disabled (Scored)................................... 21
1.1.1.4 Ensure mounting of hfs filesystems is disabled (Scored)...................................... 22
1.1.1.5 Ensure mounting of hfsplus filesystems is disabled (Scored)............................. 23
1.1.1.6 Ensure mounting of squashfs filesystems is disabled (Scored).......................... 24
1.1.1.7 Ensure mounting of udf filesystems is disabled (Scored)..................................... 25
1.1.1.8 Ensure mounting of FAT filesystems is disabled (Scored) ................................... 26
1.1.2 Ensure separate partition exists for /tmp (Scored).................................................... 28
1.1.3 Ensure nodev option set on /tmp partition (Scored)................................................. 30
1.1.4 Ensure nosuid option set on /tmp partition (Scored)................................................ 31
1.1.5 Ensure noexec option set on /tmp partition (Scored)............................................... 32
1.1.6 Ensure separate partition exists for /var (Scored)..................................................... 33
1.1.7 Ensure separate partition exists for /var/tmp (Scored)........................................... 34
1.1.8 Ensure nodev option set on /var/tmp partition (Scored)........................................ 35
1.1.9 Ensure nosuid option set on /var/tmp partition (Scored)....................................... 36
1.1.10 Ensure noexec option set on /var/tmp partition (Scored).................................... 37
1.1.11 Ensure separate partition exists for /var/log (Scored).......................................... 38
3 | P a g e
1.1.12 Ensure separate partition exists for /var/log/audit (Scored) ............................. 40
1.1.13 Ensure separate partition exists for /home (Scored).............................................. 42
1.1.14 Ensure nodev option set on /home partition (Scored)........................................... 43
1.1.15 Ensure nodev option set on /dev/shm partition (Scored).................................... 44
1.1.16 Ensure nosuid option set on /dev/shm partition (Scored)................................... 45
1.1.17 Ensure noexec option set on /dev/shm partition (Scored) .................................. 46
1.1.18 Ensure sticky bit is set on all world-writable directories (Scored).................... 47
1.1.19 Disable Automounting (Scored)....................................................................................... 48
1.2 Configure Software Updates ......................................................................................................... 50
1.2.1 Ensure package manager repositories are configured (Not Scored)................... 50
1.2.2 Ensure GPG keys are configured (Not Scored).............................................................. 52
1.2.3 Ensure gpgcheck is globally activated (Scored) ........................................................... 53
1.3 Filesystem Integrity Checking...................................................................................................... 54
1.3.1 Ensure AIDE is installed (Scored)...................................................................................... 54
1.3.2 Ensure filesystem integrity is regularly checked (Scored)....................................... 56
1.4 Secure Boot Settings ........................................................................................................................ 58
1.4.1 Ensure permissions on bootloader config are configured (Scored)..................... 58
1.4.2 Ensure authentication required for single user mode (Scored)............................. 60
1.4.3 Ensure interactive boot is not enabled (Scored).......................................................... 61
1.5 Additional Process Hardening ..................................................................................................... 62
1.5.1 Ensure core dumps are restricted (Scored)................................................................... 62
1.5.2 Ensure XD/NX support is enabled (Not Scored) .......................................................... 64
1.5.3 Ensure address space layout randomization (ASLR) is enabled (Scored)......... 66
1.5.4 Ensure prelink is disabled (Scored).................................................................................. 68
1.6 Mandatory Access Control............................................................................................................. 69
1.6.1.1 Ensure SELinux is not disabled in bootloader configuration (Scored)............ 71
1.6.1.2 Ensure the SELinux state is enforcing (Scored)........................................................ 73
1.6.1.3 Ensure SELinux policy is configured (Scored)........................................................... 74
1.6.1.4 Ensure SETroubleshoot is not installed (Scored)..................................................... 75
1.6.1.5 Ensure the MCS Translation Service (mcstrans) is not installed (Scored)..... 76
4 | P a g e
1.6.1.6 Ensure no unconfined daemons exist (Scored)......................................................... 77
1.6.2 Ensure SELinux is installed (Scored)................................................................................ 78
1.7 Warning Banners............................................................................................................................... 78
1.7.1.1 Ensure message of the day is configured properly (Scored) ............................... 80
1.7.1.2 Ensure local login warning banner is configured properly (Not Scored)....... 82
1.7.1.3 Ensure remote login warning banner is configured properly (Not Scored).. 84
1.7.1.4 Ensure permissions on /etc/motd are configured (Not Scored) ....................... 86
1.7.1.5 Ensure permissions on /etc/issue are configured (Scored)................................ 87
1.7.1.6 Ensure permissions on /etc/issue.net are configured (Not Scored)................ 88
1.8 Ensure updates, patches, and additional security software are installed (Not
Scored)..................................................................................................................................................... 89
2 Services.......................................................................................................................................................... 90
2.1 inetd Services...................................................................................................................................... 91
2.1.1 Ensure chargen services are not enabled (Scored)..................................................... 91
2.1.2 Ensure daytime services are not enabled (Scored)..................................................... 93
2.1.3 Ensure discard services are not enabled (Scored) ...................................................... 94
2.1.4 Ensure echo services are not enabled (Scored)............................................................ 95
2.1.5 Ensure time services are not enabled (Scored)............................................................ 96
2.1.6 Ensure rsh server is not enabled (Scored)...................................................................... 97
2.1.7 Ensure talk server is not enabled (Scored) .................................................................... 99
2.1.8 Ensure telnet server is not enabled (Scored) ..............................................................100
2.1.9 Ensure tftp server is not enabled (Scored)...................................................................101
2.1.10 Ensure rsync service is not enabled (Scored)...........................................................102
2.1.11 Ensure xinetd is not enabled (Scored).........................................................................103
2.2 Special Purpose Services..............................................................................................................103
2.2.1.1 Ensure time synchronization is in use (Not Scored).............................................104
2.2.1.2 Ensure ntp is configured (Scored)................................................................................106
2.2.1.3 Ensure chrony is configured (Scored) ........................................................................108
2.2.2 Ensure X Window System is not installed (Scored)..................................................110
2.2.3 Ensure Avahi Server is not enabled (Scored)..............................................................111
2.2.4 Ensure CUPS is not enabled (Scored) .............................................................................112
5 | P a g e
2.2.5 Ensure DHCP Server is not enabled (Scored)..............................................................114
2.2.6 Ensure LDAP server is not enabled (Scored)...............................................................115
2.2.7 Ensure NFS and RPC are not enabled (Scored)...........................................................116
2.2.8 Ensure DNS Server is not enabled (Scored).................................................................117
2.2.9 Ensure FTP Server is not enabled (Scored)..................................................................118
2.2.10 Ensure HTTP server is not enabled (Scored)............................................................119
2.2.11 Ensure IMAP and POP3 server is not enabled (Scored)........................................120
2.2.12 Ensure Samba is not enabled (Scored)........................................................................121
2.2.13 Ensure HTTP Proxy Server is not enabled (Scored)...............................................122
2.2.14 Ensure SNMP Server is not enabled (Scored)...........................................................123
2.2.15 Ensure mail transfer agent is configured for local-only mode (Scored).........124
2.2.16 Ensure NIS Server is not enabled (Scored)................................................................126
2.3 Service Clients ..................................................................................................................................127
2.3.1 Ensure NIS Client is not installed (Scored)...................................................................127
2.3.2 Ensure rsh client is not installed (Scored)....................................................................129
2.3.3 Ensure talk client is not installed (Scored)...................................................................131
2.3.4 Ensure telnet client is not installed (Scored)...............................................................132
2.3.5 Ensure LDAP client is not installed (Scored)...............................................................133
3 Network Configuration..........................................................................................................................133
3.1 Network Parameters (Host Only).............................................................................................134
3.1.1 Ensure IP forwarding is disabled (Scored)...................................................................134
3.1.2 Ensure packet redirect sending is disabled (Scored)...............................................136
3.2 Network Parameters (Host and Router)................................................................................138
3.2.1 Ensure source routed packets are not accepted (Scored)......................................138
3.2.2 Ensure ICMP redirects are not accepted (Scored).....................................................140
3.2.3 Ensure secure ICMP redirects are not accepted (Scored) ......................................142
3.2.4 Ensure suspicious packets are logged (Scored)..........................................................144
3.2.5 Ensure broadcast ICMP requests are ignored (Scored)...........................................146
3.2.6 Ensure bogus ICMP responses are ignored (Scored)................................................148
3.2.7 Ensure Reverse Path Filtering is enabled (Scored)...................................................150
6 | P a g e
3.2.8 Ensure TCP SYN Cookies is enabled (Scored)..............................................................152
3.3 IPv6.......................................................................................................................................................154
3.3.1 Ensure IPv6 router advertisements are not accepted (Not Scored)...................154
3.3.2 Ensure IPv6 redirects are not accepted (Not Scored)..............................................156
3.3.3 Ensure IPv6 is disabled (Not Scored).............................................................................158
3.4 TCP Wrappers...................................................................................................................................159
3.4.1 Ensure TCP Wrappers is installed (Scored).................................................................159
3.4.2 Ensure /etc/hosts.allow is configured (Scored).........................................................161
3.4.3 Ensure /etc/hosts.deny is configured (Scored)..........................................................162
3.4.4 Ensure permissions on /etc/hosts.allow are configured (Scored).....................163
3.4.5 Ensure permissions on /etc/hosts.deny are configured (Scored) ......................164
3.5 Uncommon Network Protocols .................................................................................................165
3.5.1 Ensure DCCP is disabled (Not Scored) ...........................................................................165
3.5.2 Ensure SCTP is disabled (Not Scored)............................................................................167
3.5.3 Ensure RDS is disabled (Not Scored)..............................................................................168
3.5.4 Ensure TIPC is disabled (Not Scored).............................................................................169
3.6 Firewall Configuration ..................................................................................................................170
3.6.1 Ensure iptables is installed (Scored)...............................................................................170
3.6.2 Ensure default deny firewall policy (Scored)..............................................................172
3.6.3 Ensure loopback traffic is configured (Scored) ..........................................................174
3.6.4 Ensure outbound and established connections are configured (Not Scored) 176
3.6.5 Ensure firewall rules exist for all open ports (Scored)............................................178
4 Logging and Auditing .............................................................................................................................179
4.1 Configure System Accounting (auditd)...................................................................................180
4.1.1.1 Ensure audit log storage size is configured (Not Scored) ...................................181
4.1.1.2 Ensure system is disabled when audit logs are full (Scored) ............................183
4.1.1.3 Ensure audit logs are not automatically deleted (Scored)..................................184
4.1.2 Ensure auditd service is enabled (Scored) ...................................................................185
4.1.3 Ensure auditing for processes that start prior to auditd is enabled (Scored) 186
4.1.4 Ensure events that modify date and time information are collected (Scored)
...................................................................................................................................................................187
7 | P a g e
4.1.5 Ensure events that modify user/group information are collected (Scored)...189
4.1.6 Ensure events that modify the system's network environment are collected
(Scored).................................................................................................................................................191
4.1.7 Ensure events that modify the system's Mandatory Access Controls are
collected (Scored)..............................................................................................................................194
4.1.8 Ensure login and logout events are collected (Scored)............................................196
4.1.9 Ensure session initiation information is collected (Scored)..................................198
4.1.10 Ensure discretionary access control permission modification events are
collected (Scored)..............................................................................................................................200
4.1.11 Ensure unsuccessful unauthorized file access attempts are collected (Scored)
...................................................................................................................................................................203
4.1.12 Ensure use of privileged commands is collected (Scored)...................................205
4.1.13 Ensure successful file system mounts are collected (Scored)............................207
4.1.14 Ensure file deletion events by users are collected (Scored)................................209
4.1.15 Ensure changes to system administration scope (sudoers) is collected
(Scored).................................................................................................................................................211
4.1.16 Ensure system administrator actions (sudolog) are collected (Scored)........213
4.1.17 Ensure kernel module loading and unloading is collected (Scored)................215
4.1.18 Ensure the audit configuration is immutable (Scored).........................................217
4.2 Configure Logging...........................................................................................................................218
4.2.1.1 Ensure rsyslog Service is enabled (Scored)..............................................................219
4.2.1.2 Ensure logging is configured (Not Scored) ...............................................................221
4.2.1.3 Ensure rsyslog default file permissions configured (Scored)............................223
4.2.1.4 Ensure rsyslog is configured to send logs to a remote log host (Scored) .....225
4.2.1.5 Ensure remote rsyslog messages are only accepted on designated log hosts.
(Not Scored).........................................................................................................................................227
4.2.2.1 Ensure syslog-ng service is enabled (Scored)..........................................................229
4.2.2.2 Ensure logging is configured (Not Scored) ...............................................................231
4.2.2.3 Ensure syslog-ng default file permissions configured (Scored).......................233
4.2.2.4 Ensure syslog-ng is configured to send logs to a remote log host (Not Scored)
...................................................................................................................................................................234
8 | P a g e
4.2.2.5 Ensure remote syslog-ng messages are only accepted on designated log hosts
(Not Scored).........................................................................................................................................236
4.2.3 Ensure rsyslog or syslog-ng is installed (Scored)......................................................238
4.2.4 Ensure permissions on all logfiles are configured (Scored)..................................240
4.3 Ensure logrotate is configured (Not Scored)...................................................................241
5 Access, Authentication and Authorization.....................................................................................241
5.1 Configure cron..................................................................................................................................242
5.1.1 Ensure cron daemon is enabled (Scored).....................................................................242
5.1.2 Ensure permissions on /etc/crontab are configured (Scored) ............................243
5.1.3 Ensure permissions on /etc/cron.hourly are configured (Scored).....................244
5.1.4 Ensure permissions on /etc/cron.daily are configured (Scored)........................245
5.1.5 Ensure permissions on /etc/cron.weekly are configured (Scored) ...................246
5.1.6 Ensure permissions on /etc/cron.monthly are configured (Scored).................247
5.1.7 Ensure permissions on /etc/cron.d are configured (Scored)...............................248
5.1.8 Ensure at/cron is restricted to authorized users (Scored) ....................................249
5.2 SSH Server Configuration.............................................................................................................251
5.2.1 Ensure permissions on /etc/ssh/sshd_config are configured (Scored)............251
5.2.2 Ensure SSH Protocol is set to 2 (Scored).......................................................................253
5.2.3 Ensure SSH LogLevel is set to INFO (Scored)..............................................................254
5.2.4 Ensure SSH X11 forwarding is disabled (Scored)......................................................255
5.2.5 Ensure SSH MaxAuthTries is set to 4 or less (Scored).............................................256
5.2.6 Ensure SSH IgnoreRhosts is enabled (Scored)............................................................257
5.2.7 Ensure SSH HostbasedAuthentication is disabled (Scored)..................................258
5.2.8 Ensure SSH root login is disabled (Scored)..................................................................259
5.2.9 Ensure SSH PermitEmptyPasswords is disabled (Scored).....................................260
5.2.10 Ensure SSH PermitUserEnvironment is disabled (Scored).................................261
5.2.11 Ensure only approved MAC algorithms are used (Scored)..................................262
5.2.12 Ensure SSH Idle Timeout Interval is configured (Scored) ...................................264
5.2.13 Ensure SSH LoginGraceTime is set to one minute or less (Scored)..................266
5.2.14 Ensure SSH access is limited (Scored).........................................................................267
5.2.15 Ensure SSH warning banner is configured (Scored)..............................................269
9 | P a g e
5.3 Configure PAM..................................................................................................................................270
5.3.1 Ensure password creation requirements are configured (Scored) ....................270
5.3.2 Ensure lockout for failed password attempts is configured (Scored)................273
5.3.3 Ensure password reuse is limited (Scored)..................................................................275
5.3.4 Ensure password hashing algorithm is SHA-512 (Scored)....................................277
5.4 User Accounts and Environment ..............................................................................................278
5.4.1.1 Ensure password expiration is 365 days or less (Scored)..................................279
5.4.1.2 Ensure minimum days between password changes is 7 or more (Scored) .281
5.4.1.3 Ensure password expiration warning days is 7 or more (Scored)..................283
5.4.1.4 Ensure inactive password lock is 30 days or less (Scored)................................285
5.4.1.5 Ensure all users last password change date is in the past (Scored)................287
5.4.2 Ensure system accounts are non-login (Scored)........................................................288
5.4.3 Ensure default group for the root account is GID 0 (Scored)................................290
5.4.4 Ensure default user umask is 027 or more restrictive (Scored)..........................291
5.4.5 Ensure default user shell timeout is 900 seconds or less (Scored).....................293
5.5 Ensure access to the su command is restricted (Scored)...........................................294
6 System Maintenance...............................................................................................................................295
6.1 System File Permissions...............................................................................................................296
6.1.1 Audit system file permissions (Not Scored).................................................................296
6.1.2 Ensure permissions on /etc/passwd are configured (Scored).............................298
6.1.3 Ensure permissions on /etc/shadow are configured (Scored)............................299
6.1.4 Ensure permissions on /etc/group are configured (Scored)................................300
6.1.5 Ensure permissions on /etc/gshadow are configured (Scored)..........................301
6.1.6 Ensure permissions on /etc/passwd- are configured (Scored)...........................302
6.1.7 Ensure permissions on /etc/shadow- are configured (Scored)...........................303
6.1.8 Ensure permissions on /etc/group- are configured (Scored) ..............................304
6.1.9 Ensure permissions on /etc/gshadow- are configured (Scored) ........................305
6.1.10 Ensure no world writable files exist (Scored) ..........................................................306
6.1.11 Ensure no unowned files or directories exist (Scored).........................................307
6.1.12 Ensure no ungrouped files or directories exist (Scored)......................................308
10 | P a g e
6.1.13 Audit SUID executables (Not Scored)...........................................................................309
6.1.14 Audit SGID executables (Not Scored)...........................................................................310
6.2 User and Group Settings...............................................................................................................312
6.2.1 Ensure password fields are not empty (Scored)........................................................312
6.2.2 Ensure no legacy "+" entries exist in /etc/passwd (Scored).................................314
6.2.3 Ensure no legacy "+" entries exist in /etc/shadow (Scored).................................315
6.2.4 Ensure no legacy "+" entries exist in /etc/group (Scored) ....................................316
6.2.5 Ensure root is the only UID 0 account (Scored)..........................................................317
6.2.6 Ensure root PATH Integrity (Scored) .............................................................................318
6.2.7 Ensure all users' home directories exist (Scored).....................................................320
6.2.8 Ensure users' home directories permissions are 750 or more restrictive
(Scored).................................................................................................................................................321
6.2.9 Ensure users own their home directories (Scored)..................................................323
6.2.10 Ensure users' dot files are not group or world writable (Scored)....................324
6.2.11 Ensure no users have .forward files (Scored)...........................................................326
6.2.12 Ensure no users have .netrc files (Scored).................................................................327
6.2.13 Ensure users' .netrc Files are not group or world accessible (Scored)...........329
6.2.14 Ensure no users have .rhosts files (Scored)...............................................................331
6.2.15 Ensure all groups in /etc/passwd exist in /etc/group (Scored).......................333
6.2.16 Ensure no duplicate UIDs exist (Scored) ....................................................................334
6.2.17 Ensure no duplicate GIDs exist (Scored).....................................................................335
6.2.18 Ensure no duplicate user names exist (Scored).......................................................336
6.2.19 Ensure no duplicate group names exist (Scored)....................................................337