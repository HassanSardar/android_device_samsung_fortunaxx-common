# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
        ro.secure=0 \
        ro.adb.secure=0 \
        ro.debuggable=1 \
        persist.service.adb.enable=1
