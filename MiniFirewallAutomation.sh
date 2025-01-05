#!/bin/bash

validate_ip() {
    local ip=$1
    if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        return 0
    else
        echo "Invalid IP address format: $ip"
        return 1
    fi
}


# Function to add a rule
add_rule() {
    local ip=$1
    sudo iptables -A INPUT -s $ip -j DROP
    echo "$(date): Blocked IP $ip" >> firewall.log
    echo "Rule added: Blocked IP $ip."
}

# Function to remove a rule
remove_rule() {
    local ip=$1
    sudo iptables -D INPUT -s $ip -j DROP
    echo "$(date): Unblocked IP $ip" >> firewall.log
    echo "Rule removed: Unblocked IP $ip."
}

# Function to list current rules
list_rules() {
    echo "Current Firewall Rules:"
    sudo iptables -L INPUT -v -n --line-numbers
}

search_rule() {
    local ip=$1
    sudo iptables -L INPUT -n | grep $ip
    if [[ $? -eq 0 ]]; then
        echo "IP $ip is already blocked."
    else
        echo "IP $ip is not blocked."
    fi
}



# Main menu
while true; do
echo "Mini Firewall Automation"
echo "--------------------------"
if [[ $EUID -ne 0 ]]; then
echo "This script must be run as root (use sudo)." >&2
exit 1
fi
echo "1) Add a rule"
echo "2) Remove a rule"
echo "3) List current rules"
echo "4) Exit"
read -p "Choose an option: " choice
echo "$(date): User chose option $choice" >> firewall.log
case $choice in
1)
read -p "Enter the IP to block: " ip
if validate_ip $ip; then
    add_rule $ip
else
    echo "Operation canceled due to invalid IP."
fi
;;
2)
read -p "Enter the IP to unblock: " ip
remove_rule $ip
;;
3)
list_rules
;;
4)
sudo iptables-save > /etc/iptables/rules.v4
echo "Goodbye!"
break
;;
*)
echo "Invalid option."
;;
esac
done