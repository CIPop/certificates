#!/usr/bin/env bash

NAME=${1:-"myserver1"}
CERTFILE=${2:-"server1"}

openssl ecparam -out "${CERTFILE}_key.pem" -name prime256v1 -genkey
#openssl genrsa -out "${CERTFILE}_key.pem" 4096

openssl req -new -key "${CERTFILE}_key.pem" -out "${CERTFILE}.csr" -subj "/CN=$NAME"
openssl x509 -req -in "${CERTFILE}.csr" -CA i2.pem -CAkey i2_key.pem -CAcreateserial -out "${CERTFILE}.pem" -days 365 -sha256 -extensions server_profile -extfile x509_server_config.cfg
