# Data modules
PRODUCT_PROPERTY_OVERRIDES += \
	persist.data.netmgrd.qos.enable=false \
	ro.use_data_netmgrd=false

# Misc.
PRODUCT_PROPERTY_OVERRIDES += \
	debug.mdpcomp.logs=0 \
	dev.pm.dyn_samplingrate=1 \
	persist.hwc.enable_vds=1 \
	persist.hwc.mdpcomp.enable=true \
	persist.sys.storage_preload=1 \
	ro.data.large_tcp_window_size=true

# Time Services
PRODUCT_PROPERTY_OVERRIDES += \
        persist.timed.enable=true
