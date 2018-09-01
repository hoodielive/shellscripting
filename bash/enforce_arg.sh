#!/bin/bash

validchars="(echo ${1} | sed -e 's/[^[:alnum:]]@sei.cmu.edu|cert.org//g')"
