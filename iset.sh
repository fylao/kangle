#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# Check if user is root
if [ $(id -u) != "0" ]; then
echo -e "————————————————————————————————————————————————————
抱歉！检测到您不是使用root权限执行本脚本.
请使用root账号登陆ssh运行本脚本
————————————————————————————————————————————————————"
? ? exit 1
fi
clear
echo -e "————————————————————————————————————————————————————
正在为您重置MySQL密码. 
请输入您需要设置的MySQL密码
注意:不要输入空白密码.
————————————————————————————————————————————————————"

mysql_root_password=""
read -p "(请输入您需要设置的MySQL密码):" mysql_root_password
if [ "$mysql_root_password" = "" ]; then
echo "错误提示:请不要输入空白密码必须为\n"
exit 1
fi
printf "停止MySQL服务中......\n"
/etc/init.d/mysqld stop
printf "开始设置MySQL权限表\n"
/usr/bin/mysqld_safe --skip-grant-tables >/dev/null 2>&1 &
printf "正在刷新权限表与进行重置密码\n"
sleep 10
printf "现在设置MySQL密码('$mysql_root_password') MySQL账号'root'\n"
/usr/bin/mysql -u root mysql << EOF
update user set password = Password('$mysql_root_password') where User = 'root';
EOF

reset_status=`echo $?`
if [ $reset_status = "0" ]; then
printf "MySQL密码设置成功.现在恢复设置MySQL权限表\n"
killall mysqld
sleep 10
printf "正在重启MySQL服务\n"
/etc/init.d/mysqld start
echo -e "————————————————————————————————————————————————————
已为您重置MySQL密码. 
↓您的mysql密码为↓
\033[33m $mysql_root_password \033[0m
————————————————————————————————————————————————————"
else
echo -e "————————————————————————————————————————————————————
抱歉！无法为您重置MySQL密码. 
————————————————————————————————————————————————————"
fi
input_enter=""
read -p "(任意键返回主菜单)" input_enter
if [ "$input_enter"!="" ]; 
then
wget http://kangle.fylao.com/install.sh -O install.sh;sh install.sh
fi