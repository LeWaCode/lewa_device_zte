#Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/common/gps/gps_cn_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/zte/n880/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := zte_n880
PRODUCT_DEVICE := n880
PRODUCT_MODEL := ZTE-C N880

#add Gallery3D by shenqi 1214
PRODUCT_PACKAGES += \
    librs_jni \
    gralloc.n880 \
    copybit.n880 \
    gps.n880 \
    sensors.n880 \
    libOmxCore \
    libOmxVidEnc \
    abtfilt \
    prox_cal \
    dexpreopt


#liuhao removed, use PicFolder.apk 
#    Gallery3D \

#    Term \
#    LiveWallpapers \
#    LiveWallpapersPicker \
#    VisualizationWallpapers \
#    MagicSmokeWallpapers \
#    VisualizationWallpapers \
#    SpareParts \
#    Development \

# proprietary side of the device
$(call inherit-product-if-exists, vendor/zte/n880/n880-vendor.mk)

DISABLE_DEXPREOPT := false

PRODUCT_COPY_FILES += \
    device/zte/n880/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/zte/n880/n880_keypad.kl:system/usr/keylayout/n880_keypad.kl

# fstab
PRODUCT_COPY_FILES += \
    device/zte/n880/vold.fstab:system/etc/vold.fstab

# apns-conf.xml
#PRODUCT_COPY_FILES += \
#    device/common/apn/apns-conf.xml:system/etc/apns-conf.xml

# Init
PRODUCT_COPY_FILES += \
    device/zte/n880/init.n880.rc:root/init.blade.rc \
    device/zte/n880/ueventd.n880.rc:root/ueventd.blade.rc

# Audio
PRODUCT_COPY_FILES += \
    device/zte/n880/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/zte/n880/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# WLAN + BT
PRODUCT_COPY_FILES += \
    device/zte/n880/init.bt.sh:system/etc/init.bt.sh \
    device/zte/n880/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/zte/n880/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/zte/n880/prebuilt/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    device/zte/n880/prebuilt/init.wlanprop.sh:system/etc/init.wlanprop.sh

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

#Kernel Modules
PRODUCT_COPY_FILES += \
    device/zte/n880/prebuilt/dhd.ko:system/lib/modules/dhd.ko \
    device/zte/blade/prebuilt/cifs.ko:system/lib/modules/2.6.35.7-perf+/cifs.ko \
    device/zte/n880/prebuilt/zram.ko:system/lib/modules/2.6.35.7-perf+/zram.ko \
    device/zte/blade/prebuilt/lzo_compress.ko:system/lib/modules/2.6.35.7-perf+/lzo_compress.ko \
    device/zte/blade/prebuilt/lzo_decompress.ko:system/lib/modules/2.6.35.7-perf+/lzo_decompress.ko

#WiFi firmware
PRODUCT_COPY_FILES += \
    device/zte/n880/firmware/BCM4329B1_002.002.023.0735.0754.hcd:system/etc/BCM4329B1_002.002.023.0735.0754.hcd \
    device/zte/n880/firmware/fw_4319.bin:system/etc/fw_4319.bin \
    device/zte/n880/firmware/fw_4319_apsta.bin:system/etc/fw_4319_apsta.bin \
    device/zte/n880/firmware/fw_4329.bin:system/etc/fw_4329.bin \
    device/zte/n880/firmware/fw_4329_apsta.bin:system/etc/fw_4329_apsta.bin\
    device/zte/n880/firmware/nv_4319.txt:system/etc/nv_4319.txt \
    device/zte/n880/firmware/nv_4329.txt:system/etc/nv_4329.txt 



#Media profile
PRODUCT_COPY_FILES += \
    device/zte/n880/media_profiles.xml:system/etc/media_profiles.xml
    
PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.media.dec.jpeg.memcap=20000000

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=120 \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    ro.sf.hwrotation=180 \
    persist.sys.use_16bpp_alpha=0

# n880 only use two language for lewa branch
PRODUCT_LOCALES := zh_CN en_US

# n880 uses high-density artwork where available
PRODUCT_LOCALES += hdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# This should not be needed but on-screen keyboard uses the wrong density without it.
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.sf.lcd_density=240 

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=10 \
    ro.build.baseband_version=N880B01 \
    persist.sys.language=zh \
    persist.sys.country=CN \
    persist.sys.timezone=Asia/Shanghai \
    ro.telephony.default_network=4 \
    ro.telephony.call_ring.multiple=false \
    ro.config.cdma_subscription=0 \
    ril.subscription.types=RUIM,NV \
    ro.cdma.home.operator.numeric=46003 \
    ro.cdma.home.operator.alpha=中国电信 \
    ro.cdma.voicemail.number=*86 \
    persist.sys.timezone=Asia/Shanghai

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.heapsize=48m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    ro.opengles.version=131072  \
    ro.compcache.default=0

PRODUCT_PROPERTY_OVERRIDES += \
    ro.lewa.swapper.part_path=/dev/block/mmcblk0p3
	
# add for error report  by shenqi ,move to vendor/cyanogen/common/common.mk

# added by ioz9 2012-03-03
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.hwfeature_wakeupkey=3 \
    ro.config.hw_menu_unlockscreen=true
