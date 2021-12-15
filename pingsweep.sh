#! /bin/bash

for ip in `seq 1 254`; do #Allows only last octet to be swept

ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" & #Takes first 3 octets as input, trims non-IP data
