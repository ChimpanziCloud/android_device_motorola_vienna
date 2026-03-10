# ========================================
# Build Rules
# ========================================
DEVICE_PATH := device/motorola/vienna
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# ========================================
# Architecture Info
# ========================================
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55
TARGET_KERNEL_ARCH := $(TARGET_ARCH)
TARGET_KERNEL_HEADER_ARCH := $(TARGET_ARCH)

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55
TARGET_BOARD_SUFFIX := _64

# CPU boost
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# ========================================
# Touch Screen Modules
# ========================================
TW_LOAD_VENDOR_MODULES := "goodix_gt96x_u_mmi.ko goodix_brl_u_mmi.ko touchscreen_u_mmi.ko"

# ========================================
# Variables (Device-Specific)
# ========================================
TARGET_OTA_ASSERT_DEVICE := vienna
TARGET_BOARD_PLATFORM := mt6878
TARGET_BOOTLOADER_BOARD_NAME := mgvi_64_ww_armv82
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_RECOVERY_INITRC := $(DEVICE_PATH)/recovery/root/init.recovery.mt6878.rc
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TW_SKIP_ADDITIONAL_FSTAB := true

# ========================================
# MTK Hardware Support
# ========================================
BOARD_HAS_MTK_HARDWARE := true
BOARD_USES_MTK_HARDWARE := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true

# ========================================
# Vendor_Boot Image Config
# ========================================
BOARD_KERNEL_SEPARATED_DTBO := true

# Not required for recovery as vendor_boot
TARGET_NO_KERNEL := true

# Vendor_Boot Offsets
BOARD_VENDOR_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_PAGE_SIZE := 4096
BOARD_BOOT_HEADER_VERSION := 4
BOARD_HEADER_SIZE := 2128
BOARD_FLASH_BLOCK_SIZE := 262144
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
BOARD_PREBUILT_BOOTIMAGE := $(DEVICE_PATH)/prebuilt/boot.img
BOARD_DTB_SIZE := $(stat -L -c %s $(TARGET_PREBUILT_DTB))
BOARD_DTB_OFFSET := 0x07c88000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x26f08000
BOARD_TAGS_OFFSET := 0x07c88000
BOARD_KERNEL_BASE := 0x3fff8000
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTB_SIZE := $(stat -L -c %s $(TARGET_PREBUILT_DTB))

# Offsets implementation in new vendor_boot recovery image
BOARD_MKBOOTIMG_ARGS += \
    --dtb $(TARGET_PREBUILT_DTB) \
    --dtb_offset $(BOARD_DTB_OFFSET) \
    --vendor_cmdline $(BOARD_VENDOR_CMDLINE) \
    --pagesize $(BOARD_PAGE_SIZE) --board "" \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --tags_offset $(BOARD_TAGS_OFFSET) \
    --base $(BOARD_KERNEL_BASE) \
    --header_version $(BOARD_BOOT_HEADER_VERSION)

# Device does not use recovery image
TARGET_NO_RECOVERY := true

# GKI support
BOARD_USES_GENERIC_KERNEL_IMAGE := true

# Vendor_boot ramdisk config
BOARD_RAMDISK_USE_LZ4 := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := false
TW_LOAD_VENDOR_BOOT_MODULES := true

# ========================================
# Enforce VINTF Manifest(s)
# ========================================
PRODUCT_ENFORCE_VINTF_MANIFEST := true

# Device supports full treble
PRODUCT_FULL_TREBLE := true

# ========================================
# Partitions Config
# ========================================
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_USES_VENDOR_DLKMIMAGE := true
#TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Metadata partition support
BOARD_USES_METADATA_PARTITION := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_SECURE_ERASE := true

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# ========================================
# Encryption / Decryption Support (FBE)
# ========================================
INCLUDE_CRYPTO := false
TW_INCLUDE_CRYPTO := $(INCLUDE_CRYPTO)
TW_INCLUDE_CRYPTO_FBE := $(INCLUDE_CRYPTO)
TW_INCLUDE_FBE := $(INCLUDE_CRYPTO)
TW_INCLUDE_FBE_METADATA_DECRYPT := $(INCLUDE_CRYPTO)
TW_USE_FSCRYPT_POLICY := 2
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
# AVB (Android Verified Boot)
# ========================================
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VENDOR_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VENDOR_BOOT_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX := 1
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX_LOCATION := 1

# ========================================
# Display / UI
# ========================================
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TW_MAX_BRIGHTNESS := 3075
TW_DEFAULT_BRIGHTNESS := 1020
TW_FRAMERATE := 120
TW_NO_CPU_TEMP := true

# ========================================
# TWRP Tools & Features Config
# ========================================
SIZE_REDUCTION_PLACEHOLDER := true # Local Placeholder

# Exclude default init.recovery.usb.rc from build
TW_EXCLUDE_DEFAULT_USB_INIT := true

# MTP support
TW_HAS_MTP := true
TW_USB_STORAGE := true

# Custom battery path
TW_CUSTOM_BATTERY_PATH := "/sys/devices/platform/smart_battery/power_supply/battery/capacity"

# Not needed
TW_EXCLUDE_APEX := true

# Set recovery theme for mobile
TW_THEME := portrait_hdpi

# Extra languages support
TW_EXTRA_LANGUAGES := true

# Custom device version
TW_DEVICE_VERSION := v0.1.0 | cloud

# Toybox instead of Busybox
TW_USE_TOOLBOX := true

# MKE2FS support
TARGET_USES_MKE2FS := true

# Partition tools
TW_ENABLE_ALL_PARTITION_TOOLS := $(SIZE_REDUCTION_PLACEHOLDER)

# LogD + Logcat Implementation
TWRP_INCLUDE_LOGCAT := true
TWRP_EVENT_LOGGING := true
TARGET_USES_LOGD := true

# Extra logs
TARGET_RECOVERY_DEVICE_MODULES += strace
RECOVERY_BINARY_SOURCE_FILES   += $(TARGET_OUT_EXECUTABLES)/strace

# Framebuffer screenshot support
TW_INCLUDE_FB2PNG := $(SIZE_REDUCTION_PLACEHOLDER)

# Include NTFS file system support using ntfs-3g driver
TW_INCLUDE_NTFS_3G := $(SIZE_REDUCTION_PLACEHOLDER)

# Reset props inclusion
TW_INCLUDE_RESETPROP := $(SIZE_REDUCTION_PLACEHOLDER)
TW_INCLUDE_LIBRESETPROP := $(SIZE_REDUCTION_PLACEHOLDER)

# Magiskboot implementation
TW_INCLUDE_REPACKTOOLS := $(SIZE_REDUCTION_PLACEHOLDER)

# FastbootD implementation
TW_INCLUDE_FASTBOOTD := true

# Status bar config
TW_STATUS_ICONS_ALIGN := center