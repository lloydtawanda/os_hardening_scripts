################################################
# 5 Access, Authentication and Authorization
################################################

# **********************************************
# 5.1 Configure cron 
# **********************************************

# 5.1.1 Ensure cron daemon is enabled (Scored)
systemctl --now enable crond

# 5.1.2 Ensure permissions on /etc/crontab are configured (Scored)
# 5.1.3 Ensure permissions on /etc/cron.hourly are configured (Scored)
# 5.1.4 Ensure permissions on /etc/cron.daily are configured (Scored)
# 5.1.5 Ensure permissions on /etc/cron.weekly are configured (Scored)
# 5.1.6 Ensure permissions on /etc/cron.monthly are configured (Scored)
# 5.1.7 Ensure permissions on /etc/cron.d are configured (Scored)
cron_files=(
    cron.crontab
    cron.hourly
    cron.daily
    cron.weekly
    cron.monthly
    cron.d
)

for cfile in ${cron_files[*]}
do 
    chown root:root /etc/${cfile}
    chmod og-rwx /etc/${cfile}
done

# 5.1.8 Ensure at/cron is restricted to authorized users (Scored)
rm /etc/cron.deny
rm /etc/at.deny
touch /etc/cron.allow
touch /etc/at.allow
chmod og-rwx /etc/cron.allow
chmod og-rwx /etc/at.allow
chown root:root /etc/cron.allow
chown root:root /etc/at.allow

#******************************************************************
# 5.2 SSH Server Configuration
#******************************************************************

# 5.2.1 Ensure permissions on /etc/ssh/sshd_config are configured (Scored)
chown root:root /etc/ssh/sshd_config
chmod og-rwx /etc/ssh/sshd_config

# 5.2.2 Ensure SSH access is limited (Scored)
# TODO: remediate

# 5.2.3 Ensure permissions on SSH private host key files are configured (Scored)
find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec chown root:root {} \;
find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec chmod 0600 {} \;

# 5.2.4 Ensure permissions on SSH public host key files are configured (Scored)
find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec chmod 0644 {} \;
find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec chown root:root {} \;

# 5.2.5 Ensure SSH LogLevel is appropriate (Scored)
sed -i 's/^.*LogLevel/LogLevel/'  /etc/ssh/sshd_config

# 5.2.6 Ensure SSH X11 forwarding is disabled (Scored)
sed -i 's/^.*X11Forwarding/X11Forwarding/'  /etc/ssh/sshd_config

# 5.2.7 Ensure SSH MaxAuthTries is set to 4 or less (Scored)
tee -a /etc/ssh/sshd_config > /dev/null <<EOT
MaxAuthTries 4
EOT

# 5.2.8 Ensure SSH IgnoreRhosts is enabled (Scored)
sed -i 's/^.*IgnoreRhosts/IgnoreRhosts/'  /etc/ssh/sshd_config

# 5.2.9 Ensure SSH HostbasedAuthentication is disabled (Scored)
sed -i 's/^.*HostbasedAuthentication/HostbasedAuthentication/'  /etc/ssh/sshd_config

# 5.2.10 Ensure SSH root login is disabled (Scored)
sed -i '/PermitRootLogin/ c\PermitRootLogin no' /etc/ssh/sshd_config

# 5.2.11 Ensure SSH PermitEmptyPasswords is disabled (Scored)
sed -i 's/^.*PermitEmptyPasswords/PermitEmptyPasswords/'  /etc/ssh/sshd_config

# 5.2.12 Ensure SSH PermitUserEnvironment is disabled (Scored)
sed -i 's/^.*PermitUserEnvironment/PermitUserEnvironment/'  /etc/ssh/sshd_config

# 5.2.13 Ensure SSH Idle Timeout Interval is configured (Scored)
sed -i 's/^.*ClientAliveInterval/ClientAliveInterval/'  /etc/ssh/sshd_config
sed -i 's/^.*ClientAliveCountMax/ClientAliveCountMax/'  /etc/ssh/sshd_config

# 5.2.14 Ensure SSH LoginGraceTime is set to one minute or less (Scored)
tee -a /etc/ssh/sshd_config > /dev/null <<EOT
LoginGraceTime 60
EOT

