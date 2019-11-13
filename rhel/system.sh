################################################
# 6 System Maintenance
################################################

# **********************************************
# 6.1 System File Permissions 
# **********************************************

# 6.1.1 Audit system file permissions (Not Scored)
# TODO remediation : 
# Correct any discrepancies found and rerun the audit until output is clean or risk is
# mitigated or accepted

# 6.1.2 Ensure permissions on /etc/passwd are configured (Scored)
chown root:root /etc/passwd
chmod 644 /etc/passwd

# 6.1.3 Ensure permissions on /etc/shadow are configured (Scored)
chown root:root /etc/shadow
chown root:shadow /etc/shadow
chmod o-rwx,g-wx /etc/shadow

# 6.1.4 Ensure permissions on /etc/group are configured (Scored)
chown root:root /etc/group
chmod 644 /etc/group

# 6.1.5 Ensure permissions on /etc/gshadow are configured (Scored)
chown root:root /etc/gshadow
chown root:shadow /etc/gshadow
chmod o-rwx,g-rw /etc/gshadow

# 6.1.6 Ensure permissions on /etc/passwd- are configured (Scored)
chown root:root /etc/passwd-
chmod u-x,go-rwx /etc/passwd-

# 6.1.7 Ensure permissions on /etc/shadow- are configured (Scored)
chown root:shadow /etc/shadow-
chmod u-x,go-rwx /etc/shadow-

# 6.1.8 Ensure permissions on /etc/group- are configured (Scored)
chown root:root /etc/group-
chmod u-x,go-wx /etc/group-

# 6.1.9 Ensure permissions on /etc/gshadow- are configured (Scored)
chown root:root /etc/gshadow-
chown root:shadow /etc/gshadow-
chmod o-rwx,g-rw /etc/gshadow-

# 6.1.10 Ensure no world writable files exist (Scored)
# TODO: remediate

# 6.1.11 Ensure no unowned files or directories exist (Scored)
# TODO: remediate

# 6.1.12 Ensure no ungrouped files or directories exist (Scored)
# TODO: remediate

# 6.1.13 Audit SUID executables (Not Scored)
# TODO: remediate

# 6.1.14 Audit SGID executables (Not Scored)
# TODO: remediate

# *******************************************************************
# 6.2 User and Group Settings
# *******************************************************************

# 6.2.1 Ensure password fields are not empty (Scored)
# TODO: remediate

# 6.2.2 Ensure no legacy "+" entries exist in /etc/passwd (Scored)
# 6.2.4 Ensure no legacy "+" entries exist in /etc/shadow (Scored)
# 6.2.5 Ensure no legacy "+" entries exist in /etc/group (Scored)

system_files=(
    passwd
    shadow
    group
)

for sys_file in ${system_files[*]}:
do 
     sed 's/+//' /etc/${sys_file}
done

# 6.2.3 Ensure root PATH Integrity (Scored)
# TODO: remediate

# 6.2.6 Ensure root is the only UID 0 account (Scored)
# TODO: remediate

# 6.2.7 Ensure users' home directories permissions are 750 or more restrictive (Scored)
# TODO: remediate

# 6.2.8 Ensure users own their home directories (Scored)
# TODO: remediate

# 6.2.9 Ensure users' dot files are not group or world writable (Scored)
# TODO: remediate

# 6.2.10 Ensure no users have .forward files (Scored)
# TODO: remediate

# 6.2.11 Ensure no users have .netrc files (Scored)
# TODO: remediate

# 6.2.12 Ensure users' .netrc Files are not group or world accessible (Scored)
# TODO: remediate

# 6.2.13 Ensure no users have .rhosts files (Scored)
# TODO: remediate

# 6.2.14 Ensure all groups in /etc/passwd exist in /etc/group (Scored)
# TODO: remediate

# 6.2.15 Ensure no duplicate UIDs exist (Scored)
# TODO: remediate

# 6.2.16 Ensure no duplicate GIDs exist (Scored)
# TODO: remediate

# 6.2.17 Ensure no duplicate user names exist (Scored)
# TODO: remediate

# 6.2.18 Ensure no duplicate group names exist (Scored)
# TODO: remediate

# 6.2.19 Ensure shadow group is empty (Scored)
# TODO: remediate

# 6.2.20 Ensure all users' home directories exist (Scored)
# TODO: remediate

#################################################################################END