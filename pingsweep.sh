#! /bin/bash

if [[ $1 =~ ^(([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))\.){2}([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))$ ]]
# Changed error handling so it only accepts a Class C IP, restricts first octet to 1-255, and all others to 0-255
then

for ip in `seq 1 254`; do #Allows only last octet to be swept

ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" & #Takes first 3 octets as input, trims non-IP data
done

else
echo "Invalid argument passed to pingsweep"
echo "Syntax: pingsweep.sh 192.168.4"

fi
