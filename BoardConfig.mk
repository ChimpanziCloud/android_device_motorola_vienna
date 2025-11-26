DEVICE_PATH := device/motorola/vienna
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

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
TARGET_USES_64_BIT_BINDER := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

TW_LOAD_VENDOR_MODULES := "goodix_gt96x_u_mmi.ko goodix_brl_u_mmi.ko touchscreen_u_mmi.ko"

TARGET_OTA_ASSERT_DEVICE := vienna

TARGET_BOARD_PLATFORM := mt6878
TARGET_BOOTLOADER_BOARD_NAME := mgvi_64_ww_armv82
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

BOARD_HAS_MTK_HARDWARE := true
BOARD_USES_MTK_HARDWARE := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true

TARGET_NO_KERNEL := true
BOARD_KERNEL_SEPARATED_DTBO := true

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

TARGET_NO_RECOVERY := true
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_RAMDISK_USE_LZ4 := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true

BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTB_SIZE := $(stat -L -c %s $(TARGET_PREBUILT_DTB))

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
TARGET_RECOVERY_INITRC := $(DEVICE_PATH)/recovery/root/init.recovery.mt6878.rc
#TW_SKIP_ADDITIONAL_FSTAB := true

# ========================================
# System Properties
# ========================================
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# ========================================
# Display / UI
# ========================================

# Fixes wrong theme color
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888

# Brightness flags
TW_MAX_BRIGHTNESS := 3075
TW_DEFAULT_BRIGHTNESS := 1020
TW_FRAMERATE := 60
TW_NO_SCREEN_BLANK := true

# CPU temp sysfs path, if it is zero all the time
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone9/temp
TW_CUSTOM_BATTERY_PATH := /sys/devices/platform/smart_battery/power_supply/battery/capacity

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TARGET_USES_MKE2FS := true
TW_DEVICE_VERSION := v0.1.0 | cloud

# ========================================
# TWRP Tools & Features
# ========================================
# Core tools for filesystem and debugging
SIZE_REDUCTION_PLACEHOLDER := false
TW_INCLUDE_FB2PNG := $(SIZE_REDUCTION_PLACEHOLDER)  # Framebuffer screenshot support
TW_INCLUDE_NTFS_3G := $(SIZE_REDUCTION_PLACEHOLDER)  # NTFS read/write
TW_INCLUDE_FUSE_EXFAT := $(SIZE_REDUCTION_PLACEHOLDER)  # ExFAT support via fuse
TW_INCLUDE_FUSE_NTFS := $(SIZE_REDUCTION_PLACEHOLDER)  # NTFS via fuse
# Resetprop (to override props)
TW_INCLUDE_RESETPROP := $(SIZE_REDUCTION_PLACEHOLDER)
TW_INCLUDE_LIBRESETPROP := $(SIZE_REDUCTION_PLACEHOLDER)
# Repack boot images
TW_INCLUDE_REPACKTOOLS := $(SIZE_REDUCTION_PLACEHOLDER)
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_LPDUMP := true
DEXPREOPT_GENERATE_APEX_IMAGE := true
TW_HAS_MTP := true
TW_USB_STORAGE := true

# FastbootD
TW_INCLUDE_FASTBOOTD := true

# ========================================
# Status Bar Customization
# ========================================
TW_STATUS_ICONS_ALIGN := center

# ========================================
# Debug & Logging
# ========================================
TWRP_INCLUDE_LOGCAT := true
TWRP_EVENT_LOGGING := true
TARGET_USES_LOGD := true
