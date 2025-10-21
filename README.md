**Server Performance Stats Script**

A lightweight Bash script that provides detailed server performance statistics — including CPU, memory, disk usage, and top resource-consuming processes.
Perfect for Linux administrators, DevOps engineers, or anyone who wants a quick system health overview.

📋 **Features**

✅ Core Stats

CPU Usage — Shows total CPU usage percentage

Memory Usage — Displays free, used, and total memory with usage percentage

Disk Usage — Reports total, used, and free disk space with percentage

✅ Process Analysis

Top 5 Processes by CPU Usage

Top 5 Processes by Memory Usage

✅ Stretch Goals (Optional Enhancements)

OS version and kernel details

Uptime and load average

Logged-in users

Failed login attempts (last 10, from /var/log/auth.log)

**Troubleshooting**

mpstat: command not found	 ----   Install sysstat package
Permission denied	         ----   Run chmod +x server-stats.sh
No failed login info	     ----   Run with sudo to access /var/log/auth.log

**Author**

Vimala Gandhi
MERN Stack Developer & DevOps Enthusiast
