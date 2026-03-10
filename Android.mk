# Set Local_path
LOCAL_PATH := $(call my-dir)

# Check if target device is codename vienna
ifeq ($(TARGET_DEVICE),vienna)
    include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
