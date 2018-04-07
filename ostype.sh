#!/usr/bin/env bash
#
#
#
lscpu | grep _64 >/dev/null 2>&1
KERNEL=0 #$?
lscpu | grep 64 >/dev/null 2>&1
CPUBIT=0 #$?
# 
if [[ ${KERNEL} = 1 || ${CPUBIT} = 1 ]]; then
	dialog --backtitle "ARCH SUPPORT" --msgbox "System only supports 32-bit" 10 40
	dialog --backtitle "32-bit OPTIONS" --no-tags --radiolist "Choose a 32-bit Kernel:" 10 40 3 \
		1 Ubuntu_32 on \
		2 CentOS_32 off \
		3 RedHat_32 off \
		2> output
else
	dialog --backtitle "ARCH SUPPORT" --msgbox "System supports both 32-bit and 64-bit" 10 40
	dialog --backtitle "32/64-bit OPTIONS" --no-tags --radiolist "Choose a Kernel:" 13 40 6 \
		1 Ubuntu_64 on \
		2 Ubuntu_32 off \
		3 CentOS_64 off \
		4 CentOS_32 off \
	        5 RedHat_64 off \
		6 RedHat_32 off \
		2> output	
fi
cat output
#echo ${KERNEL}
#echo ${CPUBIT}
