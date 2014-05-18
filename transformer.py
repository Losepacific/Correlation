#!/usr/bin/env python3
import sys
import re
getData1 = re.compile(r'^<..*68px..*>')
getData2 = re.compile(r'^<..*300px..*>')
forHTML = re.compile(r'[<>]')
cutOut = re.compile(r'&#[0-9][0-9]*;')
cutNumber = re.compile(r'([A-Za-z][A-Za-z]*\s*)[0-9=][0-9=]*')
rmSpaceLine = re.compile(r'^\s*$')
rmRank = re.compile(r' *Rank *$')
DataList = []
for line in sys.stdin :
	if getData1.search(line) or getData2.search(line):
		DataList.append(forHTML.split(line)[2])
for i in range(0,len(DataList)):
	DataList[i] = cutOut.sub(' ',DataList[i])
	DataList[i] = cutNumber.sub(r'\1',DataList[i])
DataList = [ x.strip() for x in DataList if (not rmSpaceLine.match(x)) and ( not rmRank.match(x)) ]
for i in range(0,len(DataList),2):
	print(DataList[i] + ':' + DataList[i+1])
