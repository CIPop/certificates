#!/usr/bin/env bash

NAME=${1?"Pass the certificate filename as the first parameter."}

cfssl certinfo -cert $NAME
