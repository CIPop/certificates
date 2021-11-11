#!/usr/bin/env bash
CERTFILE=${1:-"client1"}

# Note: hostname is required:

cfssl selfsign \
              -config=config.json \
              -profile=client_profile \
              "myclient" \
              csr-client-ec.json | cfssljson -bare "${CERTFILE}"
