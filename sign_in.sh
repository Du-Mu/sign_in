stu_id = $(cat signin.yaml | grep "stu_id:" | awk '{print $2}')
data = $(cat signin.yaml | grep "data:" | awk '{print $2}')
sign_key = $(cat signin.yaml | grep "data:" | awk '{print $2}')
class_id= $(cat signin.yaml | grep "class_id:" | awk '{print $2}')
repo_addr="https://se.jisuanke.com/whu-summer-course-2022/404"

combined=$stu_id$sign_key$class_id

echo -n $combined | md5sum  > $data

./check.sh
