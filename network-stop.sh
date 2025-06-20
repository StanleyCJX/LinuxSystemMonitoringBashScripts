#!/bin/bash 

pkill -f "network.sh"
if pgrep -f "network.sh" > /dev/null; then
	echo "Failed to stop network monitoring" 
else
	echo "Succefully stop network monitoring"
fi