#!/bin/bash

# If the container already exists
if [[ $(docker ps -a -q -f name=hadoop) ]] ; then
    echo "A container already exists"

    #If a container is running: EXIT 0
    if [[ $(docker ps -q -f name=hadoop) ]] ; then
        echo "... and it's running"
        exit 0
    fi

    echo "Do you want to start it up again (start) or delete it (delete)?"
    echo -n "(start/delete): "
    read RESPONSE

    if [ "$RESPONSE"  != "delete" ] ; then
        echo -n "Starting... "
        docker start hadoop

        exit 0
    else
        echo -n "Stopping... "
#         docker stop hadoop
#         echo -n "Removing... "
#         docker rm hadoop
        exit 0
    fi

#If the container doesn't exist
else
	#label:docker[]
    docker run \
    --hostname=quickstart.cloudera \
    --privileged=true \
    -t -i \
    -p 8888:8888 \
    -p 8020:8020 \
    -p 8032:8032 \
    -p 10020:10020 \
    -p 10000:10000 \
    --name hadoop \
    cloudera/quickstart:5.7.0-0-beta \
    /usr/bin/docker-quickstart
    #end:docker[]
fi





