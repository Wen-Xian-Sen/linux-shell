#! /bin/bash

historyDir=/home/firefly/shell/test/ #指定需要删除的文件的路径

today=$(date +%Y-%m-%d) #当前日期

echo "------------------------------------"
echo "开机自动脚本"
echo "在/etc/profile.d/目录下"
echo "---------today is $today-----------"

tt=`date -d "6 second ago" +%s`  #保存7 days之前的时间值

echo "next is to delete release before $tt"

for file in ${historyDir}*
do
        name=`basename $file`

        #echo "file name : $name"  #打印文件名

        file_date=`date -r ${historyDir}${name} +%s` #保存文件时间值

	#echo "file date : $file_date" #打印文件日期

        if [ $file_date -le $tt ] #比较文件时间值和7 days之前时间值
            then
		str=${name:0:16}
		echo $str
                if [ "$str" = "plc-gateway.log." ]    
	    	then
                        echo " delete ${historyDir}$name-------"
                        rm -rf ${historyDir}${name}  #删除命令
                else
                        echo --pass this file : $name
                        continue;
		fi
        fi
done



