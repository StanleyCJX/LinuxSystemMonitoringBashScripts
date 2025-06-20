#!/bin/bash
INTERVAL=${1:-60}
> CPU.csv
while true;do
TIMESTAMP=$(date '+%H:%M:%S')
read CPU_USAGE CMD <<< $(ps -eo pcpu,comm --no-headers | sort -k1 -nr | head -n1)
echo "$TIMESTAMP;$CMD;$CPU_USAGE" >> CPU.csv
sleep "$INTERVAL"
done
