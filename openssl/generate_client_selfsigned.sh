#!/usr/bin/env bash

NAME=${1:-"myclient1"}
CERTFILE=${2:-"client1"}

openssl ecparam -out "${CERTFILE}_key.pem" -name prime256v1 -genkey
#openssl genrsa -out "${CERTFILE}_key.pem" 4096

openssl req -new -nodes -x509 -key "${CERTFILE}_key.pem" -out "${CERTFILE}_cert.pem" -days 365 -sha256 -extensions client_auth -config x509_client_config.cfg -subj "/CN=$NAME" 
