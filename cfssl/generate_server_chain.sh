cfssl gencert \
  -ca=ca.pem \
  -ca-key=ca-key.pem \
  -config=config.json \
  -profile=www \
  server-csr.json | cfssljson -bare server
