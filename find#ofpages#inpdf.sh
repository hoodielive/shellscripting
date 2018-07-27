#!/bin/bash 

echo "$(exiftool *.pdf | grep Page-count | cut -d ":" -f2 | tr '\n' '+')""0" | bc
