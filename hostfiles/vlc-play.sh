#/bin/bash


if [ $MODE == "rtmp" ]
	then
	echo "mode: $MODE"	
	echo "listening to host: $HOST"
	echo "connecting to app: $APP"
	echo "connecting to stream: $STREAMKEY"
	echo "network caching set: $NETWORKCACHING"

####  RUN VLC IN RTMP LISTNING MODE    #####
	cvlc rtmp://$HOST/$APP/$STREAMKEY \
	-I dummy \
	--ignore-config \
	--network-caching=$NETWORKCACHING \
	--decklink-vout-video-connection sdi \
	--decklink-mode Hi59 \
	--decklink-aspect-ratio=16:9 \
	-V decklinkoutput \
	-A decklinkoutput \
	--decklink-vout-mode Hi59 \
	--decklink-aout-audio-rate 48000 \
	--decklink-aout-audio-channels 2

fi

if [ $MODE == "ts" ]
        then
        echo "mode: $MODE"      
        echo "listening to host: udp://@:3000 "
        echo "connecting to app: {APP not required}"
        echo "connecting to stream: {stream id not required}"
        echo "network caching set: $NETWORKCACHING"

####  RUN VLC IN UDP Transport Stream LISTNING MODE    #####
        cvlc udp://@:3001 \
        -I dummy \
        --ignore-config \
        --network-caching=$NETWORKCACHING \
        --decklink-vout-video-connection sdi \
        --decklink-mode Hi59 \
        --decklink-aspect-ratio=16:9 \
        -V decklinkoutput \
        -A decklinkoutput \
        --decklink-vout-mode Hi59 \
        --decklink-aout-audio-rate 48000 \
        --decklink-aout-audio-channels 2
fi

### RUN VLC IN FILE PLAY MODE ###
if [ $MODE == "file" ]
	then
	FILE="/data/video-source/$FILENAME"

	cvlc --repeat $FILE \
        -I dummy \
        --ignore-config \
        --decklink-vout-video-connection sdi \
        --decklink-mode Hi59 \
        --decklink-aspect-ratio=16:9 \
        -V decklinkoutput \
        -A decklinkoutput \
        --decklink-vout-mode Hi59 \
        --decklink-aout-audio-rate 48000 \
        --decklink-aout-audio-channels 2
fi
