# Simple nginx access log analyser
# Usage: ./analyze-log.sh nginx-access.log

if [ -z "$1" ]; then
    echo "Usage: $0 <log-file>"
    exit 1
fi

LOG_FILE="$1"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file '$LOG_FILE' does not exist."
    exit 1
fi

echo "NGINX ACCESS LOG ANALYSIS"
echo "Log file: $LOG_FILE"
echo "Generated at: $(date)"
echo "------------------------"

echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5 | awk '{printf "%s - %s requests\n", $2, $1}'
echo "------------------------"

echo "Top 5 most requested paths:"
awk -F\" '{print $2}' "$LOG_FILE" | awk '{print $2}' | sort | uniq -c | sort -rn | head -5 | awk '{printf "%s - %s requests\n", $2, $1}'
echo "------------------------"

echo "Top 5 response status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5 | awk '{printf "%s - %s requests\n", $2, $1}'
echo "------------------------"

echo "Top 5 user agents:"
awk -F\" '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -5 | awk '{printf "%s - %s requests\n", $2, $1}'
echo "------------------------"