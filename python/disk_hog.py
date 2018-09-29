#!/usr/bin/env python3 

""" a script to see whose hogging public space """

import sys 

def get_totals(rows):
    """ function to find space used by users in a ls -l listing
    rows: ls -l list of lines 
    returns: list of users, file space tuples """

    users = {} 
    for row in rows:
        if row.startswith('-'): 
            fields = row.split() 
            username, filesize = fields[2], fields[4]
            if username not in users:
                users[username] = 0 
            users[username] += int(filesize)
    userlist = users.items() 
    userlist.sort(cmp=lambda x,y: cmp(x[1], y[1], reverse=True))
    return userlist

def compare(x,y): 
    return cmp(x[1], y[1])

if __name__ == '__main__':
    file_rows = sys.stdin.readlines()
    user_totals = get_totals(file_rows)
    for user in user_totals:
        print("%-20s %20s" % user)

