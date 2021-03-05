#!/bin/bash
#
# 删除dir目录下大于10M(10485760字节)的文件
# 需要管理员身份运行
#
dir=/home/firefly/shell/

echo "----------------------------"
echo "开启自启脚本：autoClean.sh"
echo "在/etc/profile.d/目录下"
for file in `ls -l $dir | awk '{ print $9 }'`
do 	
	size=`ls -l ${dir}/${file} | awk '{ printf $5 }'`
	echo "file : $file size : $size" 
	if [ $size -gt 10485760 ]
	then
		echo "delete $file"
		rm -rf ${dir}${file}
	fi
done





