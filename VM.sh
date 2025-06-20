#!/bin/bash

# Check if user provided a sleep time
if [ -z "$1" ]; then
    interval=60
else
    interval=$1
fi

# Clear VM.csv file
> VM.csv

# Infinite loop
while true
do
    # Get current time
    current_time=$(date +"%H:%M:%S")

    # Get the process with the largest VSZ
    process_info=$(ps --no-headers -eo comm,vsz --sort=-vsz | head -n 1)
    process_name=$(echo "$process_info" | awk '{print $1}')
    process_vsz=$(echo "$process_info" | awk '{print $2}')

    # Append the information to VM.csv
    echo "$current_time,$process_name,$process_vsz" >> VM.csv

    # Sleep for the interval
    sleep "$interval"
done
