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
# Local Path Setup
# ========================================
LOCAL_PATH := $(call my-dir)

# ========================================
# Device-Specific Configurations
# ========================================
# Only apply configurations for vienna device
ifeq ($(TARGET_DEVICE),vienna)
    # Include all subdirectory makefiles under this directory
    include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif

# ========================================
# Hack Properties for Recovery Image
# ========================================
# Modify default recovery properties for debugging or custom boot setup
BOARD_RECOVERY_IMAGE_PREPARE += \
    # Disable ADB secure (useful for debugging or custom recovery behaviors)
    sed -i 's/ro.adb.secure=.*/ro.adb.secure=0/' $(TARGET_RECOVERY_ROOT_OUT)/prop.default; \
    # Set the build date to a fixed value (useful for creating generic recovery images)
    sed -i 's/ro.bootimage.build.date.utc=.*/ro.bootimage.build.date.utc=0/' $(TARGET_RECOVERY_ROOT_OUT)/prop.default; \
    # Set the build date to a fixed value (useful for creating generic recovery images)
    sed -i 's/ro.build.date.utc=.*/ro.build.date.utc=0/' $(TARGET_RECOVERY_ROOT_OUT)/prop.default;
