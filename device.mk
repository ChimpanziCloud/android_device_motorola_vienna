# ========================================
# Copyright & Licensing
# ========================================
# Copyright (C) 2024-2025 The TeamWin Recovery Project
# SPDX-License-Identifier: Apache-2.0
#
# TWRP Device Config for MT6878
# Maintainer: LazymeaoProjects
# Date: 2025-05-XX
#

# ========================================
# Partitions & OTA
# ========================================

# Enable dynamic partitions (required for most modern A/B devices)
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# A/B
ENABLE_AB := true

# Enable Virtual A/B OTA support (incremental, seamless updates)
ENABLE_VIRTUAL_AB := true

# Standard A/B OTA support
AB_OTA_UPDATER := true

# List of partitions included in A/B OTA updates
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    init_boot \
    odm \
    odm_dlkm \
    product \
    system \
    system_dlkm \
    system_ext \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor_boot \
    vendor_dlkm \
    vendor

# Post-install script configuration for OTA optimization
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

# Packages needed for postinstall OTA processing
PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# ========================================
# Android Version & VNDK Configuration
# ========================================
BOARD_SHIPPING_API_LEVEL := 32

# Shipping API level (Android 12.1 = API 32)
PRODUCT_SHIPPING_API_LEVEL := $(BOARD_SHIPPING_API_LEVEL)

# ========================================
# FastbootD Support (used by recovery)
# ========================================
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# ========================================
# Keymaster & Keystore Support
# ========================================
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1 \
    android.system.keystore2

# Encryption support
PRODUCT_PROPERTY_OVERRIDES += \
	ro.crypto.dm_default_key.options_format.version=2 \
	ro.crypto.volume.metadata.method=dm-default-key \
	keymaster_ver=4.1

# Security
PRODUCT_PACKAGES += \
    android.hardware.security.keymint \
    android.hardware.security.secureclock \
    android.hardware.security.sharedsecret

# Additional configs
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.keymaster@4.1

TARGET_RECOVERY_DEVICE_MODULES += \
    android.hardware.keymaster@4.1

# ========================================
# Preloader Update Utility (MediaTek)
# ========================================
# Adds the create_pl_dev tool and its recovery variant to support
# raw preloader partition updates on MediaTek platforms. This utility
# uses device-mapper nodes to enable writing to partitions without headers.
PRODUCT_PACKAGES += \
    create_pl_dev \
    create_pl_dev.recovery

# ========================================
# Update Engine (for A/B and sideload)
# ========================================
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# ========================================
# Device Modules
# ========================================
TARGET_RECOVERY_DEVICE_MODULES += \
    libion

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so

# ========================================
# oem otacerts key
# ========================================
PRODUCT_EXTRA_RECOVERY_KEYS += $(DEVICE_PATH)/security/ota

# ========================================
# Kernel Modules for Recovery
# ========================================
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(DEVICE_PATH)/prebuilt/kernel_modules/vendor_boot,$(TARGET_COPY_OUT_RECOVERY)/root/lib/modules/)
