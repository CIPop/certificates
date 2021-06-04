#!/usr/bin/env bash

cfssl gencert -ca=i2.pem \
              -ca-key=i2-key.pem \
              -config=config.json \
              -profile=www \
              csr-server-ec.json | cfssljson -bare server1
