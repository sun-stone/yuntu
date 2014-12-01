#!/bin/sh
# (C) dragon, www.bdmod.com
# Relevant permission is granted to Sunstone.


currVersion=`cat /opt/app/appinstalled/700 | grep plugin_VersionCode | cut -d ":" -f2 | sed 's/ //g'`

wwwVersion=`wget -q -O - http://xcloud.bdmod.com/YunTu/version.php | sed 's/ //g'`

if [ "$wwwVersion" = "" ]; then
	exit 0
fi

if [ $wwwVersion -gt $currVersion ]; then
	wwwVersionName=$(echo $wwwVersion | cut -c1-2 | awk '{print int($0)}')'.'$(echo $wwwVersion | cut -c3-4 | awk '{print int($0)}')'.'$(echo $wwwVersion | cut -c5-6 | awk '{print int($0)}')'.'$(echo $wwwVersion | cut -c7-8 | awk '{print int($0)}')
	echo $wwwVersionName
else
	echo "no"
fi
