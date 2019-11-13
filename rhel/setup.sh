################################################
# 1.0 INITIAL SETUP
################################################


# **********************************************
# 1.1 FILESYSTEM CONFIGURATION
# **********************************************

# 1.1.1 Disable unused filesystems:
#   1.1.1.1 Ensure mounting of cramfs filesystems is disabled (Scored)
#   1.1.1.2 Ensure mounting of vFAT filesystems is limited (Not Scored)
#   1.1.1.3 Ensure mounting of squashfs filesystems is disabled (Scored)
#   1.1.1.4 Ensure mounting of udf filesystems is disabled (Scored)

file_system_list=(
        cramfs 
        squashfs 
        udf
        vfat
        )

for fs in ${file_system_list[*]}
do
    echo 'install ${fs} /bin/true' > /etc/modprobe.d/CIS.conf
    rmmod ${fs}
done

# 1.1.2 Ensure /tmp is configured (Scored)
# 1.1.3 Ensure nodev option set on /tmp partition (Scored)
# 1.1.4 Ensure nosuid option set on /tmp partition (Scored)
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
# 

# TODO: remediate 




