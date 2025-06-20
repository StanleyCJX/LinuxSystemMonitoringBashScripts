#!/bin/bash

# Clear previous content in RAM.csv
> RAM.csv

# Set interval from input or default to 60 seconds
interval=${1:-60}

# Infinite loop to monitor RAM usage
while true; do
    # Get current time in HH:MM:SS format
    current_time=$(date +%T)

    # Extract the process with the highest %MEM usage using comm
    read -r p_name mem_usage <<<$(ps -eo comm,%mem --no-headers --sort=-%mem | head -n1)

    # Append data to RAM.csv
    echo "$current_time;$p_name;$mem_usage" >> RAM.csv

    # Sleep for the specified interval
    sleep $interval
done
