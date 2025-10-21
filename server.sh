#!/bin/bash

# ==============================================
# Server Performance Stats Script
# File: server-stats.sh
# Author: Vimala Rajkumar
# Description: Displays CPU, Memory, Disk usage,
#              and top resource-consuming processes.
# ==============================================

echo "=============================================="
echo "         SERVER PERFORMANCE STATS"
echo "=============================================="
echo ""

# ---- STRETCH GOAL INFO ----
echo "OS & Host Info:"
echo "----------------------------------------------"
echo "Hostname: $(hostname)"
echo "OS Version: $(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '\"')"
echo "Kernel Version: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo "Load Average: $(uptime | awk -F'load average:' '{ print $2 }')"
echo "Logged in Users: $(who | wc -l)"
echo ""

# ---- CPU USAGE ----
echo "CPU Usage:"
echo "----------------------------------------------"
mpstat 1 1 | awk '/Average/ && $12 ~ /[0-9.]+/ { print 100 - $12"%"}' | sed 's/^/Total CPU Usage: /'
echo ""

# ---- MEMORY USAGE ----
echo "Memory Usage:"
echo "----------------------------------------------"
free -h | awk 'NR==2{
    used=$3; free=$4; total=$2;
    perc=($3/$2)*100;
    printf "Total: %s | Used: %s | Free: %s | Usage: %.2f%%\n", total, used, free, perc
}'
echo ""

# ---- DISK USAGE ----
echo " Disk Usage:"
echo "----------------------------------------------"
df -h --total | awk '/total/{
    printf "Total: %s | Used: %s | Free: %s | Usage: %s\n", $2, $3, $4, $5
}'
echo ""

# ---- TOP PROCESSES BY CPU ----
echo "⚙️  Top 5 Processes by CPU Usage:"
echo "----------------------------------------------"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
echo ""

# ---- TOP PROCESSES BY MEMORY ----
echo " Top 5 Processes by Memory Usage:"
echo "----------------------------------------------"
ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6
echo ""

# ---- OPTIONAL: FAILED LOGIN ATTEMPTS ----
if [ -f /var/log/auth.log ]; then
    echo "Failed Login Attempts (last 10):"
    echo "----------------------------------------------"
    sudo grep "Failed password" /var/log/auth.log | tail -n 10
    echo ""
fi

echo "=============================================="
echo " End of Server Stats Report"
echo "=============================================="





