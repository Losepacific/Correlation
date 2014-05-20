#!/bin/bash
awk -F":" 'FNR == NR {national[$1] = $2 ;next}{printf "%s,%s\n",$0,national[$1]}' $1 $2
