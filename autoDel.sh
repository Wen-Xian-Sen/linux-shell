#! /bin/bash

#指定需要删除的文件的路径
historyDir=/home/firefly/plc-gateway/bin/ 

today=$(date +%Y-%m-%d) #当前日期

echo "-------shell file auto start-------"
echo "----shell file :/etc/profile.d/---- "
echo "---------today is $today-----------"

#保存7 days之前的时间值
tt=`date -d "7 days ago" +%s`  

echo "next is to delete release before $tt"

for file in ${historyDir}*
do
        name=`basename $file`

        #打印文件名
		#echo "file name : $name"  
		#保存文件修改时间值
        file_date=`date -r ${historyDir}${name} +%s` 
		#打印文件日期
		#echo "file date : $file_date" 

        if [ $file_date -le $tt ] #比较文件时间值和7 days之前时间值
            then
			    #跳过不需要删除的文件
                if [[ $name == "add-eth-static" || $name == "autoDel.sh" || $name == "add-wifi-connection" || $name == "deviceConfig.txt" || $name == "deviceInfo.txt" || $name == "keystore.p12" || $name == "plc-gateway" || $name == "plc-gateway.bat" || $name == "plc-gateway.log" ]]
                    then
                        echo --pass this file : $name
                        continue;
                else
                        echo " delete $name-------"
                        rm -rf ${historyDir}${name} 
                fi
        fi
done


