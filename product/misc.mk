# Misc. libs
PRODUCT_PACKAGES += \
	libssl \
	libcrypto

# Encryption
PRODUCT_PROPERTY_OVERRIDES += \
	sys.keymaster.loaded=true

# Time Services
PRODUCT_PROPERTY_OVERRIDES += \
	persist.timed.enable=true
