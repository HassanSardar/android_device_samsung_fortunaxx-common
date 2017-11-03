# Dex2oat
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sys.fw.bg_apps_limit=12 \
	ro.sys.fw.dex2oat_thread_count=4 \
	dalvik.vm.dex2oat-flags=--no-watch-dog
