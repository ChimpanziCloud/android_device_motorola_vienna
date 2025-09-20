# Release name
PRODUCT_RELEASE_NAME := vienna

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

#Inherit some common twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Inherit from device
$(call inherit-product, device/motorola/$(PRODUCT_RELEASE_NAME)/device.mk)

# Assert
TARGET_OTA_ASSERT_DEVICE := $(PRODUCT_RELEASE_NAME)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/motorola/$(PRODUCT_RELEASE_NAME)/recovery/root,recovery/root)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vienna_g_sys-user 14 U4UIS34M.8-40-1-1 58212 release-keys"

BUILD_FINGERPRINT := motorola/vienna_g_sys/vienna:14/U4UIS34M.8-40-1-1/58212:user/release-keys

PRODUCT_DEVICE := $(PRODUCT_RELEASE_NAME)
PRODUCT_NAME := twrp_$(PRODUCT_RELEASE_NAME)
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola edge 50 neo
PRODUCT_MANUFACTURER := motorola
PRODUCT_GMS_CLIENTID_BASE := android-motorola