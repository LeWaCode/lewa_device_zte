#!/system/bin/sh

chmod 755 /system/wifi/*.sh
setprop wifi.interface eth0
setprop wifi.chip.type BCM_4319
setprop bt.chip.type BCM_2070
setprop ro.tether.denied false

