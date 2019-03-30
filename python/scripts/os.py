#!/usr/bin/env 

import os 

#os.environ() 
#os.getcwd()
#os.chmod() 
#os.chown()
#os.link() 
#os.mkdir()
#os.remove() 
#os.rename() 

for x in os.walk('.'):
    print(x)
