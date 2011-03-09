# Gaia Product

PRODUCT_NAME := gaia
PRODUCT_BRAND := gaia
PRODUCT_DEVICE := generic

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Used by BusyBox
KERNEL_MODULES_DIR:=/system/lib/modules

# Tiny toolbox
TINY_TOOLBOX:=true

# Enable Windows Media if supported by the board
WITH_WINDOWS_MEDIA:=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PACKAGES += \
    Superuser
    #LatinIME

# Bring in some audio files
include frameworks/base/data/sounds/OriginalAudio.mk

# Always run in insecure mode, enables root on user build variants
#ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0

# Always include Google apps
WITH_GAPPS := true

ifdef WITH_GAPPS
    PRODUCT_COPY_FILES += \
		vendor/gaia/proprietary/GenieWidget.apk:./system/app/GenieWidget.apk \
		vendor/gaia/proprietary/Gmail.apk:./system/app/Gmail.apk \
		vendor/gaia/proprietary/GoogleBackupTransport.apk:./system/app/GoogleBackupTransport.apk \
		vendor/gaia/proprietary/GoogleCalendarSyncAdapter.apk:./system/app/GoogleCalendarSyncAdapter.apk \
		vendor/gaia/proprietary/GoogleContactsSyncAdapter.apk:./system/app/GoogleContactsSyncAdapter.apk \
		vendor/gaia/proprietary/GoogleQuickSearchBox.apk:./system/app/GoogleQuickSearchBox.apk \
		vendor/gaia/proprietary/GoogleServicesFramework.apk:./system/app/GoogleServicesFramework.apk \
		vendor/gaia/proprietary/LatinImeTutorial.apk:./system/app/LatinImeTutorial.apk \
		vendor/gaia/proprietary/MarketUpdater.apk:./system/app/MarketUpdater.apk \
		vendor/gaia/proprietary/MediaUploader.apk:./system/app/MediaUploader.apk \
		vendor/gaia/proprietary/NetworkLocation.apk:./system/app/NetworkLocation.apk \
		vendor/gaia/proprietary/SetupWizard.apk:./system/app/SetupWizard.apk \
		vendor/gaia/proprietary/Talk.apk:./system/app/Talk.apk \
		vendor/gaia/proprietary/Vending.apk:./system/app/Vending.apk \
		vendor/gaia/proprietary/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
		vendor/gaia/proprietary/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
		vendor/gaia/proprietary/features.xml:./system/etc/permissions/features.xml
else
	PRODUCT_PACKAGES += \
        Provision \
        QuickSearchBox
endif

# add the new boot animation
PRODUCT_COPY_FILES += \
    #vendor/amethyst/misc/LiveWallpapers.apk:./system/app/LiveWallpapers.apk \
	vendor/gaia/prebuilt/media/bootanimation.zip:system/media/bootanimation.zip

