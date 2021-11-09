#!/usr/bin/env bash

NAME=${1?"Pass the certificate filename as the first parameter."}

openssl x509 -in $NAME -noout -text -fingerprint
