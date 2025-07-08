#!/bin/bash

time=$(date +"%H")

if [ $time -ge 00 ] && [ $time -le 05 ]
then
    echo "You've worked hard. Have a good night"
elif [ $time -ge 06 ] && [ $time -le 10 ]
then
    echo "Rise and shine, Richard."
elif [ $time -ge 11 ] && [ $time -le 15 ]
then
    echo "Work smart, think hard. For the glory of science."
elif [ $time -ge 16 ] && [ $time -le 20 ]
then
    echo "Think twice, mister Stein."
elif [ $time -ge 21 ] && [ $time -le 23 ]
then
    echo "Another Sun is down."
fi
