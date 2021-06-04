# Certificates

This repository contains certificate generation examples for _development_ purposes.
For production purposes the use of a Hardware Security Module is strongly recommended. Private keys should be stored within the HSM instead of the file system.

## OpenSSL

The scripts generate the keys, certificate signing request and the certificate. 
The csr files can be signed using external certificate signing services. To achieve that, use the `.csr` file then download the certificate from the signing service. Replace the `*_cert.pem` file with the one signed externally.

## CFSSL

To install CFSSL on Ubuntu:

`sudo apt install golang-cfssl`
