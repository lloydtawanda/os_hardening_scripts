################################################
# 1.0 INITIAL SETUP
################################################


# **********************************************
# 1.1 FILESYSTEM CONFIGURATION
# **********************************************

# 1.1.1 Disable unused filesystems:
#   1.1.1.1 Ensure mounting of cramfs filesystems is disabled (Scored)
#   1.1.1.2 Ensure mounting of freevxfs filesystems is disabled (Scored)
#   1.1.1.3 Ensure mounting of jffs2 filesystems is disabled (Scored)
#   1.1.1.4 Ensure mounting of hfs filesystems is disabled (Scored)
#   1.1.1.5 Ensure mounting of hfsplus filesystems is disabled (Scored)
#   1.1.1.6 Ensure mounting of squashfs filesystems is disabled (Scored)
#   1.1.1.7 Ensure mounting of udf filesystems is disabled (Scored)
#   1.1.1.8 Ensure mounting of FAT filesystems is disabled (Scored)

file_system_list=(
        cramfs 
        freevxfs 
        jffs2 
        hfs 
        hfsplus 
        squashfs 
        udf
        vfat
        )

for fs in ${file_system_list[*]}
do
    echo 'install ${fs} /bin/true' > /etc/modprobe.d/CIS.conf
    rmmod ${fs}
done

# 1.1.2 Ensure separate partition exists for /tmp (Scored)
# 1.1.3 Ensure nodev option set on /tmp partition (Scored)
# 1.1.4 Ensure nosuid option set on /tmp partition (Scoreod)
# 1.1.5 Ensure noexec option set on /tmp partition (Scored)
# 1.1.6 Ensure separate partition exists for /var (Scored)
# 1.1.7 Ensure separate partition exists for /var/tmp (Scored)
# 1.1.8 Ensure nodev option set on /var/tmp partition (Scored)
# 1.1.9 Ensure nosuid option set on /var/tmp partition (Scored)
# 1.1.10 Ensure noexec option set on /var/tmp partition (Scored)
# 1.1.11 Ensure separate partition exists for /var/log (Scored)
# 1.1.12 Ensure separate partition exists for /var/log/audit (Scored)
# 1.1.13 Ensure separate partition exists for /home (Scored)
# 1.1.14 Ensure nodev option set on /home partition (Scored)
# 1.1.15 Ensure nodev option set on /dev/shm partition (Scored)
# 1.1.16 Ensure nosuid option set on /dev/shm partition (Scored)
# 1.1.17 Ensure noexec option set on /dev/shm partition (Scored)

partitions=(
    /tmp
    /var
    /var/tmp
    /var/log
    /var/log/audit
    /home
    /dev/shm
)

# for part in ${partitions[*]}:
# do
#     # TODO :
#     # 1. add code to create a partition if it doesnt exist
#     # 2. set options on
# done

# 1.1.18 Ensure sticky bit is set on all world-writable directories (Scored)
# df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type d -perm -0002 2>/dev/null | xargs chmod a+t

# 1.1.19 Disable Automounting (Scored)
chkconfig autofs off

# **********************************************
# 1.2 CONFIGURE SOFTWARE UPDATES
# **********************************************

# 1.2.1 Ensure package manager repositories are configured (Not Scored)
# TODO Remediation : Configure your package manager repositories according to site policy.

# 1.2.2 Ensure GPG keys are configured (Not Scored)
# TODO Remediation : Update your package manager GPG keys in accordance with site policy.

