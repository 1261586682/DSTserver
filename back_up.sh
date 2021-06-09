#!/bin/bash
back_up_route="/root/.klei/DoNotStarveTogether/MyDediServer/back_up"
bash_route="/root/DSTserver"
Caves_route="/root/.klei/DoNotStarveTogether/MyDediServer/"
Master_route="/root/.klei/DoNotStarveTogether/MyDediServer/"
back_up_log="/root/DSTserver/back_up_log.txt"
strdate=`date +%Y-%m-%d-%T`
cd ${back_up_route}
mkdir ${strdate}
cp_back_up_route="/root/.klei/DoNotStarveTogether/MyDediServer/back_up/${strdate}"
cd ${Caves_route}
cp -r Caves ${cp_back_up_route}
cd ${Master_route}
cp -r Master ${cp_back_up_route}
echo `date +%Y-%m-%d-%T`>>${back_up_log}
echo "${strdate} Backup succeeded">>${back_up_log}
cd ${back_up_route}
dirsums=$(ls -l|grep '^d'|wc -l)
if test $dirsums -gt 24
then
str=$(ls -l|grep '^d'|head -n 1)
rm -rf ${str:41:19}
echo "delet ${str:41:19}">>${back_up_log}
fi
echo -e "\n">>${back_up_log}
