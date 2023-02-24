#!/usr/bin/env bash

CERT_PATH=${1:-"../certs"}
CERTFILE=${2:-"server1"}    # FileName
TYPE=${3:-"ec"}             # Type of key to use (ec or rsa)
INTERMEDIATE=${4:-"i2"}     # Intermediate CA to use (ca, i1, i2)

cfssl gencert -ca=${CERT_PATH}/${INTERMEDIATE}.pem \
              -ca-key=${CERT_PATH}/${INTERMEDIATE}-key.pem \
              -config=config.json \
              -profile=server_profile \
              csr-server-${TYPE}.json | cfssljson -bare "${CERT_PATH}/${CERTFILE}"
