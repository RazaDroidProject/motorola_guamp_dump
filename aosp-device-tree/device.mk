#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# A/B
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

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

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# Rootdir
PRODUCT_PACKAGES += \
    init.mmi.shutdown.sh \
    init.mmi.usb.sh \
    init.mmi.modules.sh \
    init.mmi.mdlog-getlogs.sh \
    init.crda.sh \
    init.qti.qcv.sh \
    pstore_annotate.sh \
    init.oem.fingerprint2.sh \
    init.qcom.early_boot.sh \
    init.class_main.sh \
    init.gbmods.sh \
    init.mmi.block_perm.sh \
    init.qcom.usb.sh \
    hardware_revisions.sh \
    init.qcom.post_boot.sh \
    init.mmi.boot.sh \
    apanic_copy.sh \
    init.qti.chg_policy.sh \
    init.oem.hw.sh \
    init.qcom.efs.sync.sh \
    init.qti.media.sh \
    init.qcom.sdio.sh \
    init.qcom.coex.sh \
    init.mmi.wlan-getlogs.sh \
    init.mmi.touch.sh \
    init.qcom.class_core.sh \
    init.mdm.sh \
    init.oem.fingerprint.sh \
    qca6234-service.sh \
    apanic_annotate.sh \
    init.qti.dcvs.sh \
    init.qcom.sh \
    apanic_save.sh \
    init.qcom.sensors.sh \
    init.mmi.laser.sh \

PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    init.target.rc \
    init.mmi.wlan.rc \
    init.mmi.tcmd.rc \
    init.mmi.diag_mdlog.rc \
    init.qcom.usb.rc \
    init.mmi.overlay.rc \
    init.mmi.debug.rc \
    init.mmi.rc \
    init.mmi.diag.rc \
    init.qti.ufs.rc \
    init.mmi.chipset.rc \
    init.mmi.usb.rc \
    init.qcom.factory.rc \
    init.mmi.charge_only.rc \
    init.recovery.qcom.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 29

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/motorola/guamp/guamp-vendor.mk)
