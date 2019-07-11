#!/bin/bash
clear
echo -e "————————————————————————————————————————————————————
卸载Kangle会删除 /vhs 目录下所有数据请先进行备份后再执行卸载指令！
如果您确认进行以下操作请输入 Y 进行卸载
如果否请按下Enter退出此操作
————————————————————————————————————————————————————"
input_enter=""
read -p "" input_enter
if [ "$input_enter" = "y" ] || [ "$input_enter" = "Y" ]; then
rm -rf hls*
rm -rf /vhs
chkconfig kangle off
clear
echo -e "————————————————————————————————————————————————————
已完成卸载Kangle以及删除了 /vhs 目录下所有数据！
————————————————————————————————————————————————————"
exit
exit
else
clear
echo -e "————————————————————————————————————————————————————
已退出了卸载Kangle指令！
————————————————————————————————————————————————————"
fi

input_enter=""
read -p "(任意键返回主菜单)" input_enter
if [ "$input_enter"!="" ]; 
then
wget http://kangle.fylao.com/install.sh -O install.sh;sh install.sh
fi
