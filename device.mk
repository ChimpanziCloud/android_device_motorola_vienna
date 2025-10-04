# modern devices require modern flags
PRODUCT_USE_DYNAMIC_PARTITIONS := true
ENABLE_AB := true
ENABLE_VIRTUAL_AB := true
AB_OTA_UPDATER := true
LOCAL_PATH := device/motorola/vienna

# partitions changed during ota update (over the air update)
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
    
# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# ota update config
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
    
PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# config
BOARD_SHIPPING_API_LEVEL := 32
PRODUCT_SHIPPING_API_LEVEL := $(BOARD_SHIPPING_API_LEVEL)
PRODUCT_TARGET_VNDK_VERSION := 32
PRODUCT_PROPERTY_OVERRIDES += \
	ro.crypto.dm_default_key.options_format.version=2 \
	ro.crypto.volume.metadata.method=dm-default-key \
	keymaster_ver=4.1
	
PRODUCT_HOST_PACKAGES_ENG += \
	liberofs \
	mkfs.erofs \
	make_erofs \
	dump.erofs \
	fsck.erofs 
PRODUCT_EXTRA_RECOVERY_KEYS += $(LOCAL_PATH)/security/ota
PRODUCT_COPY_FILES += $(LOCAL_PATH)/vendor_ramdisk/first_stage_ramdisk/fstab.mt6878:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.mt6878
PRODUCT_COPY_FILES += $(LOCAL_PATH)/vendor_ramdisk/first_stage_ramdisk/fstab.emmc:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.emmc
PRODUCT_COPY_FILES += $(TOP)/system/core/libprocessgroup/profiles/cgroups.recovery.json:$(TARGET_COPY_OUT_RECOVERY)/root/etc/cgroups.json
PRODUCT_COPY_FILES += $(TOP)/system/core/libprocessgroup/profiles/task_profiles.json:$(TARGET_COPY_OUT_RECOVERY)/root/etc/task_profiles.json
PRODUCT_COPY_FILES += $(TOP)/system/core/libprocessgroup/profiles/task_profiles.json:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/task_profiles.json

# packages incoming!
PRODUCT_PACKAGES += \
    snapuserd \
    android.hardware.security.rkp-V3-ndk \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd \
    android.hardware.keymaster@4.1 \
    android.system.keystore2 \
    android.hardware.security.keymint \
    android.hardware.security.secureclock \
    android.hardware.security.sharedsecret \
    create_pl_dev \
    create_pl_dev.recovery \
    update_engine \
    update_engine_sideload \
    update_verifier \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery \
    android.hardware.gatekeeper@1.0.vendor \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service 
    
TARGET_RECOVERY_DEVICE_MODULES += \
    android.hardware.keymaster@4.1 \
    android.system.suspend-service \
    android.system.suspend@1.0 

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client \
    bootctrl
