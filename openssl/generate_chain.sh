#!/usr/bin/env bash

CA_NAME=${1:-"My Certificate Authority"}
ICA1_NAME=${2:-"My Intermediate 1"}
ICA2_NAME=${3:-"My Intermediate 2"}

# Generate CA Root
openssl ecparam -out ca_key.pem -name prime256v1 -genkey
#openssl genrsa -out ca_key.pem 4096

openssl req -new -days 3650 -nodes -x509 -key ca_key.pem -out ca_cert.pem -subj "/CN=$CA_NAME"

# Generate ICA1
openssl ecparam -out i1_key.pem -name prime256v1 -genkey
#openssl genrsa -out i1_key.pem 4096

openssl req -new -key i1_key.pem -out i1.csr -subj "/CN=$ICA1_NAME"
openssl x509 -req -in i1.csr -CA ca_cert.pem -CAkey ca_key.pem -CAcreateserial -out i1_cert.pem -days 3650 -sha256

# Generate ICA2
openssl ecparam -out i2_key.pem -name prime256v1 -genkey
#openssl genrsa -out i2_key.pem 4096

openssl req -new -key i2_key.pem -out i2.csr -subj "/CN=$ICA2_NAME"
openssl x509 -req -in i2.csr -CA i1_cert.pem -CAkey i1_key.pem -CAcreateserial -out i2_cert.pem -days 3650 -sha256
