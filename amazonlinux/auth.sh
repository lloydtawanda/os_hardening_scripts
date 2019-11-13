# *************************************************
# 5.1 Configure Cron
# *************************************************

#5.1.1 

chkconfig crond on

#5.1.2

chown root:root /etc/crontab
chmod og-rwx /etc/crontab

#5.1.3 

chown root:root /etc/cron.hourly
chmod og-rwx /etc/cron.hourly


#5.1.4 

chown root:root /etc/cron.daily
chmod og-rwx /etc/cron.daily

#5.1.5

chown root:root /etc/cron.weekly
chmod og-rwx /etc/cron.weekly

#5.1.6

chown root:root /etc/cron.monthly
chmod og-rwx /etc/cron.monthly

#5.1.7

chown root:root /etc/cron.d
chmod og-rwx /etc/cron.d

#5.1.8

rm /etc/cron.deny
rm /etc/at.deny
touch /etc/cron.allow
touch /etc/at.allow
chmod og-rwx /etc/cron.allow
chmod og-rwx /etc/at.allow
chown root:root /etc/cron.allow
chown root:root /etc/at.allow

# *************************************************
# 5.2 SSH Server Configuration
# *************************************************

#5.2.1 

chown root:root /etc/ssh/sshd_config
chmod og-rwx /etc/ssh/sshd_config

#5.2.2
echo 'Protocol 2' | sudo tee -a /etc/ssh/sshd_config >> /dev/null 


#5.2.3

#Edit the /etc/ssh/sshd_config file to set the parameter as follows:
echo 'LogLevel INFO' | sudo tee -a /etc/ssh/sshd_config >> /dev/null 


#5.2.4

#Edit the /etc/ssh/sshd_config file to set the parameter as follows:
echo 'X11Forwarding no' | sudo tee -a /etc/ssh/sshd_config >> /dev/null 


#5.2.5

#Edit the /etc/ssh/sshd_config file to set the parameter as follows:
echo 'MaxAuthTries 4' | sudo tee -a /etc/ssh/sshd_config >> /dev/null 


#5.2.6
#Edit the /etc/ssh/sshd_config file to set the parameter as follows:
echo 'IgnoreRhosts yes' | sudo tee -a /etc/ssh/sshd_config >> /dev/null 


#5.2.7
#Edit the /etc/ssh/sshd_config file to set the parameter as follows:
echo 'HostbasedAuthentication no' | sudo tee -a /etc/ssh/sshd_config >> /dev/null 


#5.2.8

#Edit the /etc/ssh/sshd_config file to set the parameter as follows:
echo 'PermitRootLogin no' | sudo tee -a /etc/ssh/sshd_config >> /dev/null 


#5.2.9
#Edit the /etc/ssh/sshd_config file to set the parameter as follows:
echo 'PermitEmptyPasswords no' | sudo tee -a /etc/ssh/sshd_config >> /dev/null 


#5.2.10
#Edit the /etc/ssh/sshd_config file to set the parameter as follows:
echo 'PermitUserEnvironment no' | sudo tee -a /etc/ssh/sshd_config >> /dev/null 


#5.2.11
#Edit the /etc/ssh/sshd_config file to set the parameter in accordance with site policy. The
#following includes all supported and accepted MACs:
#Todo
#MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-
#etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com

#5.2.12
#Edit the /etc/ssh/sshd_config file to set the parameters according to site policy:
echo 'ClientAliveInterval 300' | sudo tee -a /etc/ssh/sshd_config >> /dev/null 
echo 'ClientAliveCountMax 0' | sudo tee -a /etc/ssh/sshd_config >> /dev/null 



#5.2.13
#Edit the /etc/ssh/sshd_config file to set the parameter as follows:

echo 'LoginGraceTime 60' | sudo tee -a /etc/ssh/sshd_config >> /dev/null 
#5.2.14
#Edit the /etc/ssh/sshd_config file to set one or more of the parameter as follows:
#Todo 
# AllowUsers <userlist>
# AllowGroups <grouplist>
# DenyUsers <userlist>
# DenyGroups <grouplist>

#5.2.15
#Edit the /etc/ssh/sshd_config file to set the parameter as follows
echo 'Banner /etc/issue.net' | sudo tee -a /etc/ssh/sshd_config >> /dev/null 

# *************************************************
# 5.3 Configure PAM
# *************************************************

#5.3.1

#Edit the /etc/pam.d/password-auth and /etc/pam.d/system-auth files to include the
#appropriate options for pam_pwquality.so and to conform to site policy:
#password requisite pam_pwquality.so try_first_pass retry=3
#Edit /etc/security/pwquality.conf to add or update the following settings to conform to

