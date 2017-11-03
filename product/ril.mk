# RIL
PRODUCT_PACKAGES += \
	Stk \
	Stk2

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
rild.libpath=/system/lib/libsec-ril.so
rild.libargs=-d /dev/smd0
ro.telephony.ril_class=SamsungQcom3GDSRIL
ril.subscription.types=NV,RUIM
ro.telephony.default_network=9
persist.radio.add_power_save=1
persist.radio.apm_sim_not_pwdn=1
DEVICE_PROVISIONED=1
ro.telephony.ril.config=simactivation,sim2gsmonly
ro.ril.ecclist=911,112

# Samsung In-call Audio
PRODUCT_PROPERTY_OVERRIDES += \
ro.multisim.set_audio_params=true
ro.telephony.samsung.realcall=true
