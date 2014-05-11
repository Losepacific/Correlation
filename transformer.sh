awk '/^<..*68px..*>/||/<..*300px..*>/{print $0}' ~/下載/DEMOCRACY_TABLE_2007_v3-1.html > data_democracy.txt 
awk -F'[<>]' '{print $3}' data_democracy.txt > data_democracy2.txt 
sed 's/ [0-9=][0-9=]*&#.*;$//g ; s/&#.*;//g' data_democracy2.txt  > data_democracy.txt 
