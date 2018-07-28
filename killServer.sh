#!/bin/bash


USER=$(whoami)
#获取对应应用程序的PID  进程号
pid=$(ps -u $USER | grep keymngserver | awk {'print $1'})
#echo $pid


#-z 判断$pid是否为空 长度是否为零
if [  -z $pid ] 
then
    echo "密钥协商服务端没有启动"
else
    kill -10 $pid
fi

exit 0

