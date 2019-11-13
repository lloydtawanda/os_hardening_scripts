1 Initial Setup.................................................................................................................................................. 18
1.1 Filesystem Configuration............................................................................................................... 19
1.1.1 Disable unused filesystems................................................................................................... 20
1.1.1.1 Ensure mounting of cramfs filesystems is disabled (Scored)......................... 21
1.1.1.2 Ensure mounting of vFAT filesystems is limited (Not Scored)....................... 23
1.1.1.3 Ensure mounting of squashfs filesystems is disabled (Scored)..................... 25
1.1.1.4 Ensure mounting of udf filesystems is disabled (Scored)................................ 27
1.1.2 Ensure /tmp is configured (Scored)............................................................................. 29
1.1.3 Ensure nodev option set on /tmp partition (Scored)............................................ 32
1.1.4 Ensure nosuid option set on /tmp partition (Scored)........................................... 34
1.1.5 Ensure noexec option set on /tmp partition (Scored) .......................................... 36
1.1.6 Ensure separate partition exists for /var (Scored)................................................. 38
1.1.7 Ensure separate partition exists for /var/tmp (Scored)...................................... 40
1.1.8 Ensure nodev option set on /var/tmp partition (Scored)................................... 42
1.1.9 Ensure nosuid option set on /var/tmp partition (Scored).................................. 43
1.1.10 Ensure noexec option set on /var/tmp partition (Scored)............................... 44
1.1.11 Ensure separate partition exists for /var/log (Scored) ..................................... 45
1.1.12 Ensure separate partition exists for /var/log/audit (Scored)......................... 47
1.1.13 Ensure separate partition exists for /home (Scored)......................................... 49
1.1.14 Ensure nodev option set on /home partition (Scored)...................................... 51
3 | P a g e
1.1.15 Ensure nodev option set on /dev/shm partition (Scored) ............................... 52
1.1.16 Ensure nosuid option set on /dev/shm partition (Scored).............................. 54
1.1.17 Ensure noexec option set on /dev/shm partition (Scored).............................. 56
1.1.18 Ensure nodev option set on removable media partitions (Not Scored)...... 58
1.1.19 Ensure nosuid option set on removable media partitions (Not Scored)..... 59
1.1.20 Ensure noexec option set on removable media partitions (Not Scored)..... 60
1.1.21 Ensure sticky bit is set on all world-writable directories (Scored)............... 61
1.1.22 Disable Automounting (Scored).................................................................................. 62
1.1.23 Disable USB Storage (Scored)....................................................................................... 64
1.2 Configure Software Updates ......................................................................................................... 66
1.2.1 Ensure GPG keys are configured (Not Scored)......................................................... 67
1.2.2 Ensure gpgcheck is globally activated (Scored)....................................................... 68
1.2.3 Ensure package manager repositories are configured (Not Scored)............... 69
1.3 Configure sudo ................................................................................................................................... 70
1.3.1 Ensure sudo is installed (Scored).................................................................................. 71
1.3.2 Ensure sudo commands use pty (Scored).................................................................. 73
1.3.3 Ensure sudo log file exists (Scored).............................................................................. 75
1.4 Filesystem Integrity Checking...................................................................................................... 77
1.4.1 Ensure AIDE is installed (Scored).................................................................................. 78
1.4.2 Ensure filesystem integrity is regularly checked (Scored).................................. 80
1.5 Secure Boot Settings ........................................................................................................................ 82
1.5.1 Ensure permissions on bootloader config are configured (Scored)................ 83
1.5.2 Ensure bootloader password is set (Scored)............................................................ 85
1.5.3 Ensure authentication required for single user mode (Scored)........................ 87
1.6 Additional Process Hardening ..................................................................................................... 89
1.6.1 Ensure core dumps are restricted (Scored) .............................................................. 90
1.6.2 Ensure address space layout randomization (ASLR) is enabled (Scored) .... 92
1.7 Mandatory Access Control............................................................................................................. 94
1.7.1 Configure SELinux .................................................................................................................... 95
1.7.1.1 Ensure SELinux is installed (Scored)........................................................................ 97
4 | P a g e
1.7.1.2 Ensure SELinux is not disabled in bootloader configuration (Scored) ....... 98
1.7.1.3 Ensure SELinux policy is configured (Scored)....................................................100
1.7.1.4 Ensure the SELinux state is enforcing (Scored) .................................................102
1.7.1.5 Ensure no unconfined services exist (Scored)....................................................103
1.7.1.6 Ensure SETroubleshoot is not installed (Scored)..............................................104
1.7.1.7 Ensure the MCS Translation Service (mcstrans) is not installed (Scored)
..............................................................................................................................................................105
1.8 Warning Banners.............................................................................................................................106
1.8.1 Command Line Warning Banners ....................................................................................107
1.8.1.1 Ensure message of the day is configured properly (Scored).........................108
1.8.1.2 Ensure local login warning banner is configured properly (Scored).........110
1.8.1.3 Ensure remote login warning banner is configured properly (Scored)....112
1.8.1.4 Ensure permissions on /etc/motd are configured (Scored).........................114
1.8.1.5 Ensure permissions on /etc/issue are configured (Scored) .........................115
1.8.1.6 Ensure permissions on /etc/issue.net are configured (Scored)..................116
1.8.2 Ensure GDM login banner is configured (Scored).................................................117
1.9 Ensure updates, patches, and additional security software are installed (Not
Scored)..............................................................................................................................................119
1.10 Ensure system-wide crypto policy is not legacy (Scored)..................................121
1.11 Ensure system-wide crypto policy is FUTURE or FIPS (Scored)......................123
2 Services........................................................................................................................................................125
2.1 inetd Services....................................................................................................................................126
2.1.1 Ensure xinetd is not installed (Scored).....................................................................127
2.2 Special Purpose Services..............................................................................................................128
2.2.1 Time Synchronization...........................................................................................................129
2.2.1.1 Ensure time synchronization is in use (Not Scored)........................................130
2.2.1.2 Ensure chrony is configured (Scored)....................................................................132
2.2.2 Ensure X Window System is not installed (Scored) .............................................134
2.2.3 Ensure rsync service is not enabled (Scored).........................................................135
2.2.4 Ensure Avahi Server is not enabled (Scored) .........................................................137
2.2.5 Ensure SNMP Server is not enabled (Scored).........................................................139
5 | P a g e
2.2.6 Ensure HTTP Proxy Server is not enabled (Scored).............................................141
2.2.7 Ensure Samba is not enabled (Scored)......................................................................142
2.2.8 Ensure IMAP and POP3 server is not enabled (Scored) .....................................143
2.2.9 Ensure HTTP server is not enabled (Scored)..........................................................145
2.2.10 Ensure FTP Server is not enabled (Scored) ..........................................................147
2.2.11 Ensure DNS Server is not enabled (Scored)..........................................................149
2.2.12 Ensure NFS is not enabled (Scored).........................................................................150
2.2.13 Ensure RPC is not enabled (Scored).........................................................................152
2.2.14 Ensure LDAP server is not enabled (Scored) .......................................................154
2.2.15 Ensure DHCP Server is not enabled (Scored).......................................................156
2.2.16 Ensure CUPS is not enabled (Scored)......................................................................158
2.2.17 Ensure NIS Server is not enabled (Scored)...........................................................160
2.2.18 Ensure mail transfer agent is configured for local-only mode (Scored)....162
2.3 Service Clients ..................................................................................................................................164
2.3.1 Ensure NIS Client is not installed (Scored)..............................................................165
2.3.2 Ensure telnet client is not installed (Scored)..........................................................167
2.3.3 Ensure LDAP client is not installed (Scored) ..........................................................169
3 Network Configuration..........................................................................................................................170
3.1 Network Parameters (Host Only).............................................................................................171
3.1.1 Ensure IP forwarding is disabled (Scored)..............................................................172
3.1.2 Ensure packet redirect sending is disabled (Scored) ..........................................174
3.2 Network Parameters (Host and Router)................................................................................176
3.2.1 Ensure source routed packets are not accepted (Scored) .................................177
3.2.2 Ensure ICMP redirects are not accepted (Scored)................................................180
3.2.3 Ensure secure ICMP redirects are not accepted (Scored)..................................183
3.2.4 Ensure suspicious packets are logged (Scored).....................................................185
3.2.5 Ensure broadcast ICMP requests are ignored (Scored)......................................187
3.2.6 Ensure bogus ICMP responses are ignored (Scored)...........................................189
3.2.7 Ensure Reverse Path Filtering is enabled (Scored)..............................................191
3.2.8 Ensure TCP SYN Cookies is enabled (Scored).........................................................193
6 | P a g e
3.2.9 Ensure IPv6 router advertisements are not accepted (Scored)......................195
3.3 Uncommon Network Protocols .................................................................................................197
3.3.1 Ensure DCCP is disabled (Scored)...............................................................................198
3.3.2 Ensure SCTP is disabled (Scored)................................................................................199
3.3.3 Ensure RDS is disabled (Scored)..................................................................................200
3.3.4 Ensure TIPC is disabled (Scored).................................................................................201
3.4 Firewall Configuration ..................................................................................................................202
3.4.1 Ensure Firewall software is installed..............................................................................203
3.4.1.1 Ensure a Firewall package is installed (Scored).................................................204
3.4.2 Configure firewalld.................................................................................................................206
3.4.2.1 Ensure firewalld service is enabled and running (Scored)............................207
3.4.2.2 Ensure nftables is not enabled (Scored)................................................................209
3.4.2.3 Ensure default zone is set (Scored).........................................................................211
3.4.2.4 Ensure network interfaces are assigned to appropriate zone (Not Scored)
..............................................................................................................................................................213
3.4.2.5 Ensure unnecessary services and ports are not accepted (Not Scored)...215
3.4.2.6 Ensure iptables is not enabled (Scored)................................................................217
3.4.3 Configure nftables ..................................................................................................................219
3.4.3.1 Ensure iptables are flushed (Not Scored).............................................................223
3.4.3.2 Ensure a table exists (Scored)...................................................................................225
3.4.3.3 Ensure base chains exist (Scored)...........................................................................227
3.4.3.4 Ensure loopback traffic is configured (Scored)..................................................229
3.4.3.5 Ensure outbound and established connections are configured (Not Scored)
..............................................................................................................................................................231
3.4.3.6 Ensure default deny firewall policy (Scored)......................................................233
3.4.3.7 Ensure nftables service is enabled (Scored)........................................................235
3.4.3.8 Ensure nftables rules are permanent (Scored)...................................................236
3.4.4 Configure iptables...................................................................................................................239
3.4.4.1.1 Ensure default deny firewall policy (Scored) ..................................................242
3.4.4.1.2 Ensure loopback traffic is configured (Scored)...............................................244
7 | P a g e
3.4.4.1.3 Ensure outbound and established connections are configured (Not
Scored)..............................................................................................................................................246
3.4.4.1.4 Ensure firewall rules exist for all open ports (Scored)................................248
3.4.4.2.1 Ensure IPv6 default deny firewall policy (Scored)........................................252
3.4.4.2.2 Ensure IPv6 loopback traffic is configured (Scored)....................................254
3.4.4.2.3 Ensure IPv6 outbound and established connections are configured (Not
Scored)..............................................................................................................................................256
3.4.4.2.4 Ensure IPv6 firewall rules exist for all open ports (Not Scored).............258
3.5 Ensure wireless interfaces are disabled (Scored) ....................................................261
3.6 Disable IPv6 (Not Scored)..................................................................................................263
4 Logging and Auditing .............................................................................................................................264
4.1 Configure System Accounting (auditd)...................................................................................265
4.1.1 Ensure auditing is enabled..................................................................................................266
4.1.1.1 Ensure auditd is installed (Scored).........................................................................267
4.1.1.2 Ensure auditd service is enabled (Scored)...........................................................268
4.1.1.3 Ensure auditing for processes that start prior to auditd is enabled (Scored)
..............................................................................................................................................................270
4.1.1.4 Ensure audit_backlog_limit is sufficient (Scored)..............................................272
4.1.2 Configure Data Retention ....................................................................................................274
4.1.2.1 Ensure audit log storage size is configured (Scored).......................................275
4.1.2.2 Ensure audit logs are not automatically deleted (Scored).............................277
4.1.2.3 Ensure system is disabled when audit logs are full (Scored)........................278
4.1.3 Ensure changes to system administration scope (sudoers) is collected
(Scored)............................................................................................................................................279
4.1.4 Ensure login and logout events are collected (Scored).......................................281
4.1.5 Ensure session initiation information is collected (Scored).............................283
4.1.6 Ensure events that modify date and time information are collected (Scored)
..............................................................................................................................................................285
4.1.7 Ensure events that modify the system's Mandatory Access Controls are
collected (Scored).........................................................................................................................287
4.1.8 Ensure events that modify the system's network environment are collected
(Scored)............................................................................................................................................289
8 | P a g e
4.1.9 Ensure discretionary access control permission modification events are
collected (Scored).........................................................................................................................291
4.1.10 Ensure unsuccessful unauthorized file access attempts are collected
(Scored)............................................................................................................................................294
4.1.11 Ensure events that modify user/group information are collected (Scored)
..............................................................................................................................................................297
4.1.12 Ensure successful file system mounts are collected (Scored) .......................299
4.1.13 Ensure use of privileged commands is collected (Scored)..............................301
4.1.14 Ensure file deletion events by users are collected (Scored)...........................303
4.1.15 Ensure kernel module loading and unloading is collected (Scored)...........305
4.1.16 Ensure system administrator actions (sudolog) are collected (Scored) ...307
4.1.17 Ensure the audit configuration is immutable (Scored)....................................309
4.2 Configure Logging...........................................................................................................................311
4.2.1 Configure rsyslog ....................................................................................................................312
4.2.1.1 Ensure rsyslog is installed (Scored)........................................................................313
4.2.1.2 Ensure rsyslog Service is enabled (Scored).........................................................314
4.2.1.3 Ensure rsyslog default file permissions configured (Scored).......................316
4.2.1.4 Ensure logging is configured (Not Scored)...........................................................318
4.2.1.5 Ensure rsyslog is configured to send logs to a remote log host (Scored).320
4.2.1.6 Ensure remote rsyslog messages are only accepted on designated log
hosts. (Not Scored).......................................................................................................................322
4.2.2 Configure journald..................................................................................................................324
4.2.2.1 Ensure journald is configured to send logs to rsyslog (Scored)...................325
4.2.2.2 Ensure journald is configured to compress large log files (Scored)...........327
4.2.2.3 Ensure journald is configured to write logfiles to persistent disk (Scored)
..............................................................................................................................................................329
4.2.3 Ensure permissions on all logfiles are configured (Scored)..............................331
4.3 Ensure logrotate is configured (Not Scored)..............................................................332
5 Access, Authentication and Authorization.....................................................................................334
5.1 Configure cron..................................................................................................................................335
5.1.1 Ensure cron daemon is enabled (Scored).................................................................336
5.1.2 Ensure permissions on /etc/crontab are configured (Scored)........................337
9 | P a g e
5.1.3 Ensure permissions on /etc/cron.hourly are configured (Scored)................338
5.1.4 Ensure permissions on /etc/cron.daily are configured (Scored)...................340
5.1.5 Ensure permissions on /etc/cron.weekly are configured (Scored)...............342
5.1.6 Ensure permissions on /etc/cron.monthly are configured (Scored)............344
5.1.7 Ensure permissions on /etc/cron.d are configured (Scored)...........................346
5.1.8 Ensure at/cron is restricted to authorized users (Scored)................................348
5.2 SSH Server Configuration.............................................................................................................350
5.2.1 Ensure permissions on /etc/ssh/sshd_config are configured (Scored).......350
5.2.2 Ensure SSH access is limited (Scored).......................................................................352
5.2.3 Ensure permissions on SSH private host key files are configured (Scored)
..............................................................................................................................................................354
5.2.4 Ensure permissions on SSH public host key files are configured (Scored).356
5.2.5 Ensure SSH LogLevel is appropriate (Scored)........................................................358
5.2.6 Ensure SSH X11 forwarding is disabled (Scored) .................................................360
5.2.7 Ensure SSH MaxAuthTries is set to 4 or less (Scored) ........................................361
5.2.8 Ensure SSH IgnoreRhosts is enabled (Scored).......................................................362
5.2.9 Ensure SSH HostbasedAuthentication is disabled (Scored)..............................363
5.2.10 Ensure SSH root login is disabled (Scored)...........................................................364
5.2.11 Ensure SSH PermitEmptyPasswords is disabled (Scored) .............................365
5.2.12 Ensure SSH PermitUserEnvironment is disabled (Scored) ............................366
5.2.13 Ensure SSH Idle Timeout Interval is configured (Scored)...............................367
5.2.14 Ensure SSH LoginGraceTime is set to one minute or less (Scored).............369
5.2.15 Ensure SSH warning banner is configured (Scored).........................................371
5.2.16 Ensure SSH PAM is enabled (Scored)......................................................................372
5.2.17 Ensure SSH AllowTcpForwarding is disabled (Scored)...................................374
5.2.18 Ensure SSH MaxStartups is configured (Scored)................................................376
5.2.19 Ensure SSH MaxSessions is set to 4 or less (Scored).........................................377
5.2.20 Ensure system-wide crypto policy is not over-ridden (Scored)...................378
5.3 Configure authselect......................................................................................................................379
5.3.1 Create custom authselect profile (Scored)...............................................................380
5.3.2 Select authselect profile (Scored)................................................................................381
10 | P a g e
5.3.3 Ensure authselect includes with-faillock (Scored)...............................................383
5.4 Configure PAM..................................................................................................................................385
5.4.1 Ensure password creation requirements are configured (Scored)................386
5.4.2 Ensure lockout for failed password attempts is configured (Scored)...........389
5.4.3 Ensure password reuse is limited (Scored).............................................................391
5.4.4 Ensure password hashing algorithm is SHA-512 (Scored) ...............................393
5.5 User Accounts and Environment ..............................................................................................395
5.5.1 Set Shadow Password Suite Parameters .......................................................................396
5.5.1.1 Ensure password expiration is 365 days or less (Scored).............................397
5.5.1.2 Ensure minimum days between password changes is 7 or more (Scored)
..............................................................................................................................................................399
5.5.1.3 Ensure password expiration warning days is 7 or more (Scored) .............401
5.5.1.4 Ensure inactive password lock is 30 days or less (Scored) ...........................403
5.5.1.5 Ensure all users last password change date is in the past (Scored)...........405
5.5.2 Ensure system accounts are secured (Scored).......................................................406
5.5.3 Ensure default user shell timeout is 900 seconds or less (Scored)................408
5.5.4 Ensure default group for the root account is GID 0 (Scored) ...........................410
5.5.5 Ensure default user umask is 027 or more restrictive (Scored) .....................411
5.6 Ensure root login is restricted to system console (Not Scored)..........................413
5.7 Ensure access to the su command is restricted (Scored) ......................................414
6 System Maintenance...............................................................................................................................416
6.1 System File Permissions...............................................................................................................417
6.1.1 Audit system file permissions (Not Scored)............................................................418
6.1.2 Ensure permissions on /etc/passwd are configured (Scored)........................421
6.1.3 Ensure permissions on /etc/shadow are configured (Scored)........................422
6.1.4 Ensure permissions on /etc/group are configured (Scored)...........................423
6.1.5 Ensure permissions on /etc/gshadow are configured (Scored).....................424
6.1.6 Ensure permissions on /etc/passwd- are configured (Scored) ......................425
6.1.7 Ensure permissions on /etc/shadow- are configured (Scored)......................426
6.1.8 Ensure permissions on /etc/group- are configured (Scored)..........................428
6.1.9 Ensure permissions on /etc/gshadow- are configured (Scored)....................429
11 | P a g e
6.1.10 Ensure no world writable files exist (Scored)......................................................430
6.1.11 Ensure no unowned files or directories exist (Scored)....................................432
6.1.12 Ensure no ungrouped files or directories exist (Scored).................................434
6.1.13 Audit SUID executables (Not Scored)......................................................................436
6.1.14 Audit SGID executables (Not Scored)......................................................................438
6.2 User and Group Settings...............................................................................................................440
6.2.1 Ensure password fields are not empty (Scored) ...................................................441
6.2.2 Ensure no legacy "+" entries exist in /etc/passwd (Scored) ............................442
6.2.3 Ensure root PATH Integrity (Scored).........................................................................443
6.2.4 Ensure no legacy "+" entries exist in /etc/shadow (Scored)............................444
6.2.5 Ensure no legacy "+" entries exist in /etc/group (Scored)................................445
6.2.6 Ensure root is the only UID 0 account (Scored).....................................................446
6.2.7 Ensure users' home directories permissions are 750 or more restrictive
(Scored)............................................................................................................................................447
6.2.8 Ensure users own their home directories (Scored) .............................................449
6.2.9 Ensure users' dot files are not group or world writable (Scored)..................451
6.2.10 Ensure no users have .forward files (Scored)......................................................453
6.2.11 Ensure no users have .netrc files (Scored)............................................................455
6.2.12 Ensure users' .netrc Files are not group or world accessible (Scored)......457
6.2.13 Ensure no users have .rhosts files (Scored)..........................................................460
6.2.14 Ensure all groups in /etc/passwd exist in /etc/group (Scored) ..................462
6.2.15 Ensure no duplicate UIDs exist (Scored)................................................................463
6.2.16 Ensure no duplicate GIDs exist (Scored)................................................................464
6.2.17 Ensure no duplicate user names exist (Scored)..................................................465
6.2.18 Ensure no duplicate group names exist (Scored)...............................................466
6.2.19 Ensure shadow group is empty (Scored)...............................................................467
6.2.20 Ensure all users' home directories exist (Scored)..............................................468