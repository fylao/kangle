#!/bin/bash
export START="kangle.fylao.com"
export UPTIME="$(curl -s http://kangle.fylao.com/uptime.txt)"
v=`cat /etc/redhat-release|sed -r 's/.* ([0-9]+)\..*/\1/'`
#  centos-7
if [ $v -eq 7 ]; then
echo "====================================="
   echo "         

                    oOoo
                  o8888888o
                  88" . "88
                  (| -_- |)
                  O\  =  /O
               ____/`---'\____
             .'  \\|     |//  `.
            /  \\|||  :  |||//  \
           /  _||||| -:- |||||-  \
           |   | \\\  -  /// |   |
           | \_|  ''\---/''  |   |
           \  .-\__  `-`  ___/-. /
         ___`. .'  /--.--\  `. . __
      ."" '<  `.___\_<|>_/___.'  >'"".
     | | :  `- \`.;`\ _ /`;.`/ - ` : | |
     \  \ `-.   \_ __\ /__ _/   .-` /  /
======`-.____`-.___\_____/___.-`____.-'======
                   `=---='


^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
           佛祖保佑       永不死机
           心外无法       法外无心
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
抱歉,本脚本不支持Centos7.x,请安装Centos6.x";
	exit 0;
fi

#  centos-6
if [ $v -eq 6 ]; then
echo "本机系统为centos 6 64位符合脚本安装要求"
rm -rf kangle-start.sh kangle-start.* kangle.sh kangle.*
wget ${START}/kangle-start.sh -O kangle-start.sh
sh kangle-start.sh
exit 0;
fi
