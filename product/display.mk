# Panel
PRODUCT_PACKAGES += \
	libjni_livedisplay

# Screen density
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=240

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# HWUI
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)
