LOCAL_PATH := $(call my-dir)

ifeq ($(PRODUCT_DEVICE),glacier)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
