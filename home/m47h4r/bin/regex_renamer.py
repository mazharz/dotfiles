#!/usr/bin/python3

import os, re, sys

# how to use?
# open your terminal where you want to rename files
# regex_renamer.py "$(pwd)" "[0-9]+\s" ""
# note that the double quote around $(pwd) is necessary if the directory
# has spaces in it (which it usually has)

location = sys.argv[1]
rename_from = sys.argv[2]
rename_to = sys.argv[3]

files = os.listdir(location)

for file in files:
    original = location + "/" + file
    renamed = location + "/" + re.sub(f'{rename_from}', f'{rename_to}', file)
    os.rename(original, renamed)
