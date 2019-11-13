# Note - for all TODO's refer to the CIS Benchmarks document**

################################################
# 6 System Maintenance
################################################

# **********************************************
# 6.1 System File Permissions
# **********************************************

# 6.1.1 Audit system file permissions (Not Scored)
# TODO: Correct any discrepancies found and rerun the audit until output is clean or risk is mitigated or accepted.

# 6.1.2 Ensure permissions on /etc/passwd are configured (Scored)
chown root:root /etc/passwd
chmod 644 /etc/passwd

# 6.1.3 Ensure permissions on /etc/shadow are configured (Scored)
chown root:root /etc/shadow
chmod 000 /etc/shadow

# 6.1.4 Ensure permissions on /etc/group are configured (Scored)
chown root:root /etc/group
chmod 644 /etc/group

# 6.1.5 Ensure permissions on /etc/gshadow are configured (Scored)
chown root:root /etc/gshadow
chmod 000 /etc/gshadow

# 6.1.6 Ensure permissions on /etc/passwd- are configured (Scored)
chown root:root /etc/passwd-
chmod u-x,go-wx /etc/passwd-

# 6.1.7 Ensure permissions on /etc/shadow- are configured (Scored)
chown root:root /etc/shadow-
chmod 000 /etc/shadow-

# 6.1.8 Ensure permissions on /etc/group- are configured (Scored)
chown root:root /etc/group-
chmod u-x,go-wx /etc/group-

# 6.1.9 Ensure permissions on /etc/gshadow- are configured (Scored)
chown root:root /etc/gshadow-
chmod 000 /etc/gshadow-

# 6.1.10 Ensure no world writable files exist (Not Scored)
# TODO: 
# Removing write access for the "other" category ( chmod o-w <filename> ) is advisable, but
# always consult relevant vendor documentation to avoid breaking any application
# dependencies on a given file

# 6.1.11 Ensure no unowned files or directories exist (Not Scored)
# TODO:
# Locate files that are owned by users or groups not listed in the system configuration files,
# and reset the ownership of these files to some active user on the system as appropriate.

# 6.1.12 Ensure no ungrouped files or directories exist (Not Scored)
# TODO:
# Locate files that are owned by users or groups not listed in the system configuration files,
# and reset the ownership of these files to some active user on the system as appropriate.

# 6.1.13 Audit SUID executables (Not Scored)
# TODO:
# Ensure that no rogue SUID programs have been introduced into the system. Review the
# files returned by the action in the Audit section and confirm the integrity of these binaries.

# 6.1.14 Audit SGID executables (Not Scored)
# TODO:
# Ensure that no rogue SGID programs have been introduced into the system. Review the
# files returned by the action in the Audit section and confirm the integrity of these binaries.

# **********************************************
# 6.2 User and Group Settings
# **********************************************

# 6.2.1 Ensure password fields are not empty (Not Scored)
# TODO:
# If any accounts in the /etc/shadow file do not have a password, run the following command
# to lock the account until it can be determined why it does not have a password:
# passwd -l <username>

# 6.2.2 Ensure no legacy "+" entries exist in /etc/passwd (Not Scored)
# TODO:
# Remove any legacy '+' entries from /etc/passwd if they exist.

# 6.2.3 Ensure no legacy "+" entries exist in /etc/shadow (Scored)
# 6.2.4 Ensure no legacy "+" entries exist in /etc/group (Scored)

system_files=(
    passwd
    shadow
    group
)

for sys_file in ${system_files[*]}:
do 
     sed 's/+//' /etc/${sys_file}
done

# 6.2.6 Ensure root PATH Integrity (Not Scored)
# TODO: Refer to CIS Benchmark 

# 6.2.7 Ensure all users' home directories exist (Not Scored)
# TODO:
# If any users' home directories do not exist, create them and make sure the respective user
# owns the directory. Users without an assigned home directory should be removed or
# assigned a home directory as appropriate.

# 6.2.8 Ensure users' home directories permissions are 750 or more restrictive (Not Scored)
# TODO:
# Making global modifications to user home directories without alerting the user community
# can result in unexpected outages and unhappy users. Therefore, it is recommended that a
# monitoring policy be established to report user file permissions and determine the action
# to be taken in accordance with site policy

# 6.2.9 Ensure users own their home directories (Not Scored)
# TODO:
# Change the ownership of any home directories that are not owned by the defined user to
# the correct user.

# 6.2.10 Ensure users' dot files are not group or world writable (Not Scored)
# TODO:
# Making global modifications to users' files without alerting the user community can result
# in unexpected outages and unhappy users. Therefore, it is recommended that a monitoring 
# 325 | P a g e
# policy be established to report user dot file permissions and determine the action to be
# taken in accordance with site policy.

# 6.2.11 Ensure no users have .forward files (Not Scored)
# TODO:
# Making global modifications to users' files without alerting the user community can result
# in unexpected outages and unhappy users. Therefore, it is recommended that a monitoring
# policy be established to report user .forward files and determine the action to be taken in
# accordance with site policy.

# 6.2.12 Ensure no users have .netrc files (Not Scored)
# TODO:
# Making global modifications to users' files without alerting the user community can result
# in unexpected outages and unhappy users. Therefore, it is recommended that a monitoring
# policy be established to report user .netrc files and determine the action to be taken in
# accordance with site policy.

# 6.2.13 Ensure users' .netrc Files are not group or world accessible (Not Scored)
# TODO:
# Making global modifications to users' files without alerting the user community can result
# in unexpected outages and unhappy users. Therefore, it is recommended that a monitoring
# policy be established to report user .netrc file permissions and determine the action to be
# taken in accordance with site policy.

# 6.2.14 Ensure no users have .rhosts files (Not Scored)
# TODO:
# Making global modifications to users' files without alerting the user community can result
# in unexpected outages and unhappy users. Therefore, it is recommended that a monitoring
# policy be established to report user .rhosts files and determine the action to be taken in
# accordance with site policy.

# 6.2.15 Ensure all groups in /etc/passwd exist in /etc/group (Not Scored)
# TODO:
# Analyze the output of the Audit step above and perform the appropriate action to correct
# any discrepancies found.

# 6.2.16 Ensure no duplicate UIDs exist (Not Scored)
# TODO:
# Based on the results of the audit script, establish unique UIDs and review all files owned by
# the shared UIDs to determine which UID they are supposed to belong to.

# 6.2.17 Ensure no duplicate GIDs exist (Not Scored)
# TODO:
# Based on the results of the audit script, establish unique GIDs and review all files owned by
# the shared GID to determine which group they are supposed to belong to.

# 6.2.18 Ensure no duplicate user names exist (Not Scored)
# TODO:
# Based on the results of the audit script, establish unique user names for the users. File
# ownerships will automatically reflect the change as long as the users have unique UIDs.

# 6.2.19 Ensure no duplicate group names exist (Not Scored)
# TODO:
# Based on the results of the audit script, establish unique names for the user groups. File
# group ownerships will automatically reflect the change as long as the groups have unique
# GIDs.
