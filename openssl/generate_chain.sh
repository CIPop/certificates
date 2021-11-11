#!/usr/bin/env bash

CA_NAME=${1:-"My Certificate Authority"}
ICA1_NAME=${2:-"My Intermediate 1"}
ICA2_NAME=${3:-"My Intermediate 2"}

# Generate CA Root
openssl ecparam -out ca_key.pem -name prime256v1 -genkey
#openssl genrsa -out ca_key.pem 4096

openssl req -new -days 3650 -nodes -x509 -key ca_key.pem -out ca.pem -subj "/CN=$CA_NAME" -extensions ca_profile -config x509_ca_config.cfg

# Generate ICA1
openssl ecparam -out i1_key.pem -name prime256v1 -genkey
#openssl genrsa -out i1_key.pem 4096

openssl req -new -key i1_key.pem -out i1.csr -subj "/CN=$ICA1_NAME"
openssl x509 -req -in i1.csr -CA ca.pem -CAkey ca_key.pem -CAcreateserial -out i1.pem -days 3650 -sha256 -extensions ca_profile -extfile x509_ca_config.cfg

# Generate ICA2
openssl ecparam -out i2_key.pem -name prime256v1 -genkey
#openssl genrsa -out i2_key.pem 4096

openssl req -new -key i2_key.pem -out i2.csr -subj "/CN=$ICA2_NAME"
openssl x509 -req -in i2.csr -CA i1.pem -CAkey i1_key.pem -CAcreateserial -out i2.pem -days 3650 -sha256 -extensions ca_profile -extfile x509_ca_config.cfg
