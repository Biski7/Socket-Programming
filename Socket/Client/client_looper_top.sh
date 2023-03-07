#!/bin/bash

resource() {
    stdbuf --output=L top -b -d 0 n 500 | grep '%Cpu\|MiB Mem' --line-buffered >> usage_1byte.txt &
    python3 client.py
    sleep 0.5
    kill -9 $(ps -A | grep top | awk '{print $1}')
}

c=1

while [ $c -le 150 ] ; 
do
    echo "experiment no. $c "

    echo "* * * $c * * *" >> usage_1byte.txt

    resource

    while true;
    do
        if [ -f client_end.lock ] ; then
            c=$(( $c + 1 ))
            rm client_end.lock
            sleep 2
            echo "experiment complete..."
            break
        fi
    done
done
