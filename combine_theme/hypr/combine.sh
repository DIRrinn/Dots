#!/bin/bash

time=$(date +"%H")

if [ $time -ge 00 ] && [ $time -le 05 ]
then
    echo "Citadel is watching you."
elif [ $time -ge 06 ] && [ $time -le 10 ]
then
    echo "Rise. Your time is on."
elif [ $time -ge 11 ] && [ $time -le 15 ]
then
    echo "Combine is everything."
elif [ $time -ge 16 ] && [ $time -le 20 ]
then
    echo "City 17, it's safer here."
elif [ $time -ge 21 ] && [ $time -le 23 ]
then
    echo "Listen to your benefactors."
fi
