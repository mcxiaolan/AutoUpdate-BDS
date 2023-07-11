#!/bin/bash
clear
echo "安装 jq"
apt install jq -y
echo "将地图、白名单、日志、权限名单、服务器配置文件压缩到 backup.zip 并移动到上一个文件夹"
zip -o -r ../backup.zip allowlist.json Dedicated_Server.txt permissions.json server.properties worlds/
echo "删除服务器目录下的所有文件……"
rm -rf *
clear

LATEST_VERSION=`curl -s https://cdn.jsdelivr.net/gh/Bedrock-OSS/BDS-Versions/versions.json | jq -r '.linux.stable'`

echo "最新的 Linux BDS 版本: [${LATEST_VERSION}]"
echo "下载最新版本的 BDS……"

wget -O BDS.zip https://minecraft.azureedge.net/bin-linux/bedrock-server-${LATEST_VERSION}.zip

echo "正在解压最新版本的 BDS……"
unzip -q -o BDS.zip && rm BDS.zip
clear
echo "恢复备份文件……"
unzip -o -d . ../backup.zip

echo "恢复完毕！岚天呀随手搓的脚本(*/ω＼*)"
echo "感谢 https://github.com/Bedrock-OSS/BDS-Versions 提供获取最新版本支持！"
echo "岚天呀的博客: https://blog.ltya.top"
exit
