#!/bin/bash

echo -e "\033[32m [OK] \033[0m正在停止服务中..."

# 检查文件是否存在
if [ ! -f "/Library/LaunchDaemons/de.bernhard-baehr.sleepwatcher.plist" ]
then
    # 第一个分支：文件不存在
    which "brew" > /dev/null
    if [ $? -eq 0 ]
    then
        if ps -ef | grep "sleepwatcher" | egrep -v grep > /dev/null
        then
            brew services stop sleepwatcher
            echo -e "\033[32m [OK] \033[0m服务已停止..."
        fi
        echo -e "\033[32m [OK] \033[0m正在卸载中..."
        brew uninstall sleepwatcher
        brew uninstall blueutil
        echo -e "\033[32m [OK] \033[0m卸载完成..."
    else
        echo -e "\033[31m [ERROR] \033[0m未安装 Homebrew，无法继续操作！"
    fi
else
    # 第二个分支：文件存在
    sudo launchctl unload /Library/LaunchDaemons/de.bernhard-baehr.sleepwatcher.plist
    sudo launchctl kill sleepwatcher
    echo -e "\033[32m [OK] \033[0m服务已停止..."
    sudo rm -rf /Library/LaunchDaemons/de.bernhard-baehr.sleepwatcher.plist
    sudo rm -rf /usr/local/sbin/sleepwatcher
    sudo rm -rf /usr/local/bin/blueutil
    sudo rm -rf /usr/local/share/man/man8/sleepwatcher.8
fi

echo -e "\033[32m [OK] \033[0m正在清理残余文件中..."
cd ~
sudo rm -rf .sleep
sudo rm -rf .wakeup
echo -e "\033[32m [OK] \033[0m清理完毕..."