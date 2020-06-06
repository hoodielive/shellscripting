#!/usr/bin/env bash
set -x

for nodes in $(cat phrases.txt) ; do 

sed -i.bak '$nodes' authz.erb
done

