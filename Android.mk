# maintained by ChimpanziCloud (boii ts tuff)
# chances of working:0.1%

# recovery tree path
LOCAL_PATH := $(call my-dir)

# checks if target device is vienna ( motorola edge 50 neo)
ifeq ($(TARGET_DEVICE),vienna)
    include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif
