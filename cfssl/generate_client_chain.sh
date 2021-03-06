#!/usr/bin/env bash
CERTFILE=${1:-"client1"}

cfssl gencert -ca=i2.pem \
              -ca-key=i2-key.pem \
              -config=config.json \
              -profile=client_profile \
              csr-client-ec.json | cfssljson -bare "${CERTFILE}"
