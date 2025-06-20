#!/bin/bash
PIDS=$(ps -ef | grep '[C]PU.sh' | awk '{print $2}')
if [ -z "$PIDS" ]; then
echo "No running CPU.sh process found."
exit 1
fi
kill $PIDS
echo "CPU.sh process has been stopped: $PIDS"
