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
# Basic Product Info
# ========================================

# Define device specifics: chip model, TWRP product name, and brand
PRODUCT_DEVICE := vienna
PRODUCT_NAME := twrp_vienna
PRODUCT_BRAND := motorola

# Default device path for the device tree
DEVICE_PATH := device/$(PRODUCT_BRAND)/$(PRODUCT_DEVICE)

# ========================================
# Inherit Common Configuration
# ========================================

# Inherit common TWRP settings
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit device-specific configuration for mt6878
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Inherit from generic product configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# ========================================
# APEX Module Configuration
# ========================================
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# ========================================
# GSI & Developer-Specific Configuration
# ========================================

# Add keys for Developer GSI to allow verified boot with GSI
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable quotas and casefolding for emulated storage (without sdcardfs)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# ========================================
# Enable Virtual A/B OTA (with vendor ramdisk)
# ========================================

# Include necessary files for Virtual A/B OTA support
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)

# ========================================
# Google Mobile Services (GMS) Configuration
# ========================================

# Define the base for GMS client ID
PRODUCT_GMS_CLIENTID_BASE := android-motorola

# ========================================
# Property Overrides
# ========================================

# Set properties to hide Reflash TWRP
PRODUCT_PROPERTY_OVERRIDES += \
    ro.twrp.vendor_boot=true
