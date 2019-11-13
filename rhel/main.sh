#!/bin/bash
########################################################################################################################################################################
# Title        : Redhat Enterprise Hardening Script
# Description  : This script will be used to harden a Redhat Enterprise Linux 8 operating system as per CIS Amazon Linux v2.1.0 - 12-27-2017 benchmarks found on https://www.cisecurity.org/benchmark/amazon_linux/
# Author       : Nedbank Landing Zone
# Date         : 10/10/19
# Version      : 1.0
# Usage        : bash main.sh >> /dev/null
# Notes        : Use Amazon Inspector to test if an EC2 instance has been hardened.
# bash_version : 4.2.46(2)-release (x86_64-redhat-linux-gnu)
########################################################################################################################################################################

# BELOW IS COMMANDS THAT WILL HARDEN A MACHINE IMAGE IN ORDER OF CIS REDHAT ENTERPRISE LINUX 8 v1.0.0 - 09-30-2019 BENCHCMARK

# Enforce CIS Standards
sudo bash setup.sh &
sudo bash service.sh &
sudo bash network.sh &
sudo bash audit.sh &
sudo bash system.sh &
sudo bash auth.sh &