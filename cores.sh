#!/usr/bin/env bash
PROCS=$(cat /proc/cpuinfo | grep processor | wc -l)
CORES=$(cat /proc/cpuinfo | grep cores | uniq | awk '{print $4}')
TCORE=$((PROCS*CORES/2))
beg=1
end=${TCORE}
NCORE="dialog --backtitle \"Number of CPUs\" --radiolist \"Select Number of CPUs:\" 10 40 4"
for ((i=beg; i<=end; i++)) do
#for i in `seq 1 1 ${TCORE}`; do
 if [ $i -eq 1 ] ; then
  NCORE="${NCORE} ${i} 'Core' off"
 else
  NCORE="${NCORE} ${i} 'Cores' off"
 fi 
# echo ${NCORE}
done
NCORE="${NCORE} 2> salida"
eval ${NCORE}
NCORE=$(cat salida)
echo ${NCORE}
