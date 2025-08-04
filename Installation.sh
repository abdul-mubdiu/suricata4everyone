#!/bin/bash

# Capstone Suricata Setup Script
# Author: Team4
# Purpose: Install and configure Suricata, update rules, and monitor output

set -e  # Exit immediately on any error
set -o pipefail

# === Variables ===
SURICATA_DIR="/etc/suricata"
RULES_DIR="$SURICATA_DIR/rules"
LOG_DIR="/var/log/suricata"
INTERFACE="ens33"  # Change this if needed

# === Functions ===
read -p "Enter your name: " username
read -p "Enter your company name: " company
echo "Hello, $username from $company! Preparing your resources..."
function check_interface() {
    if ! ip link show "$INTERFACE" &> /dev/null; then
        echo "Error: Network interface $INTERFACE not found."
        exit 1
    fi
}

function check_interface() {
    if ! ip link show "$INTERFACE" &> /dev/null; then
        echo "Error: Network interface $INTERFACE not found."
        exit 1 cd /etc/
    fi
}

function install_suricata() {
    echo "[*] Installing Suricata..."
    sudo apt update && sudo apt install -y suricata
}

function update_rules() {
    echo "[*] Updating Suricata rules..."
    sudo suricata-update || echo "suricata-update failed"
}
function start_suricata_service() {
    echo "[*] Starting Suricata service..."
    sudo systemctl enable suricata
    sudo systemctl start suricata
    sudo systemctl status suricata --no-pager
    sudo systemctl stop suricata
}

function configure_suricata() {
    echo "[*] Cloning default Suricata config ..."
    git clone https://github.com/abdul-mubdiu/suricata4everyone ~/Desktop/mysuricata || true

    echo "[*] Copying or applying custom rules..."
    if [ -f ~/Desktop/mysuricata ]; then
        sudo cp -r ~/Desktop/mysuricata/custom_rules "$SURICATA_DIR/rules"
    fi
}

function test_suricata_config() {
    echo "[*] Testing Suricata configuration..."
    sudo suricata -T -c "$SURICATA_DIR/suricata.yaml"
}

function run_suricata() {
    echo "[*] Running Suricata on interface $INTERFACE..."
    sudo suricata -c "$SURICATA_DIR/suricata.yaml" -i "$INTERFACE" -D
    echo "Suricata is now running in the background."
    sleep 5
}

function show_logs() {
    echo "[*] Displaying logs from $LOG_DIR/fast.log..."
    sudo tail -n 20 "$LOG_DIR/fast.log"
}

# === Main ===
echo "== SURICATA SETUP START =="

check_interface
install_suricata
update_rules
configure_suricata
start_suricata_service
test_suricata_config
run_suricata
show_logs

echo "== SETUP COMPLETE =="
echo "stay_cheezed_up 😎"

