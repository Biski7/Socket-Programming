#!/bin/bash

resource_moniter() {
    start=`date +%s.%N`
    python3 client.py 
    end=`date +%s.%N`
    runtime=$( echo "$end -$start" | bc -l ) 
    echo $runtime >> time.txt
}

c=1
while [ $c -le 100 ] ; 
do
    echo "experiment no. $c "
    echo "* * * $c * * *" >> u.txt
    resource_moniter
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

