#!/usr/bin/env bash

NAME=${1:-"myserver1.mydomain"}
CERTFILE=${2:-"server1"}

openssl ecparam -out "${CERTFILE}_key.pem" -name prime256v1 -genkey
#openssl genrsa -out "${CERTFILE}_key.pem" 4096

openssl req -new -nodes -x509 -key "${CERTFILE}_key.pem" -out "${CERTFILE}.pem" -days 365 -sha256 -extensions server_profile -config x509_server_config.cfg -subj "/CN=$NAME" 
