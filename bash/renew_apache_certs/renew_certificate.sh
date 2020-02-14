#!/bin/bash

unset OLD_CERT
unset OLD_CSR
unset OLD_KEY
unset OLD_BUNDLE
unset NEW_CERT
unset NEW_CSR
unset NEW_KEY
unset NEW_BUNDLE

OLD_CERT=0
OLD_CSR=0
OLD_KEY=0
OLD_BUNDLE=0
NEW_CERT=0
NEW_CSR=0
NEW_KEY=0
NEW_BUNDLE=0

ARG=""

case $ARG in
    1)
        cert_renewal=1
        break
        ;;
    2)
