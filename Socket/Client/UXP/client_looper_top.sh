#!/bin/bash

resource_moniter() {

    stdbuf --output=L top -b -d 0 n 500 | grep '%Cpu\|MiB Mem' --line-buffered >> usage_1byteuxp.txt &
    ./test.sh 
    python3 client.py 
    sleep 0.5
    kill -9 $(ps -A | grep top | awk '{print $1}')
}

c=1

while [ $c -le 150 ] ; 
do
    echo "experiment no. $c "

    echo "* * * $c * * *" >> usage_1byteuxp.txt

    resource
    rm test.uxp
    while true;
    do
        if [ -f client_end.lock ] ; then
            c=$(( $c + 1 ))
            rm client_end.lock
            sleep 5
            echo "eperiment complete..."
            break
        fi
    done
done
