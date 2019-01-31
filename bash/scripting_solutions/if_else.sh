#!/bin/bash

AGE=40
if [ ${AGE} -lt 18 ]; then 
  echo "You must be 18 or older to see this movie"
else 
  echo "You may see the movie!"
fi
