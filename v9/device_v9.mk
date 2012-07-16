# Copyright (C) 2009 The Android Open Source Project
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

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/zte/v9/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := zte_v9
PRODUCT_DEVICE := v9
PRODUCT_MODEL := ZTE V9

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    Gallery3d \
    SpareParts \
    Development \
    Term \
    gralloc.v9 \
    copybit.v9 \
    gps.v9 \
    lights.v9 \
    sensors.v9 \
    libOmxCore \
    libOmxVidEnc \
    FM \
    V9Parts \
    abtfilt \
    dexpreopt

# proprietary side of the device
$(call inherit-product-if-exists, vendor/zte/v9/v9-vendor.mk)

DISABLE_DEXPREOPT := false

PRODUCT_COPY_FILES += \
    device/zte/v9/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/zte/v9/v9-keypad.kl:system/usr/keylayout/v9-keypad.kl

# fstab
PRODUCT_COPY_FILES += \
    device/zte/v9/vold.fstab:system/etc/vold.fstab

# Init
PRODUCT_COPY_FILES += \
    device/zte/v9/init.v9.rc:root/init.v9.rc \
    device/zte/v9/ueventd.v9.rc:root/ueventd.v9.rc

# Audio
PRODUCT_COPY_FILES += \
    device/zte/v9/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/zte/v9/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# WLAN + BT
PRODUCT_COPY_FILES += \
    device/zte/v9/init.bt.sh:system/etc/init.bt.sh \
    device/zte/v9/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/zte/v9/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/zte/v9/prebuilt/hostapd:system/bin/hostapd \
    device/zte/v9/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

#Kernel Modules
PRODUCT_COPY_FILES += \
    device/zte/v9/prebuilt/ar6000.ko:system/wifi/ar6000.ko \
    device/zte/v9/prebuilt/tun.ko:system/lib/modules/tun.ko

#WiFi firmware
PRODUCT_COPY_FILES += \
    device/zte/v9/firmware/regcode:system/wifi/regcode \
    device/zte/v9/firmware/data.patch.hw2_0.bin:system/wifi/data.patch.hw2_0.bin \
    device/zte/v9/firmware/athwlan.bin.z77:system/wifi/athwlan.bin.z77 \
    device/zte/v9/firmware/athtcmd_ram.bin:system/wifi/athtcmd_ram.bin \
    device/zte/v9/firmware/device.bin:system/wifi/device.bin \
    device/zte/v9/firmware/eeprom.bin:system/wifi/eeprom.bin \
    device/zte/v9/firmware/eeprom.data:system/wifi/eeprom.data

#Media profile
PRODUCT_COPY_FILES += \
    device/zte/v9/media_profiles.xml:system/etc/media_profiles.xml

# V9 uses medium-density artwork where available
PRODUCT_LOCALES += mdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

