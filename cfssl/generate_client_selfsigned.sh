#!/usr/bin/env bash

# Note: hostname is required:

cfssl selfsign \
              -config=config.json \
              -profile=client \
              "myclient" \
              csr-client-ec.json | cfssljson -bare client1
