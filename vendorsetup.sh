# For Minimal Manifest
export ALLOW_MISSING_DEPENDENCIES=true

# IDK what this is for
export LC_ALL="C"

# Build Device Codename
export FOX_BUILD_DEVICE=vienna

# Device uses virtual ab ota update
export FOX_VIRTUAL_AB_DEVICE=1

# LZMA Compression for Size Reduction
export OF_USE_LZMA_COMPRESSION=1

# Optional
export FOX_BASH_TO_SYSTEM_BIN=1

# Build all partition tools 
export OF_ENABLE_ALL_PARTITION_TOOLS=1

# don't spam the console with loop errors
export OF_LOOP_DEVICE_ERRORS_TO_LOG=1

# Called just before formatting /data; only useful for devices/ROMs that have dynamic partitions
export OF_USE_DMCTL=1

# Set this to 1 to disable automatic rebooting after openrecoveryscript finishes
export OF_DISABLE_ORS_AUTO_REBOOT=1

# ensure that /sdcard is bind-unmounted before f2fs data repair or format
export OF_UNBIND_SDCARD_F2FS=1

# avoid MTP issues after data format
export OF_BIND_MOUNT_SDCARD_ON_FORMAT=1

# Set this to 1 to force the selection of f2fs when formatting data
export OF_FORCE_DATA_FORMAT_F2FS=1

# Set this to 1 to include an addon for removing factory reset protection (FRP)
export OF_ENABLE_FRP_ADDON=1

# Set to the maintainer's name
export OF_MAINTAINER=cloud

# Use this to change the default time zone
export OF_DEFAULT_TIMEZONE=IST-5:30

# Device specific
export OF_SCREEN_H=2400

# Round corners
export OF_STATUS_INDENT_LEFT=52
export OF_STATUS_INDENT_RIGHT=48

# Skip /data, internal storage decryption
export OF_SKIP_FBE_DECRYPTION=1

# Optional
export OF_FORCE_CASEFOLDING=1

# Drastic Size Reduction
export FOX_DRASTIC_SIZE_REDUCTION=1
