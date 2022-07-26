#!/bin/bash

# This script has different options that are used to generate outputs for conky
# ./conky_scripts.sh n
# n is a integer that corresponds to the following options:
# 1 - Output max/mean/min temperatures for the CPU
# 2 - Displays GPU usage if using NVIDIA GPU
# 3 - Used to check GPU used (and save it in a .file)
# 4 - Get GPU name
# 5 - Get GPU temperature
# 6 - Get GPU core clock

TMPFILE="/tmp/conky_gpu_mode"

if [ $1 -eq 1 ]
then
    sensors | awk 'BEGIN{max=0;min=2000;r=0;s=0;} /^Core / { r++; gsub(/[^[:digit:]]+/, "", $3); s+=$3; if (int($3) < min) min=$3; else if (int($3) > max) max=$3; } END{max /= 10; min /=10; mean = s/r/10; printf("%d°C %d°C %d°C", max, mean, min)}'
elif [ $1 -eq 2 ]
then
    if [ $(cat $TMPFILE) -eq 1 ]
	then # nvidia gpu is enabled
		nvidia-smi --query-gpu=utilization.gpu --format=csv | sed -n '2p'
    elif [ $(cat $TMPFILE) -eq 0 ] # nvidia gpu is disabled
    then
        echo "N/A"
    else
        ./conky_scripts.sh 3
    fi
elif [ $1 -eq 3 ]
then
    if [ "$( lspci | grep 'Display\|3D\|VGA.*NVIDIA' )" != '' ]
	  then # nvidia gpu is enabled
		  echo "1" > $TMPFILE
    else # nvidia gpu is disabled
      echo "0" > $TMPFILE
    fi
elif [ $1 -eq 4 ]
then
    if [ $(cat $TMPFILE) -eq 1 ]
	  then # nvidia gpu is enabled
		  nvidia-smi --query-gpu=name --format=csv | sed -n '2p'
    elif [ $(cat $TMPFILE) -eq 0 ] # nvidia gpu is disabled
    then
      echo "Integrated GPU"
    else
      ./conky_scripts.sh 3
    fi
elif [ $1 -eq 5 ]
then
    if [ $(cat $TMPFILE) -eq 1 ]
	  then # nvidia gpu is enabled
		  echo $(nvidia-smi --query-gpu=temperature.gpu --format=csv | sed -n '2p')°C
    elif [ $(cat $TMPFILE) -eq 0 ] # nvidia gpu is disabled
    then
      echo "N/A"
    else
      ./conky_scripts.sh 3
    fi
elif [ $1 -eq 6 ]
then
    if [ $(cat $TMPFILE) -eq 1 ]
	  then # nvidia gpu is enabled
		  nvidia-smi --query-gpu=clocks.gr --format=csv | sed -n '2p'
    elif [ $(cat $TMPFILE) -eq 0 ] # nvidia gpu is disabled
    then
      echo "N/A"
    else
      ./conky_scripts.sh 3
    fi
fi
