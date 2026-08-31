#!/bin/bash

# Employ a custom ASCII display

echo "====================================================================="
cat << 'EOF'
Multi-thread   ███╗   ███╗      █████╗      ██████╗      ███████╗                                        
Asset          ████╗ ████║     ██╔══██╗     ██╔══██╗     ██╔════╝                                        
Ping           ██╔████╔██║     ███████║     ██████╔╝     ███████╗                                        
Sweeper        ██║╚██╔╝██║     ██╔══██║     ██╔═══╝      ╚════██║                                        
               ██║ ╚═╝ ██║██╗  ██║  ██║██╗  ██║    ██╗   ███████║██╗                                     
               ╚═╝     ╚═╝╚═╝  ╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝   ╚══════╝╚═╝                                     
EOF
echo "====================================================================="

echo "[+] Welcome to M.A.P.S! This script runs a Ping Sweeper with automated geolocation features!" 
read -p "[>] Press [ENTER] to initiate the script..."

prefix=$(hostname -I | cut -d'.' -f1-3)

for i in {1..20}; do 
        ( 
                if ping -c 1 -W 1 "$i" > /dev/null 2>&1; then 
                        echo "[+] Connection alive on $prefix.$i"
                fi
        ) &
done

wait 

raw_data=$(curl -s http://ip-api.com)

country=$(echo "$raw_data" | sed -n '2p')
internet_provider=$(echo "$raw_data" | sed -n '11p')

echo "========================================================"
echo "RESULTS:"
echo "Country: $country"
echo "ISP (internet service provider): $internet_provider)"
echo "========================================================"
