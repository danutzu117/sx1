#!/bin/bash

#Declaram variabilele

RESTART="service httpd restart"

PGREP="/usr/bin/pgrep"
HTTPD="httpd"

NETSTAT="netstat -ln | grep ':80'"
#PORT="80"

STATUS="curl -I  --stderr /dev/null http://www.start-learning.ro | head -1 | cut -d' ' -f2"
#COD="200"

WORD="wget "http://www.start-learning.ro" --timeout 5 -O - 2>/dev/null | grep works"


# cautam pid-ul httpd-ului si ULR status

$PGREP ${HTTPD}
#$NETSTAT ${PORT}
$SATUS ${COD}

if [ $? -ne 0 ]
then

echo "Apache nu ruleaza " | mail -s "Server Alert: Serverul Apache nu ruleaza" dinca.danielmihai@yahoo.com
exit

else

#Check if the process retruns not value[httpd not running].

#if [[ $? -ne 0 || $NETSTAT -ne 80 || $STATUS -ne 200 || $WORD -ne works ]]
#if [[ $NETSTAT -ne 80 || $STATUS -ne 200 || $WORD -ne works ]]

if [[ $? -ne 0 || $NETSTAT -ne 1 || $STATUS -ne 0 || $WORD -ne works ]]

then

 # restart apache
 $RESTART

#for n in {1..5};
#do
# $RESTART;
#done
#echo "Apache don't start " | mail -s "Server Alert: Serverul Apache nu mai ruleaza" dincadaniel88@gmail.com

fi
fi

# 02 08,17 * * * /scripts/apache_check.sh  -> am setat un cronjob (crontab -e) pe server care sa faca #check-ul la 2 minute pe fiecare zi intre orele 8:00AM -> 5:00PM
# https://github.com/danutzu117/sx1/blob/master/apache_check.sh  GIT file
                         
