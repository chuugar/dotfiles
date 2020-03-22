#!/usr/bin/python3

import fileinput
import re
from unidecode import unidecode
from sys import argv

filename = argv[1]
r = re.compile("(^\\\label{)(.{3}:)(.*)(})")

def unicode(string):
	n_s = unidecode(string)
	n_s = n_s.lower()
	for c in n_s:
		if not c.isalpha() or not c.isascii():
			n_s = n_s.replace(c, "_")
	return n_s.rstrip()

with fileinput.FileInput(filename, inplace=True, backup='.bak') as sfile:
    for line in sfile:
        if r.findall(line):
            matched = r.match(line).group(3)
            print(line.replace(matched, unicode(matched)), end='')
        else:
            print(line, end='')