# 5.2.15 Ensure SSH warning banner is configured (Scored)
tee -a /etc/ssh/sshd_config > /dev/null <<EOT
Banner /etc/issue.net
EOT

# 5.2.16 Ensure SSH PAM is enabled (Scored)
sed -i 's/^.*UsePAM/UsePAM/'  /etc/ssh/sshd_config

# 5.2.17 Ensure SSH AllowTcpForwarding is disabled (Scored)
tee -a /etc/ssh/sshd_config > /dev/null <<EOT
AllowTcpForwarding no
EOT

# 5.2.18 Ensure SSH MaxStartups is configured (Scored)
tee -a /etc/ssh/sshd_config > /dev/null <<EOT
maxstartups 10:30:60
EOT

# 5.2.19 Ensure SSH MaxSessions is set to 4 or less (Scored)
tee -a /etc/ssh/sshd_config > /dev/null <<EOT
MaxSessions 4
EOT

# 5.2.20 Ensure system-wide crypto policy is not over-ridden (Scored)
sed -ri "s/^\s*(CRYPTO_POLICY\s*=.*)$/# \1/" /etc/sysconfig/sshd
systemctl reload sshd

# *******************************************************************
# 5.3 Configure authselect
# *******************************************************************

# 5.3.1 Create custom authselect profile (Scored)
authselect create-profile custom-profile -b sssd --symlink-meta

# 5.3.2 Select authselect profile (Scored)
authselect select custom/custom-profile with-sudo with-faillock withoutnullok

# 5.3.3 Ensure authselect includes with-faillock (Scored)
authselect select custom/custom-profile with-sudo with-faillock withoutnullok

# ***********************************************************************
# 5.4 Configure PAM
# ***********************************************************************

# 5.4.1 Ensure password creation requirements are configured (Scored)
tee -a /etc/security/pwquality.conf > /dev/null <<EOT
minlen = 14
minclass = 4
EOT

#  Update the system-auth and password-auth files
CP=$(authselect current | awk 'NR == 1 {print $3}' | grep custom/)
for FN in system-auth password-auth; do
[[ -n $CP ]] && PTF=/etc/authselect/$CP/$FN || PTF=/etc/authselect/$FN
[[ -z $(grep -E
'^\s*password\s+requisite\s+pam_pwquality.so\s+.*enforce-for-root\s*.*$'
$PTF) ]] && sed -ri
's/^\s*(password\s+requisite\s+pam_pwquality.so\s+)(.*)$/\1\2 enforce-forroot/' $PTF
[[ -n $(grep -E
'^\s*password\s+requisite\s+pam_pwquality.so\s+.*\s+retry=\S+\s*.*$' $PTF) ]]
&& sed -ri '/pwquality/s/retry=\S+/retry=3/' $PTF || sed -ri
's/^\s*(password\s+requisite\s+pam_pwquality.so\s+)(.*)$/\1\2 retry=3/' $PTF
done
authselect apply-changes

# 5.4.2 Ensure lockout for failed password attempts is configured (Scored)
CP=$(authselect current | awk 'NR == 1 {print $3}' | grep custom/)
for FN in system-auth password-auth; do
[[ -n $CP ]] && PTF=/etc/authselect/$CP/$FN || PTF=/etc/authselect/$FN
[[ -n $(grep -E
'^\s*auth\s+required\s+pam_faillock.so\s+.*deny=\S+\s*.*$' $PTF) ]] && sed -
ri '/pam_faillock.so/s/deny=\S+/deny=5/g' $PTF || sed -ri
's/^\^\s*(auth\s+required\s+pam_faillock\.so\s+)(.*[^{}])(\{.*\}|)$/\1\2
deny=5 \3/' $PTF
[[ -n $(grep -E
'^\s*auth\s+required\s+pam_faillock.so\s+.*unlock_time=\S+\s*.*$' $PTF) ]] &&
sed -ri '/pam_faillock.so/s/unlock_time=\S+/unlock_time=900/g' $PTF || sed -
ri 's/^\s*(auth\s+required\s+pam_faillock\.so\s+)(.*[^{}])(\{.*\}|)$/\1\2
unlock_time=900 \3/' $PTF
done
authselect apply-changes

