# GPS
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/gps/flp.conf:system/etc/flp.conf \
	$(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf \
	$(LOCAL_PATH)/gps/izat.conf:system/etc/izat.conf \
	$(LOCAL_PATH)/gps/izat.conf:system/etc/izat.conf \
	$(LOCAL_PATH)/gps/sap.conf:system/etc/sap.conf

# GPS HAL
PRODUCT_PACKAGES += \
	gps.msm8916

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml

# Location
PRODUCT_PACKAGES += \
	com.android.location.provider \
	com.android.location.provider.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
	persist.loc.nlp_name=com.qualcomm.location \
	persist.gps.qc_nlp_in_use=1 \
	ro.gps.agps_provider=1
