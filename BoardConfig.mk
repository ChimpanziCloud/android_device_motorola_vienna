# ========================================
# Copyright & Licensing
# ========================================
# Copyright (C) 2024-2025 The TeamWin Recovery Project
# SPDX-License-Identifier: Apache-2.0
#
# TWRP Device Config for vienna
# Maintainer: LazymeaoProjects
# Date: 2025-05-XX
#

# ========================================
# Build Flags for Minimal Manifests & Broken Dependencies
# ========================================
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# ========================================
# CPU Architecture
# ========================================
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# ========================================
# OTA Assert Devices
# ========================================
TARGET_OTA_ASSERT_DEVICE := Vienna,vienna,XT2409-3,mt6878

# ========================================
# Platform & Bootloader
# ========================================
TARGET_BOARD_PLATFORM := mt6878
TARGET_BOOTLOADER_BOARD_NAME := mt6878
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

BOARD_HAS_MTK_HARDWARE := true
BOARD_USES_MTK_HARDWARE := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true

# ========================================
# Kernel & DTBO Config
# ========================================
TARGET_NO_KERNEL := true
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_BOOTIMAGE := $(DEVICE_PATH)/prebuilt/boot.img

BOARD_BOOT_HEADER_VERSION := 4
BOARD_PAGE_SIZE := 4096
BOARD_KERNEL_BASE := 0x3fff8000
BOARD_KERNEL_TAGS_OFFSET := 0x07c88000
BOARD_RAMDISK_OFFSET := 0x26f08000
BOARD_VENDOR_CMDLINE := bootopt=64S3,32N2,64N2

# mkbootimg configuration
BOARD_MKBOOTIMG_ARGS += \
    --dtb $(TARGET_PREBUILT_DTB) \
    --vendor_cmdline $(BOARD_VENDOR_CMDLINE) \
    --pagesize $(BOARD_PAGE_SIZE) --board "" \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) \
    --header_version $(BOARD_BOOT_HEADER_VERSION)

TARGET_NO_RECOVERY := true
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_RAMDISK_USE_LZ4 := true
LZMA_RAMDISK_TARGETS := boot,recovery
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true

# ========================================
# Partition Sizes & File Systems
# ========================================
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 115913752576

# Use F2FS for userdata
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Workaround for build errors with ramdisk copying
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODM_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4

# Mount points
TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_SYSTEM_DLKM := system_dlkm
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_ODM_DLKM := odm_dlkm
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# ========================================
# Dynamic Partitions
# ========================================

# Total size of the super partition as reported by the device or extracted from partition table
BOARD_SUPER_PARTITION_SIZE := 9126805504  # total super partition size
BOARD_SUPER_PARTITION_GROUPS := motorola_dynamic_partitions
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    odm product system system_ext vendor vendor_dlkm
# Subtract 4MB from the super partition size to reserve space for partition metadata
# 4MB = 4 * 1024 * 1024 = 4194304 bytes
# 9663676416 - 4194304 = 9659482112 bytes
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 9122611200

# ========================================
# Metadata Partition
# ========================================
BOARD_USES_METADATA_PARTITION := true

# ========================================
# Encryption / Decryption Support (FBE)
# ========================================
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_USE_FSCRYPT_POLICY := 2
TW_FORCE_KEYMASTER_VER := true

# Enables proper handling of /data/media
RECOVERY_SDCARD_ON_DATA := true

# ========================================
# Anti-Rollback Bypass
# ========================================
PLATFORM_SECURITY_PATCH := 2099-12-31
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# ========================================
# Wipe Handling / Misc
# ========================================
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_SECURE_ERASE := true

# ========================================
# AVB (Android Verified Boot)
# ========================================
BOARD_AVB_ENABLE := true

# ========================================
# FSTab
# ========================================
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
#TW_SKIP_ADDITIONAL_FSTAB := true

# ========================================
# System Properties
# ========================================
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# ========================================
# Init Support
# ========================================
TARGET_INIT_VENDOR_LIB := libinit_vienna
TARGET_RECOVERY_DEVICE_MODULES := libinit_vienna

# ========================================
# Display / UI
# ========================================

# Fixes wrong theme color
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

# Brightness flags
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 4095
TW_DEFAULT_BRIGHTNESS := 140
TW_FRAMERATE := 120
TW_NO_SCREEN_BLANK := true

# CPU temp sysfs path, if it is zero all the time
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone11/temp

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TARGET_USES_MKE2FS := true
TW_DEVICE_VERSION := v0.1.0 | LazymeaoProjects

# ========================================
# TWRP Tools & Features
# ========================================
# Core tools for filesystem and debugging
TW_INCLUDE_FB2PNG := true  # Framebuffer screenshot support
TW_INCLUDE_NTFS_3G := true  # NTFS read/write
TW_INCLUDE_FUSE_EXFAT := true  # ExFAT support via fuse
TW_INCLUDE_FUSE_NTFS := true  # NTFS via fuse
# Resetprop (to override props)
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
# Repack boot images
TW_INCLUDE_REPACKTOOLS := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_LPDUMP := true
DEXPREOPT_GENERATE_APEX_IMAGE := true
TW_HAS_MTP := true
TW_USB_STORAGE := true
TW_USE_TOOLBOX := true
TW_EXCLUDE_SUPERSU := true


# FastbootD
TW_INCLUDE_FASTBOOTD := true

# ========================================
# Status Bar Customization
# ========================================
TW_STATUS_ICONS_ALIGN := center
#TW_CUSTOM_CLOCK_POS := "290"
#TW_CUSTOM_CPU_POS := "340"
#TW_CUSTOM_BATTERY_POS := "790"

#TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/virtual/android_usb/android0/f_mass_storage/lun%d/file
