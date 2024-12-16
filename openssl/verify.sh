#!/usr/bin/env bash

NAME=${1?"Pass the certificate filename as the first parameter."}
CA_FNAME=${2:-"ca.pem"}
ICA1_FNAME=${3:-"i1.pem"}
ICA2_FNAME=${4:-"i2.pem"}

TEMP_F=$(mktemp)

cat $CA_FNAME >> $TEMP_F

if [ -r "$ICA1_FNAME" ]; then

	cat $ICA1_FNAME >> $TEMP_F
fi

if [ -r "$ICA2_FNAME" ]; then
	cat $ICA2_FNAME >> $TEMP_F
fi

openssl verify -show_chain -verbose -CAfile $TEMP_F $NAME

