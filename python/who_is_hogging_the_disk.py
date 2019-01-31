#!/usr/bin/env python3 

""" a script to see who's hogging shared space """

import sys 

def get_totals(rows):
    """ function to find space used by users in a ls -1 listing rows """
    users = {}
    for row in rows:
        if row.startswith('-'):
            fields = row.split()
            username, filesize = fields[2], fields[4]
            if username not in users:
                users[username] = 0
            users[username] += int(filesize)
    userlist = users.items()
    # fix this because dictionary does NOT have a sort attribute
    userlist.sort(cmp=lambda x,y: cmp(x[1], y[1]), reverse=True)
    return userlist

get_totals('df')
