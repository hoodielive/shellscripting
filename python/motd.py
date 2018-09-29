#!/usr/bin/env python3 

""" This is a motd type program with commandline input """ 

import sys 

from datetime import datetime

# get user's name from command line 

name = sys.argv[1]

size = len(name)

print('Welcome to Something lol', name)
print('The size of your name is: ', size, "characters long")
print('The program %s was called with the following %d arguments: ' % (sys.argv[0], len(sys.argv) - 1))

for arg in sys.argv[1:]:
    print(arg)