# 1.2.3 Ensure gpgcheck is globally activated (Scored)
sed -i 's/gpgcheck=0/gpgcheck=1/g' /etc/yum.conf
sed -i 's/gpgcheck=0/gpgcheck=1/g' /etc/yum.repos.d/*

# **********************************************
# 1.3 FILESYSTEM INTEGRITY CHECKING
# **********************************************

# 1.3.1 Ensure AIDE is installed (Scored)
yum install aide -y
aide --init
mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz

# 1.3.2 Ensure filesystem integrity is regularly checked (Scored)
# crontab -u root -e
# 0 5 * * * /usr/sbin/aide --check

# **********************************************
# 1.4 SECURE BOOTING SETTINGS
# **********************************************

# 1.4.1 Ensure permissions on bootloader config are configured (Scored)
chown root:root /boot/grub/menu.lst
chmod og-rwx /boot/grub/menu.lst

# 1.4.2 Ensure authentication required for single user mode (Scored)
sed -i 's@SINGLE=/sbin/sushell@SINGLE=/sbin/sulogin@g' /etc/sysconfig/init

# 1.4.3 Ensure interactive boot is not enabled (Scored)
sed -i 's@PROMPT=yes@PROMPT=no@g' /etc/sysconfig/init

# ************************************************************
# 1.5 ADDITIONAL PROCESS HARDENING
# ************************************************************

# 1.5.1 Ensure core dumps are restricted (Scored)
echo '* hard core 0' | sudo tee -a /etc/security/limits.conf >> /dev/null

# 1.5.2 Ensure XD/NX support is enabled (Not Scored)
# TODO Remmediation : If necessary configure your bootloader to load the new kernel and reboot the system. You may need to enable NX or XD support in your bios.

# 1.5.3 Ensure address space layout randomization (ASLR) is enabled (Scored)
echo 'kernel.randomize_va_space = 2' | sudo tee -a  /etc/sysctl.conf >> /dev/null
echo 'kernel.randomize_va_space = 2' | sudo tee -a   /etc/sysctl.d/* >> /dev/null
sysctl -w kernel.randomize_va_space=2

# 1.5.4 Ensure prelink is disabled (Scored)
check_prelink_installed=$(rpm -q prelink)
if [ check_prelink_installed != 'package prelink is not installed' ];
then
    prelink -ua
    yum remove prelink
fi

# ************************************************************
# 1.6 MANDATORY ACCESS CONTROL
# ************************************************************

# 1.6.1 Configure SELinux

# 1.6.1.1 Ensure SELinux is not disabled in bootloader configuration (Scored)
sed -i 's/selinux=0//g'  /boot/grub/menu.lst
sed -i 's/enforcing=0//g' /boot/grub/menu.lst

# 1.6.1.2 Ensure the SELinux state is enforcing (Scored)
echo 'SELINUX=enforcing' | sudo tee -a /etc/selinux/config >> /dev/null

# 1.6.1.3 Ensure SELinux policy is configured (Scored)
echo 'SELINUXTYPE=targeted' | sudo tee -a /etc/selinux/config >> /dev/null

# 1.6.1.4 Ensure SETroubleshoot is not installed (Scored)
check_setroubleshoot_installed=$(rpm -q setroubleshoot)
if [ check_setroubleshoot_installed != 'package setroubleshoot is not installed' ];
then 
    yum remove setroubleshoot
fi

# 1.6.1.5 Ensure the MCS Translation Service (mcstrans) is not installed (Scored)
check_mcstrans_installed=$(rpm -q mcstrans)
if [ check_mcstrans_installed != 'package mcstrans is not installed' ];
then
    yum remove mcstrans
fi

# 1.6.1.6 Ensure no unconfined daemons exist (Scored)
# TODO Remediation : Investigate any unconfined daemons found during the audit action. They may need to have an existing security context assigned to them or a policy built for them.

# 1.6.2 Ensure SELinux is installed (Scored)
check_libselinux_installed=$(rpm -q libselinux)
if [ check_libselinux_installed == 'package libselinux is not installed' ];
then
    yum install libselinux
fi

# ************************************************************
# 1.7 WARNING BANNERS
# ************************************************************

# 1.7.1 Command Line Warning Banners

# 1.7.1.1 Ensure message of the day is configured properly (Scored)
# 1.7.1.2 Ensure local login warning banner is configured properly (Not Scored)
invalid_chars=(
    \m
    \r
    \s 
    \v 
)

for char in ${invalid_chars[*]}
do
    sed -i 's/${char}//g' /etc/motd
    sed -i 's/${char}//g' /etc/issue
done

# 1.7.1.4 Ensure permissions on /etc/motd are configured (Not Scored)
# 1.7.1.5 Ensure permissions on /etc/issue are configured (Scored)
# 1.7.1.6 Ensure permissions on /etc/issue.net are configured (Not Scored)

permissions_file_list=(
    motd
    issue
    issue.net
)

for perm_file in ${permissions_file_list[*]}
do
    chown root:root /etc/${perm_file}
    chmod 644 /etc/${perm_file}
done

# 1.8 Ensure updates, patches, and additional security software are installed (Not Scored)
yum update -y

################################################################################################ END