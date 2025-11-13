LOCAL_PATH := device/motorola/vienna
PRODUCT_USE_DYNAMIC_PARTITIONS := true
ENABLE_VIRTUAL_AB := true
AB_OTA_UPDATER := true

$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

PRODUCT_TARGET_VNDK_VERSION := 32
PRODUCT_SHIPPING_API_LEVEL := 32
PRODUCT_PLATFORM := mt6878
PRODUCT_BOARD := mgvi_64_ww_armv82

AB_OTA_PARTITIONS += \
    system \
    vendor \
    product \
    boot
    
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true


PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery \
    fastbootd
    
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-recovery \
    android.hardware.boot@1.1-impl \
    android.hardware.boot@1.1-service \
    bootctrl

PRODUCT_PACKAGES += \
    bootctrl.mt6878 \
    bootctrl.mt6878.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctrl \
    update_engine_client

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_verifier \
    update_engine_sideload
    
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery
    
PRODUCT_COPY_FILES += $(LOCAL_PATH)/vendor_ramdisk/first_stage_ramdisk/fstab.mt6878:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.mt6878
PRODUCT_COPY_FILES += $(LOCAL_PATH)/vendor_ramdisk/first_stage_ramdisk/fstab.emmc:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.emmc
