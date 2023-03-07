server () {
    python server.py
    echo "Server Running"
}

c=1
while [ $c -le 150 ] ; 
do
    echo "experiment no. $c "
    sleep 0.5
    server
    wait

    while true;
    do
        if [ -f server_end.lock ] ; then
            c=$(( $c + 1 ))
            rm server_end.lock
            echo "experiment complete..."
            break
        fi
    done
done
