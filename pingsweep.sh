#! /bin/bash

if [[ $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]] # Changed error handling so it only accepts a Class C IP, although the regex doesn't limit each octet to 255
then

for ip in `seq 1 254`; do #Allows only last octet to be swept

ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" & #Takes first 3 octets as input, trims non-IP data
done

else
echo "Invalid argument passed to pingsweep"
echo "Syntax: pingsweep.sh 192.168.4"

fi
