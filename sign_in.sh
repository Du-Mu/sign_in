#!/bin/bash
cat signin.yaml
stu_id=`cat signin.yaml | sed -n '1p' | awk '{print $2}' | tr -c -d '[0-9]'`
mydata=`cat signin.yaml | sed -n '2p' | awk '{print $2}'| tr -c -d '[0-9] -'`
sign_key=`cat signin.yaml | sed -n '3p' | awk '{print $2}'| tr -c -d '[0-9] [a-z] [A-Z]'`
class_id=`cat signin.yaml | sed -n '4p' | awk '{print $2}'| tr -c -d '[0-9]'`
repo_addr="https://se.jisuanke.com/whu-summer-course-2022/404"


combined=$stu_id$sign_key$class_id
touch $mydata
echo -n $combined | md5sum | cut -d ' ' -f1 >$mydata
#./check.sh

git add -A
git commit -m "signin $mydata"
git push origin $branch