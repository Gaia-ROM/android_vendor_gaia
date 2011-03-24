# Inherit AOSP device configuration for bravo.
$(call inherit-product, device/htc/bravo/full_bravo.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/gaia/products/common.mk)

# Include GSM stuff
$(call inherit-product, vendor/gaia/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := gaia_bravo
PRODUCT_BRAND := htc_wwe
PRODUCT_DEVICE := bravo
PRODUCT_MODEL := HTC Desire
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=FRF91 BUILD_DISPLAY_ID=GRH78 PRODUCT_NAME=htc_bravo BUILD_FINGERPRINT=htc_wwe/htc_bravo/bravo/bravo:2.2/FRF91/226611:user/release-keys TARGET_BUILD_TYPE=user BUILD_VERSION_TAGS=release-keys PRIVATE_BUILD_DESC="2.10.405.2 CL226611 release-keys"

# Build kernel
PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-msm
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=gaia_bravo_defconfig

# Extra Bravo (CDMA/GSM) overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/gaia/overlay/bravo

# Add proprietary apps and extra packages
BOARD_GLOBAL_CFLAGS := -DHAVE_FM_RADIO
PRODUCT_PACKAGES += \
    FM \
    hcitool

PRODUCT_COPY_FILES += \
   vendor/gaia/proprietary/Zeam.apk:system/app/Zeam.apk


#
# Set ro.modversion
#
ifdef RELEASE
    PRODUCT_PROPERTY_OVERRIDES += \
	ro.modversion=Gaia-v1.0.0
else
ifdef RC
   PRODUCT_PROPERTY_OVERRIDES += \
	ro.modversion=Gaia-v1.0.0-RC1
else
    PRODUCT_PROPERTY_OVERRIDES += \
    	ro.modversion=Gaia-SNAPHSOT-$(shell date +%m%d%Y)
endif
endif
