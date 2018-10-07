#!/bin/bash 


unset FIND_MEMBER 

FIND_MEMBER=/usr/lib/mailman/bin/find_member

while getopts hqr: opt; do
 case $opt in
