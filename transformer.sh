awk '/^<..*68px..*>/||/<..*300px..*>/{print $0}' ~/下載/DEMOCRACY_TABLE_2007_v3-1.html > data_democracy.txt 
awk -F'[<>]' '{print $3}' data_democracy.txt > data_democracy2.txt 
sed 's/ [0-9=][0-9=]*&#.*;$//g ; s/&#.*;//g' data_democracy2.txt  > data_democracy.txt 
awk 'BEGIN{a=0;b=0}{if(NR%2){national[a]=bash;a=a+1}else{democracy[b]=bash;b=b+1}}END{for(i=0;i<(NR/2);i=i+1){print national[i],democracy[i]}}' data_democracy.txt > data_democracy2.txt 
