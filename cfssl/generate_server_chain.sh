#!/usr/bin/env bash

CERTFILE=${1:-"server1"}

cfssl gencert -ca=i2.pem \
              -ca-key=i2-key.pem \
              -config=config.json \
              -profile=www \
              csr-server-ec.json | cfssljson -bare "${CERTFILE}"
