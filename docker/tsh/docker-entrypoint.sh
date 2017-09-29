#!/bin/bash

SLEEPAMNT=2

function finish {
	if [ $PID1 -ge 0 ]; then
		kill $PID1
	fi
  kill $PID2
}

trap 'finish' SIGTERM

function test {
	# test 08, 12 and 16 breaks docker but works outside.
	for number in 0{1..7} 09 {10..11} {13..15}; do
		echo "testing ${number}"
		# Diff custom and provided shell by piping output to (1) remove first line, (2) remove comments, (3) reformat pids in background, (4) reformat pids in ps, (5) reformat shell name
		DIFF=$(diff <(make test${number} | sed -n '1!p' | sed '/^#/ d' | sed 's/\[[0-9]\]\s([0-9]*)\s/[?] (????) /' | sed -r 's/^\s*[0-9]+/???/' | sed -r 's/(.\/)?(rel\/tsh)|(test\/tshref)/shell/') <(make rtest${number} | sed -n '1!p' | sed '/^#/ d' | sed 's/\[[0-9]\]\s([0-9]*)\s/[?] (????) /' | sed -r 's/^\s*[0-9]+/???/' | sed -r 's/(.\/)?(rel\/tsh)|(test\/tshref)/shell/'))
		if [[ $DIFF ]]; then
			echo "Found difference on test ${number}"
			echo -e "\nCustom Shell:"
			make test${number} | sed -n '1!p'
			echo -e "\nProvided Shell:"
			make rtest${number} | sed -n '1!p'
			echo -e "\nTesting Finished: One Or More Tests Failed."
			break
		fi ;
	done
	echo -e "\nTesting Finished: All Tests Passed!"
}

if [ ! -f ./Makefile ]; then
	echo -e "\n[INFO] No Makefile found. File must exist\n"
	exit
fi

PID1=-1
while true; do
	if [ $PID1 -ge 0 ]; then
		echo -e "\n[INFO] Restarting test cases in ${SLEEPAMNT} seconds\n"
	  kill $PID1
		PID1=-1
	fi
	sleep ${SLEEPAMNT} && test &
  PID1=$!
  inotifywait -e modify -e delete -e create -e attrib ./*
	make
done &
PID2=$!

wait
