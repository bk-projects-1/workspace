#!/bin/bash


# Give user a preemptive warning that this script cannot be used to target non-localhost IP addresses 

echo "-------------------------------------------------------------------------------------" | pv -qL 45
echo "[!] WARNING: This script cannot be used to target non-localhost IPs!" | pv -qL 45
echo "-------------------------------------------------------------------------------------" | pv -qL 45

#--------------------------------------------------------------
# Function zone: establish a function to ping 127.0.0.{1..100} 
#--------------------------------------------------------------

localhost_ping() { 
        if ping -c 1 -W 1 "$1" > /dev/null 2>&1; then 
                echo "[+] Localhost ping alive! IP is $1" 
        else 
                echo "[-] No response from $1" 
        fi
}

#----------------
# Execution zone 
#----------------

for i in {1..100}; do 
        ip="127.0.0.$i"
        localhost_ping "$ip"
done 
