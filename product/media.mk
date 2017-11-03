# Properties
PRODUCT_PROPERTY_OVERRIDES += \
	media.aac_51_output_enabled=true \
	qcom.hw.aac.encoder=false \
	vidc.enc.narrow.searchrange=1


# WiDi
PRODUCT_PROPERTY_OVERRIDES += \
	persist.debug.wfd.enable=1 \
	persist.sys.wfd.virtual=0

# Media
PRODUCT_PROPERTY_OVERRIDES += \
	media.stagefright.legacyencoder=true \
	media.stagefright.less-secure=true \
	media.swhevccodectype=0 \
	mm.enable.qcom_parser=3183219 \
	mm.enable.smoothstreaming=true \
	mmp.enable.3g2=true
