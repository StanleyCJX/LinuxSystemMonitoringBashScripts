#!/bin/bash

# Get process id of RAM.sh process
p_id=$(pgrep -f "[R]AM.sh")

# Check for and kill RAM.sh process
if [ -n "$p_id" ]; then
    kill $p_id
    echo "Terminated RAM.sh with process id: $p_id"
else
    echo "No RAM.sh process found"
fi
