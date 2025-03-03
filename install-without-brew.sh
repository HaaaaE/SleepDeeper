#!/bin/bash
echo -e "\033[36m [Info] \033[0m蓝牙控制服务安装中..."
echo -e "\033[36m [Info] \033[0m我们需要root权限来修改一些配置文件，请授权..."

# 安装 blueutil
sudo cp ./blueutil/2.7.0/bin/blueutil /usr/local/bin/
sudo chmod +x /usr/local/bin/blueutil
blueutil -p
echo -e "\033[32m [OK] \033[0m蓝牙控制服务安装完成..."

echo -e "\033[36m [Info] \033[0m睡眠监听服务安装中..."
# 安装 sleepwatcher
sudo mkdir -p /usr/local/sbin /usr/local/share/man/man8
sudo cp ./sleepwatcher/2.2.1/sbin/sleepwatcher /usr/local/sbin
sudo cp ./sleepwatcher/2.2.1/share/man/man8/sleepwatcher.8 /usr/local/share/man/man8
sudo chmod +x /usr/local/sbin/sleepwatcher
/usr/local/sbin/sleepwatcher --version
echo -e "\033[32m [OK] \033[0m睡眠监听服务安装完成..."

# 配置 .sleep 和 .wakeup 脚本
cd ~
sudo rm -f .sleep .wakeup
touch .sleep .wakeup

# 获取 Wi-Fi 接口名称
WIFI_INTERFACE=$(networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}')

# 生成 .sleep 脚本
cat > .sleep <<EOF
#!/bin/bash
export BLUEUTIL_ALLOW_ROOT=1 
/usr/local/bin/blueutil -p 0
/usr/sbin/networksetup -setairportpower $WIFI_INTERFACE off
EOF

# 生成 .wakeup 脚本
cat > .wakeup <<EOF
#!/bin/bash
export BLUEUTIL_ALLOW_ROOT=1 
/usr/local/bin/blueutil -p 1
until /usr/sbin/networksetup -getairportpower $WIFI_INTERFACE | grep On > /dev/null
do
    /usr/sbin/networksetup -setairportpower $WIFI_INTERFACE on
    sleep 1
done
EOF

# 设置脚本权限
sudo chmod 755 .sleep .wakeup
sudo chown root:wheel .sleep .wakeup  # 确保 root 可执行

# 生成 .plist 文件
USERNAME=$(whoami)
USER_HOME="/Users/$USERNAME"
PLIST_PATH="/Library/LaunchDaemons/de.bernhard-baehr.sleepwatcher.plist"

sudo bash -c "cat > $PLIST_PATH <<EOF
<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
<dict>
    <key>Label</key>
    <string>de.bernhard-baehr.sleepwatcher</string>
    <key>UserName</key>
    <string>root</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/local/sbin/sleepwatcher</string>
        <string>-V</string>
        <string>-s</string>
        <string>$USER_HOME/.sleep</string>
        <string>-w</string>
        <string>$USER_HOME/.wakeup</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
</dict>
</plist>
EOF"

# 设置 .plist 权限并加载服务
sudo chmod 644 "$PLIST_PATH"
sudo launchctl unload "$PLIST_PATH" 2>/dev/null  # 卸载旧服务（如果存在）
sudo launchctl load "$PLIST_PATH"
echo -e "\033[32m [OK] \033[0m服务已启动"
echo -e "==============="
echo -e "\033[31m > 首次使用，请睡眠后唤醒检查程序是否起效; 若在唤醒后弹出蓝牙权限请求，请允许权限并重复睡眠-唤醒进行测试。\033[0m"