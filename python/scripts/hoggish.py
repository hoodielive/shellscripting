#!/usr/bin/env python3 

from disk_hog import get_totals 

if __name__ == '__main__':
    file_rows = sys.stdin.readlines() 
    user_totals = get_totals(file_rows)
    for user in user_totals:
        print("%-20s %10s" % user) 
