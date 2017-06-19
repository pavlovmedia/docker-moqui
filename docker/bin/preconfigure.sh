#!/bin/bash

#
# This will pre-configure your container volume using
# json file named preconfig.json. If the volume exists
# it will be removed and re-created, so beware
VOLUME="moqui-base-configured"

docker volume inspect $VOLUME > /dev/null 2>&1

if [ "0" -eq "$?" ]; then
    echo -n "The volume for this container exists, do you want to delete it first? (y/n/cancel) "
    read ANSWER
    if [ "y" == "$ANSWER" ]; then
        docker volume rm -f $VOLUME > /dev/null 2>&1
        if [ "0" -ne "$?" ]; then
            echo "Unable to remove volume, exiting"
            echo "If this continues, you can try running 'docker system prune'"
            exit 2
        fi
    elif [ "n" != "$ANSWER" ]; then
        echo "Cancelling"
        exit 3
    fi
    docker volume create $VOLUME > /dev/null 2>&1
else
    docker volume create $VOLUME > /dev/null 2>&1
fi
