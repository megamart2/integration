#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys

# if len(sys.argv) < 2:
# 	print 'give names of input variables as parameters'
# 	sys.exit(1)

vars = []
output = []

for arg in sys.argv[1:]:
	vars += arg.split()

for l in sys.stdin:
        words = l.split()
        if len(words)==2 and (words[0] in vars or (len(vars)==0 and "input" in words[0])): # TODO: this is a hack that may not work in all cases
                if words[1][0]=="1":
                        print str((-1)*(int("".join([b=="0" and "1" or "0" for b in words[1]]), 2)+1)),
                else:
                        print str(int(words[1], 2)),
print
