#!/usr/bin/env bash

cfssl gencert -initca
              -config=config.json \
              -profile=client \
              csr-client-ec.json | cfssljson -bare client1
