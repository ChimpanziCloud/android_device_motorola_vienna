# android device info (duh)
PRODUCT_DEVICE := vienna
PRODUCT_NAME := twrp_vienna
PRODUCT_MODEL := XT2409-3
PRODUCT_BRAND := motorola
PRODUCT_MANUFACTURER := motorola

# Default device path for the device tree
DEVICE_PATH := device/$(PRODUCT_BRAND)/$(PRODUCT_NAME)
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/motorola/vienna/recovery/root,recovery/root)

#inherited wealth
$(call inherit-product, vendor/twrp/config/common.mk)
$(call inherit-product, device/motorola/vienna/device.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

# Define the base for GMS client ID
PRODUCT_GMS_CLIENTID_BASE := android-motorola
