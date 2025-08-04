# Nginx Log Analyser

A shell script to analyze nginx access logs and generate comprehensive statistics about web traffic patterns.

## Project URL
https://roadmap.sh/projects/nginx-log-analyser

## Features

- **IP Address Analysis** - Top IP addresses with most requests
- **Path Analysis** - Most requested URLs and endpoints
- **Status Code Monitoring** - HTTP response status distribution
- **User Agent Tracking** - Browser and client statistics
- **Request Pattern Analysis** - Traffic behavior insights
- **Log File Validation** - Input file existence checking

## Usage

### Linux/WSL:
```bash
chmod +x analyze-log.sh
./analyze-log.sh nginx-access.log
```

### Windows (Git Bash):
```bash
bash analyze-log.sh nginx-access.log
```

## Requirements

- Linux/Unix environment, WSL, or Git Bash on Windows
- Standard utilities: `awk`, `sort`, `uniq`, `head`
- Nginx access log file in standard format

## Sample Output

```
NGINX ACCESS LOG ANALYSIS
Log file: nginx-access.log
Generated at: Mon Dec 16 10:30:45 2024
------------------------
Top 5 IP addresses with the most requests:
192.168.1.100 - 1250 requests
10.0.0.50 - 890 requests
203.0.113.25 - 675 requests
...
```

## Installation

1. Clone the repository:
```bash
git clone https://github.com/YOUR_USERNAME/nginx-log-analyser.git
cd nginx-log-analyser
```

2. Download sample log file:
```bash
wget -O nginx-access.log "https://gist.githubusercontent.com/kamranahmedse/e66c3b9ea89a1a030d3b739eeeef22d0/raw/77fb3ac837a73c4f0206e78a236d885590b7ae35/nginx-access.log"
```

3. Make executable and run:
```bash
chmod +x analyze-log.sh
./analyze-log.sh nginx-access.log
```

## Log Format Support

This script supports standard nginx access log format:
```
$remote_addr - $remote_user [$time_local] "$request" $status $body_bytes_sent "$http_referer" "$http_user_agent"
```