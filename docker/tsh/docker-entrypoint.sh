#!/bin/bash

function finish {
	if [ $PID1 -ge 0 ]; then
		kill $PID1
	fi
  kill $PID2
}

trap 'finish' SIGTERM

PID1=-1
while true; do
	if [ ! -f rel/tsh ]; then
		echo -e "\n[INFO] No executable file found. Waiting for file before restarting test cases\n"
	while [ ! -f rel/tsh ]; do sleep 2; done
	fi
	if [ $PID1 -ge 0 ]; then
		echo -e "\n[INFO] Restarting test cases\n"
	  kill $PID1
		PID1=-1
	fi
	sleep 2 && make test01 test02 &
  PID1=$!
  inotifywait -e modify -e delete -e create -e attrib rel/tsh
done &
PID2=$!

wait
