#!/bin/bash
Tmpfile1="${1%.*}$(date +%y%m%d%H%M%S)_1.txt"
Tmpfile2=${Tmpfile1%_1.*}"_2.txt"
#############################################
awk '
/^<..*68px..*>/||/<..*300px..*>/{print $0}
' $1 > $Tmpfile1 
awk -F"[<>]" '
{print $3}
' $Tmpfile1 > $Tmpfile2 
#############################################
sed '
s/&#[0-9][0-9]*;/ /g 
s/\([A-Za-z][A-Za-z]*\s*\)[0-9=][0-9=]*/\1/g
/^\s*$/d
/ *Rank *$/d
' $Tmpfile2  > $Tmpfile1
#############################################
awk '
BEGIN{a=0;b=0}
{
	if(NR%2){
		national[a]=$0;a=a+1
	}else{
		democracy[b]=$0;b=b+1
	}
}
END{
	for(i=0;i<(NR/2);i=i+1){
		print national[i],":",democracy[i]
	}
}
' $Tmpfile1 > $Tmpfile2
