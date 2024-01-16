# Awk

## get column information
ps | awk '{print $1}'  -- print first column 
ps | awk '{print $2}'  -- print second column
ps | awk '{print $0}'  -- print everything 

awk -F ":" '{print $1}' /etc/passwd  -- print first column with : as separator

awk -F ":" '{print $1 $2 $3}' /etc/passwd  -- print first  second and third column with : as separator
awk -F ":" '{print $1 \t $2 \t $3}' /etc/passwd  -- print first  second and third column with tab in between with: as separator

awk 'BEGIN{FS=":"; OFS="-"} {print $1,$6,$7}' /etc/passwd --add field separator - 
awk -F "/" '/^\// {print $NF}' /etc/shells   -- print last column with filed separator / and string starting with /   
awk -F "/" '/^\// {print $NF}' /etc/shells | uniq   -- print last column with  separator / and string starting with /   


{print $1 "\t" $2 + $3}  -- print column 2 + 3

awk 'length($0) > 7' /etc/shells  -- print characters with length greater than 7  
awk 'length($0) < 8' /etc/shells  -- print characters with length less than 7  

ps -ef | awk '{if($NF == "/bin/fish") print $0}' -- print everyline where the last field ends in /bin/fish


awk 'BEGIN { for( i=1; i<10; i++) print "The square of", i, "is", i*i;}'  --loop through and print square characters

awk '$1 ~ /^[b,c]/ {print $0} .bashrc' -- print everyline where everyline begins with b or c


awk '{print substr($0, 4)}' numbereed.txt  -- ignore first 3 characters of every line

awk 'match($0, /o/) {print $0 "has  \"o\" character at "RSTART"} numbered.txt' -- Find every line that has letter O and , On every line that has the letter o, follow that line with has 'has o charater at RStart(index)'


awk 'NR==7, NR==11 {print NR, $0}' print line 6 to 7


awk 'END {print NR}' /etc/shells --get number of lines(number of records)


