#!/usr/bin/env bash

CERT_PATH=${1:-"../certs"}
TYPE=${2:-"ec"}             # Type of key to use (ec or rsa)

mkdir -p ${CERT_PATH}

cfssl gencert -initca csr-root-ca-${TYPE}.json | cfssljson -bare ${CERT_PATH}/ca –

cfssl gencert -ca=${CERT_PATH}/ca.pem \
              -ca-key=${CERT_PATH}/ca-key.pem \
              -config=config.json \
              -profile=ca_profile \
              csr-intermediate-ca1-${TYPE}.json | cfssljson -bare ${CERT_PATH}/i1

cfssl gencert -ca=${CERT_PATH}/i1.pem \
              -ca-key=${CERT_PATH}/i1-key.pem \
              -config=config.json \
              -profile=ca_profile \
              csr-intermediate-ca2-${TYPE}.json | cfssljson -bare ${CERT_PATH}/i2
