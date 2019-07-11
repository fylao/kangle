#!/bin/bash
# 默认节点
export IP1="http://kangle.fylao.com"
# 海外节点
export IP3="http://downland-us.fylao.cn"
# 备用节点
export IP2="http://downland.fylao.com"
# 快捷运行
wget https://kangle.fylao.com/kangle.sh -O /bin/kanglesh
chmod -R 777 /bin/kanglesh

function Welcome(){
echo -e "\033[32m 欢迎加入飞鱼Kangle一键脚本交流群，群聊号码：716510904
脚本支持服务商:
咖啡主机  www.cfhost.cn
数掘科技 www.gfvps.cn \033[0m"
}
function Install_finish(){
echo -e "\033[32m 脚本已安装完毕(kangle商业版+ep面板+模板+php5-php7)
easypanel控制面板管理员后台：http://ip:3312/admin
帐号：admin
密码：kangle

mysql数据库管理员后台：http://ip:3313/mysql
帐号：root
密码：${mysql_passwd}(请妥善保管)
此一键脚本由FlyFish集成，纯净无后门
欢迎加入飞鱼Kangle一键脚本交流群，群聊号码：716510904
云服务推荐选购:
咖啡主机  www.cfhost.cn
数掘科技 www.gfvps.cn \033[0m"
Install_rm
echo `date`
}
function Upepphp(){
rm -rf /vhs/kangle/ext/tpl_php52/config.xml
wget ${START}/install/kangle/master/easypanel/config.xml -O /vhs/kangle/ext/tpl_php52/config.xml -e http_proxy=${IP}
wget ${START}/install/kangle/master/easypanel/php-node-5639.ini -O /vhs/kangle/ext/tpl_php52/etc/php-node-5639.ini -e http_proxy=${IP}
/vhs/kangle/bin/kangle -r
echo -e "\033[32m Easypanel面板PHP升级成功(PHP5.6.39) \033[0m"
}
function Rm_log(){
find /home -name "*.log"  | xargs rm -vrf
echo -e "\033[32m 所有虚拟主机日志已清理完毕 \033[0m"
}
function Install_cron_log(){
yum -y install vixi-cron
yum -y install crontabs
echo "45 * * * * /bin/rm -rf /vhs/kangle/var/*" >> /var/spool/cron/root
echo "45 * * * * /bin/rm -rf /tmp/sess*" >> /var/spool/cron/root
service crond restart
echo -e "\033[32m 每日自动清除日志进程已添加成功 \033[0m"
}
function Install_cron_kangle(){
yum -y install vixi-cron
yum -y install crontabs
echo "* * * * * /etc/init.d/kangle start" >> /var/spool/cron/root
service crond restart
echo -e "\033[32m Kangle守护进程已添加成功 \033[0m"
}
function Install_cron_mysql(){
yum -y install vixi-cron
yum -y install crontabs
echo "* * * * * /etc/init.d/mysqld start" >> /var/spool/cron/root
service crond restart
echo -e "\033[32m Mysql守护进程已添加成功 \033[0m"
}
function Install_patch_domain(){
wget ${START}/install/patch/domain.ctl.php2 -O domain.ctl.php -e http_proxy=${IP}
mv -f domain.ctl.php /vhs/kangle/nodewww/webftp/vhost/control/domain.ctl.php
rm -rf domain.ctl.php
echo -e "\033[32m 虚拟主机用户前台泛绑定补丁已安装成功 \033[0m"
}
function Install_update(){
wget ${START}/install/e.sh -O e.sh -e http_proxy=${IP};sh e.sh /vhs/kangle
/vhs/kangle/bin/kangle -r
echo -e "\033[32m Kangle主程序已升级完毕 \033[0m"
Install_exit
}
function Install_exit(){
Install_rm
echo -e "\033[32m 安装程序已退出 \033[0m"
Welcome
exit
}
function Install_rm(){
rm -rf /root/kangle.* /root/kangle-start.* /root/*.tar.gz /root/*.sh /root/*.rpm /root/*.tar.bz2 /root/tpl_php* /root/kangle /root/safedog* /root/libevent* /root/libzip* /root/tmp
echo -e "\033[32m 安装垃圾已清理完毕 \033[0m"
}
function Install_view_vhost1(){
rm -rf /vhs/kangle/nodewww/webftp/vhost/view/*;wget -P /vhs/kangle/nodewww/webftp/vhost/view ${START}/install/view/vhost/view1.zip -e http_proxy=${IP};unzip /vhs/kangle/nodewww/webftp/vhost/view/view1.zip -d /vhs/kangle/nodewww/webftp/vhost/view
echo -e "\033[32m Vhost用户前台模板已更换完毕-飞鱼kangle一键脚本默认模板(如模板显示有异常请在3312后台清除模板缓存，清除本地浏览器缓存后重试) \033[0m"
}
function Install_view_vhost2(){
rm -rf /vhs/kangle/nodewww/webftp/vhost/view/*;wget -P /vhs/kangle/nodewww/webftp/vhost/view ${START}/install/view/vhost/view2.zip -e http_proxy=${IP};unzip /vhs/kangle/nodewww/webftp/vhost/view/view2.zip -d /vhs/kangle/nodewww/webftp/vhost/view
echo -e "\033[32m Vhost用户前台模板已更换完毕-经典商务类型(如模板显示有异常请在3312后台清除模板缓存，清除本地浏览器缓存后重试) \033[0m"
}
function Install_view_vhost3(){
rm -rf /vhs/kangle/nodewww/webftp/vhost/view/*;wget -P /vhs/kangle/nodewww/webftp/vhost/view ${START}/install/view/vhost/view3.zip -e http_proxy=${IP};unzip /vhs/kangle/nodewww/webftp/vhost/view/view3.zip -d /vhs/kangle/nodewww/webftp/vhost/view
echo -e "\033[32m Vhost用户前台模板已更换完毕-基于原版美化(如模板显示有异常请在3312后台清除模板缓存，清除本地浏览器缓存后重试) \033[0m"
}
function Install_view_vhost4(){
rm -rf /vhs/kangle/nodewww/webftp/vhost/view/*;wget -P /vhs/kangle/nodewww/webftp/vhost/view ${START}/install/view/vhost/view4.zip -e http_proxy=${IP};unzip /vhs/kangle/nodewww/webftp/vhost/view/view4.zip -d /vhs/kangle/nodewww/webftp/vhost/view
echo -e "\033[32m Vhost用户前台模板已更换完毕-番茄黑模板(如模板显示有异常请在3312后台清除模板缓存，清除本地浏览器缓存后重试) \033[0m"
}
function Install_view_vhost5(){
rm -rf /vhs/kangle/nodewww/webftp/vhost/view/*;wget -P /vhs/kangle/nodewww/webftp/vhost/view ${START}/install/view/vhost/view5.zip -e http_proxy=${IP};unzip /vhs/kangle/nodewww/webftp/vhost/view/view5.zip -d /vhs/kangle/nodewww/webftp/vhost/view
echo -e "\033[32m Vhost用户前台模板已更换完毕-YDHostV3(如模板显示有异常请在3312后台清除模板缓存，清除本地浏览器缓存后重试) \033[0m"
}
function Install_view_vhost6(){
rm -rf /vhs/kangle/nodewww/webftp/vhost/view/*;wget -P /vhs/kangle/nodewww/webftp/vhost/view ${START}/install/view/vhost/view6.zip -e http_proxy=${IP};unzip /vhs/kangle/nodewww/webftp/vhost/view/view6.zip -d /vhs/kangle/nodewww/webftp/vhost/view
echo -e "\033[32m Vhost用户前台模板已更换完毕-猫儿EP模板(如模板显示有异常请在3312后台清除模板缓存，清除本地浏览器缓存后重试) \033[0m"
}
function Install_view_admin1(){
rm -rf /vhs/kangle/nodewww/webftp/admin/view/*;wget -P /vhs/kangle/nodewww/webftp/admin/view ${START}/install/view/admin/admin1.zip -e http_proxy=${IP};unzip /vhs/kangle/nodewww/webftp/admin/view/admin1.zip -d /vhs/kangle/nodewww/webftp/admin/view/
echo -e "\033[32m Admin主机后台模板已更换完毕-飞鱼Kangle一键脚本默认后台模板(如模板显示有异常请在3312后台清除模板缓存，清除本地浏览器缓存后重试)
注意！！！如果您更换了后台模板，请在更换完毕后，到3311后台页面，配置菜单里，修改管理账号密码，或者输入原来的重新保存一次，以免更换完后台模板后3312后台登不进！ \033[0m"
}
function Install_view_admin2(){
rm -rf /vhs/kangle/nodewww/webftp/admin/view/*;wget -P /vhs/kangle/nodewww/webftp/admin/view ${START}/install/view/admin/admin2.zip -e http_proxy=${IP};unzip /vhs/kangle/nodewww/webftp/admin/view/admin2.zip -d /vhs/kangle/nodewww/webftp/admin/view/
echo -e "\033[32m Admin主机后台模板已更换完毕-仿狐狸后台模板(如模板显示有异常请在3312后台清除模板缓存，清除本地浏览器缓存后重试)
注意！！！如果您更换了后台模板，请在更换完毕后，到3311后台页面，配置菜单里，修改管理账号密码，或者输入原来的重新保存一次，以免更换完后台模板后3312后台登不进！ \033[0m"
}
function Install_kangle(){
echo -n "请设置您的MySQL数据库密码(不设置则为fylao.com):"
	read mysql_p  
	if [[ $mysql_p == "" ]]
	 then 
		export mysql_passwd="fylao.com"
	 else
		export mysql_passwd="${mysql_p}"
	fi
echo "timeout=120" >> /etc/yum.conf
rm -rf /etc/yum.repos.d/*
wget ${START}/install/yum/Centos-6-install.repo -O /etc/yum.repos.d/CentOS6.repo -e http_proxy=${IP}
rm -rf /etc/yum.repos.d/*pel.repo
rm -rf /etc/yum.repos.d/epel-testing.repo
yum -y install epel-release
sudo sed -e 's!^mirrorlist=!#mirrorlist=!g' \
         -e 's!^#baseurl=!baseurl=!g' \
         -e 's!//download\.fedoraproject\.org/pub!//mirrors.ustc.edu.cn!g' \
         -e 's!http://mirrors\.ustc!https://mirrors.ustc!g' \
         -i /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel-testing.repo
wget ${START}/install/mysql/mysql-community-release-el6.rpm -O /root/mysql-community-release-el6.rpm -e http_proxy=${IP}
rpm -ivh /root/mysql-community-release-el6.rpm --nodeps --force
rm -rf /etc/yum.repos.d/mysql-community.repo
rm -rf /etc/yum.repos.d/mysql-community-source.repo
wget ${START}/install/mysql/mysql-community.repo -O /etc/yum.repos.d/mysql-community.repo -e http_proxy=${IP}
wget ${START}/install/mysql/mysql-community-source.repo -O /etc/yum.repos.d/mysql-community-source.repo -e http_proxy=${IP}
yum -y install which file wget make automake gcc gcc-c++ pcre-devel zlib-devel openssl-devel sqlite-devel quota unzip bzip2 libaio-devel
ulimit -n 1048576
echo "* soft nofile 1048576" >> /etc/security/limits.conf
echo "* hard nofile 1048576" >> /etc/security/limits.conf
wget ${START}/install/e.sh -O e.sh -e http_proxy=${IP};sh e.sh /vhs/kangle
wget ${START}/install/ep.sh -O ep.sh -e http_proxy=${IP};sh ep.sh
ln -s /etc/init.d/kangle /bin/kangle
echo -e "\033[32m Kangle主程序已安装完毕 \033[0m"
}
function Install_libevent(){
wget -d ${START}/install/libevent-2.0.21-stable.tar.gz -e http_proxy=${IP}
tar zxf libevent-2.0.21-stable.tar.gz
cd libevent-2.0.21-stable
./configure
make -s -j 4
make -s install
ln -s /usr/local/lib/libevent-2.0.so.5 /usr/lib/libevent-2.0.so.5
ln -s /usr/local/lib/libevent-2.0.so.5.1.9 /usr/lib/libevent-2.0.so.5.1.9
ln -s /usr/lib/libevent-2.0.so.5 /usr/local/lib/libevent-2.0.so.5
ln -s /usr/lib/libevent-2.0.so.5.1.9 /usr/local/lib/libevent-2.0.so.5.1.9
cd ..
echo -e "\033[32m Libevent服务器高并发库已安装完毕 \033[0m"
}
function Install_memcached(){
yum -y install memcached php-pecl-memcache
yum -y install php-pecl-apc
rm -rf /etc/sysconfig/memcached
wget -d ${START}/install/memcached -O /etc/sysconfig/memcached -e http_proxy=${IP}
service memcached start
chkconfig --level 2345 memcached on
echo -e "\033[32m Memached高性能分布式内存对象缓存系统已安装完毕 \033[0m"
}
function Install_safedog(){
echo "127.0.0.1 download.safedog.cn" >> /etc/hosts
setenforce 0 && sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
wget -d ${START}/install/safedog_linux64.tar.gz -e http_proxy=${IP}
tar xzf safedog_linux64.tar.gz
cd safedog_linux64
chmod -R 777 install.py
./install.py
sdcmd webflag 0
sdcmd twreuse 1
sdcmd sshddenyflag 1
cd ..
echo -e "\033[32m Safedog安全狗已安装完毕(已开启ssh端口防爆破) \033[0m"
}
function Install_mysql(){
echo -n "请设置您的MySQL数据库密码(不设置则为fylao.com):"
	read mysql_p  
	if [[ $mysql_p == "" ]]
	 then 
		export mysql_passwd="fylao.com"
	 else
		export mysql_passwd="${mysql_p}"
	fi
echo "timeout=120" >> /etc/yum.conf
wget ${START}/install/mysql/mysql-community-release-el6.rpm -O /root/mysql-community-release-el6.rpm -e http_proxy=${IP}
rpm -ivh /root/mysql-community-release-el6.rpm --nodeps --force
rm -rf /etc/yum.repos.d/mysql-community.repo
rm -rf /etc/yum.repos.d/mysql-community-source.repo
wget ${START}/install/mysql/mysql-community.repo -O /etc/yum.repos.d/mysql-community.repo -e http_proxy=${IP}
wget ${START}/install/mysql/mysql-community-source.repo -O /etc/yum.repos.d/mysql-community-source.repo -e http_proxy=${IP}
yum -y install which file wget make automake gcc gcc-c++ pcre-devel zlib-devel openssl-devel sqlite-devel quota unzip bzip2 libaio-devel
ulimit -n 1048576
echo "* soft nofile 1048576" >> /etc/security/limits.conf
echo "* hard nofile 1048576" >> /etc/security/limits.conf
yum -y install mysql-server
	if [ $? != 0 ] ; then
			exit $?
	fi
/etc/init.d/mysqld start
/usr/bin/mysqladmin -u root password $mysql_passwd
		if [ $? != 0 ] ; then
				exit $?
		else
 				echo "mysql-server is install success"
		fi
chkconfig mysqld on
rm -rf /etc/my.cnf
wget ${START}/install/mysql/my.cnf -O /etc/my.cnf
service mysqld restart
echo -e "\033[32m Mysql5.6数据库已安装完毕 \033[0m"
}
function Install_phpall(){
wget ${START}/install/php/tpl_php5217.sh -O tpl_php5217.sh -e http_proxy=${IP};sh tpl_php5217.sh
wget ${START}/install/php/tpl_php5445.sh -O tpl_php5445.sh -e http_proxy=${IP};sh tpl_php5445.sh
wget ${START}/install/php/tpl_php5538.sh -O tpl_php5538.sh -e http_proxy=${IP};sh tpl_php5538.sh
wget ${START}/install/php/tpl_php5640.sh -O tpl_php5640.sh -e http_proxy=${IP};sh tpl_php5640.sh
wget ${START}/install/php/tpl_php7033.sh -O tpl_php7033.sh -e http_proxy=${IP};sh tpl_php7033.sh
wget ${START}/install/php/tpl_php7130.sh -O tpl_php7130.sh -e http_proxy=${IP};sh tpl_php7130.sh
wget ${START}/install/php/tpl_php7220.sh -O tpl_php7220.sh -e http_proxy=${IP};sh tpl_php7220.sh
wget ${START}/install/php/tpl_php730.sh -O tpl_php730.sh -e http_proxy=${IP};sh tpl_php730.sh
echo -e "\033[32m PHP5.2.17-7.3.0已安装完毕 \033[0m"
}
function Install_php5217(){
wget ${START}/install/php/tpl_php5217.sh -O tpl_php5217.sh -e http_proxy=${IP};sh tpl_php5217.sh	
echo -e "\033[32m PHP5.2.17已安装完毕 \033[0m"
}
function Install_php5445(){
wget ${START}/install/php/tpl_php5445.sh -O tpl_php5445.sh -e http_proxy=${IP};sh tpl_php5445.sh
echo -e "\033[32m PHP5.4.45已安装完毕 \033[0m"
}
function Install_php5538(){
wget ${START}/install/php/tpl_php5538.sh -O tpl_php5538.sh -e http_proxy=${IP};sh tpl_php5538.sh
echo -e "\033[32m PHP5.5.38已安装完毕 \033[0m"
}
function Install_php5640(){
wget ${START}/install/php/tpl_php5640.sh -O tpl_php5640.sh -e http_proxy=${IP};sh tpl_php5640.sh
echo -e "\033[32m PHP5.6.40已安装完毕 \033[0m"
}
function Install_php7033(){
wget ${START}/install/php/tpl_php7033.sh -O tpl_php7033.sh -e http_proxy=${IP};sh tpl_php7033.sh
echo -e "\033[32m PHP7.0.33已安装完毕 \033[0m"
}
function Install_php7130(){
wget ${START}/install/php/tpl_php7130.sh -O tpl_php7130.sh -e http_proxy=${IP};sh tpl_php7130.sh
echo -e "\033[32m PHP7.1.30已安装完毕 \033[0m"
}
function Install_php7220(){
wget ${START}/install/php/tpl_php7220.sh -O tpl_php7220.sh -e http_proxy=${IP};sh tpl_php7220.sh
echo -e "\033[32m PHP7.2.20已安装完毕 \033[0m"
}
function Install_php730(){
wget ${START}/install/php/tpl_php730.sh -O tpl_php730.sh -e http_proxy=${IP};sh tpl_php730.sh
echo -e "\033[32m PHP7.3.0已安装完毕 \033[0m"
}
function Uninstall(){
wget ${START}/uninstall.sh -O uninstall.sh;sh uninstall.sh
}
function Resetpwd(){
	clear
	read -p "请输入Kangle管理员-新用户名：" ep_admin
	echo -e "\033[44;37m 你输入Kangle管理员-新用户名是：$ep_admin \033[0m"
	read -p "请输入Kangle管理员-新密码：" ep_passwd
	echo -e "\033[44;37m 你输入Kangle管理员-新密码是：$ep_passwd \033[0m"
	# passwdmd5=` echo -n '$ep_passwd'|md5sum|cut -d ' ' -f1 `
	nl /vhs/kangle/etc/config.xml | sed -i "s/admin user='.*' password='.*' a/admin user='$ep_admin' password='$ep_passwd' a/g" /vhs/kangle/etc/config.xml
	service kangle restart
	echo "Kangle管理员账户&密码已修改成功"
}
function Resql(){
	wget ${START}/iset.sh -O iset.sh;sh iset.sh
}
function First(){
clear
echo -e "╔═══════════════════════════════════════════════════╗
               \033[41;37m 欢迎使用飞鱼一键kangle综合脚本于[${UPTIME}]更新\033[0m                           
   ═════════════════════════════════════════
                        《感谢以下人员公益赞助》                                                   
              ----------------------------------------------------------                 
          1.高防服务器，高防cdn，就选数掘科技 www.gfvps.cn 【本脚本节点支持商】                  
          2.咖啡主机 专业国内外高防VPS提供商 www.cfhost.cn 【本脚本节点支持商】                  
          3.捷联网络-徐州高防BGP三线提供商jieidc.taobao.com【本脚本节点支持商】                 
          4.hzidc.taobao.com 景安/腾讯/阿里高级代理，超低优惠【本脚本节点支持商】                                  
             -----------------------------------------------------------                  
                 *****广告位50/月，如需请联系QQ:7803864*****                                            
╚═══════════════════════════════════════════════════╝ 

【拒绝】我不同意以上《须知》，按键Ctrl+Z直接退出...
【同意】我同意以上《须知》，按键回车(Enter)继续... 
"
read -p "你的选择？如同意,按键回车(Enter)继续... " i_think
echo -e " \033[42;37m你已接受使用须知\033[0m 
"
echo -e "\033[32m╔═══════════════════════════════════════════════════╗
              欢迎使用飞鱼一键kangle综合脚本于[${UPTIME}]更新                          
   ══════════════════════════════════════════════════
 请选择安装节点:
 1.默认节点
 2.备用节点
 0.退出程序                                           
╚═══════════════════════════════════════════════════╝\033[0m" 
read -p "请输入序号并回车:" mode
if [[ $mode == "0" ]]
	then 
	echo -e "退出程序：\033[32m退出\033[0m" ; 
	echo "程序正在退出...请稍后..." 
	Install_exit
	sleep 3	
	exit 
fi
if [[ $mode == "1" ]]
	then 
	echo -e "节点选择：\033[32m默认节点\033[0m" ; 
	export IP="${IP1}"
	Third
	sleep 1
fi
if [[ $mode == "2" ]]
	then 
	echo -e "节点选择：\033[32m备用节点\033[0m" ;  
	export IP="${IP2}"
	Third
	sleep 1
fi
if [[ $mode == "3" ]]
	then 
	echo -e "节点选择：\033[32m备用节点\033[0m" ;  
	export IP="${IP2}"
	Third
	sleep 1
fi
}
function Third(){
clear
echo -e "\033[32m 飞鱼Kangle一键脚本-主菜单
————————————————————————————————————————————————————
1. ◎ 安装全部 Kangle/Easypanel/PHP/Mysql/Libevent/Safedog
2. ◎ 单独安装组件 Kangle/Easypanel/PHP/Mysql/Libevent/Memached/Safedog
3. ◎ 程序升级更新 于[${UPTIME}]更新
4. ◎ 更换 Easypanel 模板(前台&后台)
5. ◎ 实用小程序(进程守护&日志清除&补丁)
6. ◎ 完全卸载Kangle
7. ◎ 重置MySQL数据库密码
8. ◎ 重置Kangle后台登录密码
0. ◎ 退出安装 \033[0m"
read -p "请输入序号并回车：" num
case "$num" in
[1] ) (Install_kangle;Install_libevent;Install_safedog;Install_phpall;Install_view_vhost1;Install_rm;Install_finish);;
[2] ) (Install_only);;
[3] ) (Install_update;Install_rm);;
[4] ) (Install_view);;
[5] ) (Install_tool);;
[6] ) (Uninstall);;
[7] ) (Resql);;
[8] ) (Resetpwd);;
[0] ) (Install_exit);;
*) (Third);;
esac
}
function Install_only(){
clear
echo -e "\033[32m 飞鱼Kangle一键脚本-单独安装
	说明：以下内容已经包含在'安装全部'里面
————————————————————————————————————————————————————
1. ◎ 只安装Kangel/EP主程序
2. ◎ 选择要安装的PHP版本
3. ◎ 运行安装 MySQL5.6
4. ◎ 运行安装 Libevent服务器高并发库
5. ◎ 运行安装 Memached高性能分布式内存对象缓存系统
6. ◎ 运行安装 Safedog安全狗
0. ◎ 返回上一级菜单 \033[0m"
read -p "请输入序号并回车：" num
case "$num" in
[1] ) (Install_kangle;Install_rm);;
[2] ) (Install_php);;
[3] ) (Install_mysql;Install_rm);;
[4] ) (Install_libevent;Install_rm);;
[5] ) (Install_memcached;Install_rm);;
[6] ) (Install_safedog;Install_rm);;
[0] ) (Third);;
*) (First);;
esac
}
function Install_php(){
clear
echo -e "\033[32m 飞鱼Kangle一键脚本-单独安装PHP
	说明：以下内容已经包含在'安装全部'里面
————————————————————————————————————————————————————
1. ◎ 自动安装/更新 PHP5.2.17-7.3.0
2. ◎ 自动安装/更新 PHP5.2.17
3. ◎ 自动安装/更新 PHP5.4.45
4. ◎ 自动安装/更新 PHP5.5.38
5. ◎ 自动安装/更新 PHP5.6.40
6. ◎ 自动安装/更新 PHP7.0.33
7. ◎ 自动安装/更新 PHP7.1.30
8. ◎ 自动安装/更新 PHP7.2.20
9. ◎ 自动安装/更新 PHP7.3.0
0. ◎ 返回上一级菜单 \033[0m"
read -p "请输入序号并回车：" num
case "$num" in
[1] ) (Install_phpall;Install_rm);;
[2] ) (Install_php5217;Install_rm);;
[3] ) (Install_php5445;Install_rm);;
[4] ) (Install_php5538;Install_rm);;
[5] ) (Install_php5640;Install_rm);;
[6] ) (Install_php7033;Install_rm);;
[7] ) (Install_php7130;Install_rm);;
[8] ) (Install_php7220;Install_rm);;
[9] ) (Install_php730;Install_rm);;
[0] ) (Install_only);;
*) (First);;
esac
}
function Install_view(){
clear
echo -e "\033[32m 飞鱼Kangle一键脚本-更换Easypanel模板
————————————————————————————————————————————————————
——————以下为EP前台模板——————
1. ◎ 前台默认模板
2. ◎ 经典商务类型
3. ◎ 基于原版美化
4. ◎ 番茄黑模板
5. ◎ 猫儿EP模板
——————以下为EP后台模板——————
a. ◎ 默认后台模板
b. ◎ 仿狐狸后台模板
0. ◎ 返回上一级菜单 \033[0m"
read -p "请输入序号并回车：" num
case "$num" in
[1] ) (Install_view_vhost1;Install_rm);;
[2] ) (Install_view_vhost2;Install_rm);;
[3] ) (Install_view_vhost3;Install_rm);;
[4] ) (Install_view_vhost4;Install_rm);;
[5] ) (Install_view_vhost6;Install_rm);;
[a] ) (Install_view_admin1;Install_rm);;
[b] ) (Install_view_admin2;Install_rm);;
[0] ) (Install_only);;
*) (First);;
esac
}
function Install_tool(){
clear
echo -e "\033[32m 飞鱼Kangle一键脚本-实用小程序
————————————————————————————————————————————————————
1. ◎ 虚拟主机用户前台泛绑定补丁
2. ◎ Mysql数据库守护进程
3. ◎ Kangle守护进程
4. ◎ 每日自动清除日志进程
5. ◎ 清除所有虚拟主机日志
6. ◎ 升级EP面板PHP版本以修复PHP DOS漏洞
0. ◎ 返回上一级菜单 \033[0m"
read -p "请输入序号并回车：" num
case "$num" in
[1] ) (Install_patch_domain;Install_rm);;
[2] ) (Install_cron_mysql;Install_rm);;
[3] ) (Install_cron_kangle;Install_rm);;
[4] ) (Install_cron_log;Install_rm);;
[5] ) (Rm_log;Install_rm);;
[6] ) (Upepphp;Install_rm);;
[0] ) (Third);;
*) (First);;
esac
}


First