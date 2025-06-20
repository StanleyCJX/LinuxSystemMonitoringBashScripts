#!/bin/bash

# Find the PID of VM.sh script
pid=$(pgrep -f "VM.sh")

# If PID exists, kill the process
if [ -z "$pid" ]; then
    echo "No running VM.sh script found."
else
    echo "Stopped VM.sh (PID $pid)."
fi

