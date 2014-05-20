  awk -F"\t" '{print $1,":",$9}' GDP.txt | sed 's/^  *//;s/  *\(:\)  */\1/;s/,//g' > GDP2.txt 
  awk -F":" 'FNR == NR {national[$1] = $2 ;next}{printf "%s,%s\n",$0,national[$1]}' GDP2.txt 1_1.txt | cat -n
