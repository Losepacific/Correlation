#!/usr/bin/env python3
import sys
national = {}

for line in sys.stdin :
	i=line.strip().split(':')
	national[ i[0] ] = [i[1].replace(' ','')]
print(national)