cat >> /etc/security/pwquality.conf <<EOH
minlen=14
dcredit=-1
ucredit=-1
ocredit=-1
lcredit=-1
EOH
#5.3.2

#Edit the /etc/pam.d/password-auth and /etc/pam.d/system-auth files and add the
#following pam_faillock.so lines surrounding a pam_unix.so line modify the pam_unix.so
#is [success=1 default=bad] as listed in both:
cat >> /etc/pam.d/password-auth <<EOL
auth required pam_faillock.so preauth audit silent deny=5 unlock_time=900
auth [success=1 default=bad] pam_unix.so
auth [default=die] pam_faillock.so authfail audit deny=5 unlock_time=900
auth sufficient pam_faillock.so authsucc audit deny=5 unlock_time=900
EOL

cat >> /etc/pam.d/system-auth <<EOL
auth required pam_faillock.so preauth audit silent deny=5 unlock_time=900
auth [success=1 default=bad] pam_unix.so
auth [default=die] pam_faillock.so authfail audit deny=5 unlock_time=900
auth sufficient pam_faillock.so authsucc audit deny=5 unlock_time=900
EOL
#5.3.3 

#Edit the /etc/pam.d/password-auth and /etc/pam.d/system-auth files to include the
#remember option and conform to site policy as shown:

echo 'password sufficient pam_unix.so remember=5' | sudo tee -a /etc/pam.d >> /dev/null


#5.3.4

#Edit the /etc/pam.d/password-auth and /etc/pam.d/system-auth files to include the
#sha512 option for pam_unix.so as shown:


#Todo password sufficient pam_unix.so sha512


# *************************************************
# 5.4 User Accounts and Environment 
# *************************************************

#5.4.1.1

#Set the PASS_MAX_DAYS parameter to conform to site policy in /etc/login.defs :
sed -i '/PASS_MAX_DAYS/ c\PASS_MAX_DAYS 90' /etc/login.defs

#Modify user parameters for all users with a password set to match:
#Todo chage --maxdays 90 <user>

#5.4.1.2
#Set the PASS_MIN_DAYS parameter to 7 in /etc/login.defs :
sed -i '/PASS_MIN_DAYS/ c\PASS_MIN_DAYS 7' /etc/login.defs
#Modify user parameters for all users with a password set to match:
#Todo chage --mindays 7 <user>

#5.4.1.3
#Set the PASS_WARN_AGE parameter to 7 in /etc/login.defs :
sed -i '/PASS_WARN_AGE/ c\PASS_WARN_AGE 7' /etc/login.defs
#Modify user parameters for all users with a password set to match:
#Todo chage --warndays 7 <user>

#5.4.1.4
#Run the following command to set the default password inactivity period to 30 days:
useradd -D -f 30
#Modify user parameters for all users with a password set to match:
#Todo chage --inactive 30 <user>

#5.4.1.5
#Todo
#Investigate any users with a password change date in the future and correct them. Locking
#the account, expiring the password, or resetting the password manually may be
#appropriate

#5.4.2

#Set the shell for any accounts returned by the audit script to /sbin/nologin :
#Todo usermod -s /sbin/nologin <user>
#The following script will automatically set all user shells required to /sbin/nologin and
#lock the sync , shutdown , and halt users:


for user in `awk -F: '($3 < 500) {print $1 }' /etc/passwd` ; do
 if [ $user != "root" ]; then
 usermod -L $user
 if [ $user != "sync" ] && [ $user != "shutdown" ] && [ $user != "halt" ];
then
 usermod -s /sbin/nologin $user
 fi
fi 
done

#5.4.3

usermod -g 0 root

#5.4.4

#Edit the /etc/bashrc, /etc/profile and /etc/profile.d/*.sh files (and the appropriate
#files for any other shell supported on your system) and add or edit any umask parameters
#as follows:
echo 'umask 027' >> /etc/bashrc 
echo 'umask 027' >> /etc/profile
echo 'umask 027' >> /etc/profile.d/*

#5.4.5

#Edit the /etc/bashrc and /etc/profile files (and the appropriate files for any other shell
#supported on your system) and add or edit any umask parameters as follows:
echo 'TIMEOUT=600' >> /etc/bashrc
echo 'TIMEOUT=600' >> /etc/profile

# *************************************************
# 5.5 User Accounts and Environment
# *************************************************

#Add the following line to the /etc/pam.d/su file:
echo 'auth required pam_wheel.so use_uid' | sudo tee -a /etc/pam.d/su >> /dev/null
#Create a comma separated list of users in the wheel statement in the /etc/group file:

#Todo wheel:x:10:root,<user list>




