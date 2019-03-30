#!/usr/bin/env python3

""" uses better structure for scripts """ 

import sys 

if __name__ == "__main__":
    data = sys.stdin.read() 
    chars = len(data)
    words = len(data.split())
    lines = len(data.split('\n'))
    print("{0} {1} {2}".format(lines, words, chars))
