#!/bin/bash
########################################################################################################################################################################
# Title        : Windows Hardening Script
# Description  : This script will be used to harden a Windows operating system as per CIS Amazon Linux v2.1.0 - 12-27-2017 benchmarks found on https://www.cisecurity.org/benchmark/amazon_linux/
# Author       : Nedbank Landing Zone
# Date         : 10/10/19
# Version      : 1.0
# Usage        : bash main.sh
# Notes        : Use Amazon Inspector to test if an EC2 instance has been hardened.
# bash_version : 4.2.46(2)-release (x86_64-redhat-linux-gnu)
########################################################################################################################################################################

# BELOW IS COMMANDS THAT WILL HARDEN A MACHINE IMAGE IN ORDER OF CIS WINDOWS v2.1.0 - 12-27-2017 BENCHCMARK