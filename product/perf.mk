# Perf
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.extension_library=/system/vendor/lib/libqti-perfd-client.so

# I/O scheduler
PRODUCT_PROPERTY_OVERRIDES += \
	sys.io.scheduler=bfq
