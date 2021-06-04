#!/usr/bin/env bash

cfssl gencert -ca=i2.pem \
              -ca-key=i2-key.pem \
              -config=config.json \
              -profile=client \
              csr-client-ec.json | cfssljson -bare client1
