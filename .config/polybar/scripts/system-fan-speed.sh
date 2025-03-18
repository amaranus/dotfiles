#!/bin/sh

speed=$(sensors | grep fan1 | awk '{print $2; exit}')

if [ "$speed" != "" ]; then
    
    echo "Fan-1 $speed RPM"
else
   echo "#"
fi
