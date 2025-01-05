# Mini Firewall Automation

A lightweight and interactive script to manage firewall rules using `iptables`.
This tool allows you to block, unblock, and list rules for incoming traffic with ease. Designed for simplicity and extensibility, this script is perfect for beginners and professionals looking to automate their firewall management.

---

## Features

- **Add Firewall Rules**: Block incoming traffic from specific IP addresses.
- **Remove Firewall Rules**: Unblock previously blocked IP addresses.
- **View Current Rules**: List all active rules with detailed information.
- **Interactive Menu**: Simple and intuitive menu-driven interface.
- **Logging**: Tracks actions (e.g., rule additions/removals) with timestamps in a log file.

---

## Prerequisites

Before using this script, ensure the following:

1. **System Requirements**:
   - Linux-based operating system.
   - `iptables` installed and configured.

2. **Permissions**:
   - The script must be executed with root or `sudo` privileges to modify firewall rules.

3. **Dependencies**:
   - `bash`: The script is written in Bash and requires a compatible shell.

---

## Installation

1. Clone the repository:
   ```bash
   git clone [https://github.com/LeaDoublet/MiniFirewallAutomation.git](https://github.com/LeaDoublet/MiniFirewall.git)
   cd MiniFirewallAutomation
   ```

2. Make the script executable:
   ```bash
   chmod +x MiniFirewallAutomation.sh
   ```

---

## Usage

1. Run the script with `sudo`:
   ```bash
   sudo ./MiniFirewallAutomation.sh
   ```

2. Follow the interactive menu to manage your firewall:

   - **Option 1**: Add a rule to block an IP address.
   - **Option 2**: Remove a rule to unblock an IP address.
   - **Option 3**: View all active rules.
   - **Option 4**: Exit the script.

### Example Session

1. **Blocking an IP**:
   ```bash
   Enter the IP to block: 192.168.1.100
   Rule added: Blocked IP 192.168.1.100.
   ```

2. **Listing Rules**:
   ```bash
   Chain INPUT (policy ACCEPT)
   num  target     prot opt source               destination
   1    DROP       all  --  192.168.1.100        0.0.0.0/0
   ```

3. **Unblocking an IP**:
   ```bash
   Enter the IP to unblock: 192.168.1.100
   Rule removed: Unblocked IP 192.168.1.100.
   ```

---

## Logs

The script maintains a log file `firewall.log` in the same directory. It records:
- Timestamp of actions.
- Details of blocked/unblocked IPs.

Example log entry:
```plaintext
2025-01-05 10:30:45: Blocked IP 192.168.1.100
2025-01-05 10:45:12: Unblocked IP 192.168.1.100
```


