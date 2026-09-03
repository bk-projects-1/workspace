#!/bin/bash

#establish variables to use
PORT=$(read -p "[*] Enter a valid port to check the connection: ")
PREFIX=$(read -p "[*] Enter the prefix of the IP you want to check (must contain 3 numbers and end in a \".\"): ")


for (( i=0; i<=20; i++ )); do 
        ( TARGET="${PREFIX}${i}"
        timeout 1 bash -c "echo > /dev/tcp/$TARGET/$PORT" 2>/dev/null
        if [[ $? -eq 0 ]]; then 
                echo "[+] Target ($TARGET) open!" 
                ping -c 1 -W 1 $TARGET $PORT 2>&1 /dev/null
        else 
                echo "[-] Closed!"
        fi ) &
done 

wait 

echo "[!] Click [CTRL + C] to exit the command" | pv -qL 30
