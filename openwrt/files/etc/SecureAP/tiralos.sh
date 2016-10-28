#! /bin/sh
for i in `iwinfo wlan0  assoclist | sed 's/\s.*$//' `
do
ubus call hostapd.wlan0 del_client '{"addr":"'"$i"'", "reason":1, "deauth":true, "ban_time": 100}'
sleep 2
done

