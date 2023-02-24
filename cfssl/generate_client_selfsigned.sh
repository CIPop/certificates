#!/usr/bin/env bash
CERT_PATH=${1:-"../certs"}
CERTFILE=${2:-"client_self1"}    # FileName
TYPE=${3:-"ec"}                  # Type of key to use (ec or rsa)

mkdir -p ${CERT_PATH}

cfssl selfsign \
              -config=config.json \
              -profile=client_profile \
              "${CERTFILE}" \
              csr-client-${TYPE}.json | cfssljson -bare "${CERT_PATH}/${CERTFILE}"
