#
# Copyright (C) 2014-2016 The CyanogenMod Project
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/samsung/hltedcm/hltedcm-vendor.mk)
$(call inherit-product-if-exists, vendor/samsung/hltedcm-felica/hltedcm-felica-vendor.mk)
#$(call inherit-product-if-exists, vendor/samsung/hltedcm-oneseg/hltedcm-oneseg-vendor.mk)

# One-seg
#PRODUCT_PACKAGES += \
#    ISDBT_FactoryTest \
#    MobileTV_JPN_PHONE_K

# NFC
DEVICE_NFC_SONY := yes

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/security_nfc_profile.dat:system/etc/security_nfc_profile.dat \
    $(LOCAL_PATH)/configs/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/configs/libnfc-nxp.conf:system/etc/libnfc-nxp.conf

# Permissions
#PRODUCT_COPY_FILES += \
#    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
#    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
#    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# NFC
$(call inherit-product, device/samsung/hlte-common/nfc/bcm2079x/product.mk)
# Ramdisk for FeliCa
PRODUCT_PACKAGES += \
    FeliCaLock \
    init.carrier.rc \
    init.felica.sh

#Smart card service for felica
#TARGET_ENABLE_SMARTCARD_SERVICE := true
PRODUCT_PACKAGES += \
    org.simalliance.openmobileapi.xml org.simalliance.openmobileapi

# Common hlte
$(call inherit-product, device/samsung/hlte-common/hlte.mk)
