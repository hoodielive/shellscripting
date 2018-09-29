#!/usr/bin/env python3 

import sys 

data = open(sys.argv[1]).read() 

# the above is a shortened form of:
# infile = open(sys.argv[1])
# data = infile.read() 
# sys.argv, sys.stdin, sys.stdout, sys.stderr 

chars = len(data)
words = len(data.split()) # split on strings 
lines = len(data.split('\n'))

print("{0} {1} {2}".format(lines, words, chars)) # format stuff

