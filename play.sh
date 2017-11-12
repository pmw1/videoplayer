#!/bin/bash
FILE=$1
#NETWORKCACHING=$3
#APP="live"
#HOST="204.13.45.187"


sudo docker rm -f vlc

echo "=$FILE" >> now.conf
#echo "NETWORKCACHING=$NETWORKCACHING" >> now.conf
#echo "APP=$APP" >> now.conf
#echo "HOST=$HOST" >> now.conf 


echo "FILE: $FILE"
echo "USER: $USER"

sudo docker run \
	--name "vlc" \
	-v /home/kevin/apps/file-player/hostfiles:/data/hostfiles \
	-e URL=$URL \
	-e MODE="file" \
	--privileged -i -t \
	--device /dev/blackmagic/io0 \
	pmw1/vlc
