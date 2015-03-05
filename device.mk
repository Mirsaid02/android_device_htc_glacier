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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# device specific props
$(call inherit-product-if-exists, vendor/htc/glacier/device-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/A1026_CFG.csv:system/etc/A1026_CFG.csv \
    $(LOCAL_PATH)/configs/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    $(LOCAL_PATH)/configs/AdieHWCodec_WA.csv:system/etc/AdieHWCodec_WA.csv \
    $(LOCAL_PATH)/configs/AudioBTID.csv:system/etc/AudioBTID.csv \
    $(LOCAL_PATH)/configs/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    $(LOCAL_PATH)/keylayout/glacier-keypad.kl:system/usr/keylayout/glacier-keypad.kl

# Keychars
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keychars/glacier-keypad.kcm.bin:system/usr/keychars/glacier-keypad.kcm.bin

# IDC Files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    $(LOCAL_PATH)/idc/glacier-keypad.idc:system/usr/idc/glacier-keypad.idc \
    $(LOCAL_PATH)/idc/curcial-oj.idc:system/usr/idc/curcial-oj.idc \

# Firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/firmware/bcm4329.hcd:system/vendor/firmware/bcm4329.hcd \
    $(LOCAL_PATH)/firmware/default.acdb:system/etc/firmware/default.acdb \
    $(LOCAL_PATH)/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    $(LOCAL_PATH)/firmware/default_org_WA.acdb:system/etc/firmware/default_org_WA.acdb

# Prop additions
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20 \
    ro.zram.default=18

# TWRP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/etc/twrp.fstab:recovery/root/etc/twrp.fstab \

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)
