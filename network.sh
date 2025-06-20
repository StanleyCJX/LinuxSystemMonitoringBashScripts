#!/bin/bash

> network.csv
INTERVAL=${1:-60}
INTERFACE="ens33"
	
while true; do

	CURRENT_TIME=$(date +"%H:%M:%S" 2>/dev/null || echo "00:00:00")

	RX_BYTES=$(ip -s link show ens33 | awk '/RX.*bytes/{getline; print $1;}')
	TX_BYTES=$(ip -s link show ens33 | awk '/TX.*bytes/{getline; print $1;}')


	RX_KB=$ ((RX_BYTES / 1024))
	TX_KB=$ ((TX_BYTES / 1024))

	echo "$CURRENT_TIME; $RX_KB;$TX_KB" >> network.csv
I
	sleep $INTERVAL
done