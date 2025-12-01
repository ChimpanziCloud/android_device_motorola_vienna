LOCAL_PATH := device/motorola/vienna
DEVICE_PATH := device/motorola/vienna
PRODUCT_USE_DYNAMIC_PARTITIONS := true
ENABLE_VIRTUAL_AB := true
AB_OTA_UPDATER := true

PRODUCT_TARGET_VNDK_VERSION := 32
BOARD_SHIPPING_API_LEVEL := 32
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
    otapreopt_script \
    update_engine \
    update_verifier

PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

PRODUCT_PACKAGES += \
    bootctrl
    
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery
