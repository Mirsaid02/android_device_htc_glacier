#
# Copyright (C) 2011 The CyanogenMod Project
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

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/glacier/prebuilt/gps.conf:system/etc/gps.conf

# Build.prop additions
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril.v3=signalstrengthgsm

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# Dummy property to prevent handle_compcache from turnning swap off
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zram.default=18

DEVICE_PACKAGE_OVERLAYS += device/htc/glacier/overlay

# GPS
PRODUCT_PACKAGES += \
    gps.glacier

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml

# gsm config xml file
PRODUCT_COPY_FILES += \
    device/htc/glacier/prebuilt/voicemail-conf.xml:system/etc/voicemail-conf.xml

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/glacier/prebuilt/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/glacier/prebuilt/keylayout/glacier-keypad.kl:system/usr/keylayout/glacier-keypad.kl

# Keychars
PRODUCT_COPY_FILES += \
    device/htc/glacier/prebuilt/keychars/glacier-keypad.kcm.bin:system/usr/keychars/glacier-keypad.kcm.bin

# IDC Files
PRODUCT_COPY_FILES += \
    device/htc/glacier/prebuilt/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/glacier/prebuilt/idc/glacier-keypad.idc:system/usr/idc/glacier-keypad.idc \
    device/htc/glacier/prebuilt/idc/curcial-oj.idc:system/usr/idc/curcial-oj.idc \

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/glacier/prebuilt/firmware/bcm4329.hcd:system/vendor/firmware/bcm4329.hcd \
    device/htc/glacier/prebuilt/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/glacier/prebuilt/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/glacier/prebuilt/firmware/default_org_WA.acdb:system/etc/firmware/default_org_WA.acdb

# device specific props
$(call inherit-product-if-exists, vendor/htc/glacier/device-vendor.mk)

# htc audio settings
$(call inherit-product, device/htc/glacier/media_htcaudio.mk)
$(call inherit-product, device/htc/glacier/media_a1026.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

PRODUCT_NAME := htc_glacier
PRODUCT_DEVICE := glacier
