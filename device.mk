# ========================================
# Variables
# ========================================
LOCAL_PATH := device/motorola/vienna
DEVICE_PATH := device/motorola/vienna

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Device uses virtual_ab ota updates
ENABLE_VIRTUAL_AB := true

# Device software versions at launch
PRODUCT_TARGET_VNDK_VERSION := 34
BOARD_SHIPPING_API_LEVEL := 34
PRODUCT_SHIPPING_API_LEVEL := 34

# Device-specific variables
PRODUCT_PLATFORM := mt6878
PRODUCT_BOARD := mgvi_64_ww_armv82

# ========================================
# OTA updates config
# ========================================
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    system \
    vendor \
    product \
    boot
    
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_verifier

# OTA keys
PRODUCT_EXTRA_RECOVERY_KEYS += $(DEVICE_PATH)/security/ota

# ========================================
# Recovery HAL(s)
# ========================================
# FastbootD Implementation
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Bootctrl HAL
PRODUCT_PACKAGES += \
    bootctrl.mt6878 \
    bootctrl.mt6878.recovery

# ========================================
# Decryption HAL(s)
# ========================================
# Keystore2 HAL
PRODUCT_PACKAGES += \
    android.system.keystore2

# Keymint HAL
PRODUCT_PACKAGES += \
    android.hardware.security.keymint \
    android.hardware.security.secureclock \
    android.hardware.security.sharedsecret

# Gatekeeper HAL
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

RECOVERY_LIBRARY_SOURCE_FILES += $(TARGET_OUT_VENDOR_SHARED_LIBRARIES)/android.hardware.gatekeeper-V1-ndk.so
    
# mtk_plpath_utils inclusion
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

# To fix bootloop due to missing files
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/motorola/vienna/prebuilt/modules,$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/modules) \
    $(LOCAL_PATH)/recovery/root/first_stage_ramdisk/fstab.mt6878:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.mt6878 \
    $(LOCAL_PATH)/recovery/root/first_stage_ramdisk/fstab.emmc:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.emmc
