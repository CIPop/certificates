# Certificates

This repository contains certificate generation examples for _development_ purposes.
For production purposes the use of a Hardware Security Module is strongly recommended. Private keys should be stored within the HSM instead of the file system.

Edit the scripts to switch from ECC to RSA certificates or change the number of chain intermediates.

## CFSSL (Recommended)

To install [CFSSL](https://github.com/cloudflare/cfssl) on Ubuntu: 

`sudo apt install golang-cfssl`

For all CFSSL scripts, edit the `csr_*.json` to change certificate name parameters.

```sh
cd cfssl

# Generates a self-signed Client certificate.
./generate_client_selfsigned.sh

# Generates a chain with 3 levels: CA, Intermediate CA 1, Intermediate CA 2
./generate_chain.sh

# Generates a client certificate within the previously generated chain.
./generate_client_chain.sh

# Generates a client certificate within the previously generated chain.
./generate_server_chain.sh

# Display the certificate details.
./show.sh <cert.pem>
```


## OpenSSL

```sh
cd openssl

# Generates a self-signed Client certificate.
./generate_client_selfsigned.sh

# Generates a chain with 3 levels: CA, Intermediate CA 1, Intermediate CA 2
# Accepts 3 parameters for the CN portions of the CA, Intermediate 1 and Intermediate 2 in this order)
./generate_chain.sh

# Generates a client certificate signed by Intermediate2
# Accepts 2 parameters: the CN of the certificate and the filename pattern (default "client1"). Generates client1.pem and client1_key.pem
./generate_client_chain.sh

# Edit the x509_server_config.cfg to change the Subject Alternative Name fields
./generate_server_chain.sh

# Display the certificate details.
./show.sh <cert.pem>
```
