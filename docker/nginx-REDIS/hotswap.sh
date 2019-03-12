#!/usr/bin/env bash
set -e

current=`awk '/6379/{print $2}' /etc/nginx/nginx.conf | awk -F ":" '/6379/{print $1}'`
str=$1

if [ "$1" != "$current" ]
then
        sed -i "/6379/s/$current/$str/g" /etc/nginx/nginx.conf
	/usr/sbin/nginx -s reload
else
        echo "Error: $str is already in use"
fi
