#!/bin/bash
#
# 删除dir目录下大于10M(10485760字节)的文件
# 需要管理员身份运行
#
dir=/var/log/

echo "----------------------------"
echo "开启自启脚本：autoClean.sh"
echo "在/etc/profile.d/目录下"

for file in `ls -l ${dir} | awk '{ print $9 }'`
do
        size=`ls -l ${dir}${file} | awk '{ print $5 }'`
        echo "file:$file -- size:$size"

        len=${#size}
        echo "len:$len"

        if [ $len -ge 8 ]
        then
                str=${file:0:6}
                if [ "$str" = "syslog" ]
                then
                        echo "delete ${dir}${file}"
                        rm -rf ${dir}${file}
                else
                        echo "--pass this file:${dir}${file}"
                        continue
                fi
        fi
done





