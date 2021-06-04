#!/usr/bin/env bash

cfssl gencert -initca csr-root-ca-ec.json | cfssljson -bare ca –

cfssl gencert -ca=ca.pem \
              -ca-key=ca-key.pem \
              -config=config.json \
              -profile=intermediateCA \
              csr-intermediate-ca1-ec.json | cfssljson -bare i1

cfssl gencert -ca=i1.pem \
              -ca-key=i1-key.pem \
              -config=config.json \
              -profile=intermediateCA \
              csr-intermediate-ca2-ec.json | cfssljson -bare i2