# 5.4.3 Ensure password reuse is limited (Scored)
CP=$(authselect current | awk 'NR == 1 {print $3}' | grep custom/)
[[ -n $CP ]] && PTF=/etc/authselect/$CP/system-auth ||
PTF=/etc/authselect/system-auth
[[ -n $(grep -E
'^\s*password\s+(sufficient\s+pam_unix|requi(red|site)\s+pam_pwhistory).so\s+
([^#]+\s+)*remember=\S+\s*.*$' $PTF) ]] && sed -ri
's/^\s*(password\s+(requisite|sufficient)\s+(pam_pwquality\.so|pam_unix\.so)\
s+)(.*)(remember=\S+\s*)(.*)$/\1\4 remember=5 \6/' $PTF || sed -ri
's/^\s*(password\s+(requisite|sufficient)\s+(pam_pwquality\.so|pam_unix\.so)\
s+)(.*)$/\1\4 remember=5/' $PTF
authselect apply-changes

# 5.4.4 Ensure password hashing algorithm is SHA-512 (Scored)
CP=$(authselect current | awk 'NR == 1 {print $3}' | grep custom/)
for FN in system-auth password-auth; do
[[ -z $(grep -E
'^\s*password\s+sufficient\s+pam_unix.so\s+.*sha512\s*.*$' $PTF) ]] && sed -
ri 's/^\s*(password\s+sufficient\s+pam_unix.so\s+)(.*)$/\1\2 sha512/' $PTF
done
authselect apply-changes

# **************************************************************************
# 5.5 User Accounts and Environment
# **************************************************************************

# 5.5.1 Set Shadow Password Suite Parameters

# 5.5.1.1 Ensure password expiration is 365 days or less (Scored)
sed -i '/PASS_MAX_DAYS/ c\PASS_MAX_DAYS 365' /etc/login.defs

# 5.5.1.2 Ensure minimum days between password changes is 7 or more (Scored)
sed -i '/PASS_MIN_DAYS/ c\PASS_MIN_DAYS 7' /etc/login.defs

# 5.5.1.3 Ensure password expiration warning days is 7 or more (Scored)
sed -i '/PASS_WARN_AGE/ c\PASS_WARN_AGE 7' /etc/login.defs

# 5.5.1.4 Ensure inactive password lock is 30 days or less (Scored)
useradd -D -f 30

# 5.5.1.5 Ensure all users last password change date is in the past (Scored)
# TODO: remediate

# 5.5.2 Ensure system accounts are secured (Scored)
# TODO: remediate

# 5.5.3 Ensure default user shell timeout is 900 seconds or less (Scored)
TMOUT_OUTPUT=$(grep 'TMOUT' /etc/bashrc /etc/profile /etc/profile.d/*.sh)
if [[ TMOUT_OUTPUT == '' ]];
then
    echo 'readonly TMOUT=900 ; export TMOUT' | sudo tee -a /etc/bashrc /etc/profile 
else
    sed -i '/TMOUT/ c\readonly TMOUT=900 ; export TMOUT' /etc/bashrc /etc/profile /etc/profile.d/*.sh
fi


# 5.5.4 Ensure default group for the root account is GID 0 (Scored)
usermod -g 0 root

# 5.5.5 Ensure default user umask is 027 or more restrictive (Scored)
UMASK_OUTPUT=$(grep 'umask'  /etc/bashrc /etc/profile /etc/profile.d/*.sh)
if [[ UMASK_OUTPUT == '' ]];
then 
    echo 'umask 027' | sudo tee -a /etc/bashrc /etc/profile 
else
    sed -i '/umask/ c\umask 027' /etc/bashrc /etc/profile /etc/profile.d/*.sh
fi

# *****************************************************************************
# 5.6 Ensure root login is restricted to system console (Not Scored)
# *****************************************************************************

# TODO: remediate

# *****************************************************************************
# 5.7 Ensure access to the su command is restricted (Scored)
# *****************************************************************************
echo 'auth required pam_wheel.so use_uid' | sudo tee -a  /etc/pam.d/su


#######################################################################################END

