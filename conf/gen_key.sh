#!/usr/bin/env bash

set -e
set -o pipefail

# Generate CA certificate
openssl req -new -nodes -x509 -days 365 -extensions v3_ca -keyout ca.key -out ca.crt -subj "/C=RU/ST=Saint Petersburg/L=Saint Petersburg/O=Test Company/OU=IT Department/CN=caroot"

# Generate server key
openssl genrsa -out server.key 2048
# Generate signing request
openssl req -out server.csr -key server.key -new -subj "/C=RU/ST=Saint Petersburg/L=Saint Petersburg/O=Test Company/OU=IT Department/CN=server"
# Sign server key with the CA key
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 365 

# Generate client key
openssl genrsa -out client.key 2048
# Generate signing request
openssl req -out client.csr -key client.key -new -subj "/C=RU/ST=Saint Petersburg/L=Saint Petersburg/O=Test Company/OU=IT Department/CN=client"
# Sign client key with the CA key
openssl x509 -req -in client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out client.crt -days 365
