# Audio configuration
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
	$(LOCAL_PATH)/configs/audio/audio_effects.conf:system/etc/audio_effects.conf \
	$(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
	$(LOCAL_PATH)/configs/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml

# Audio encoders
PRODUCT_PROPERTY_OVERRIDES += \
	qcom.hw.aac.encoder=false

# Audio offload
PRODUCT_PROPERTY_OVERRIDES += \
	audio.offload.video=true \
	audio.offload.buffer.size.kb=64 \
	audio.offload.gapless.enabled=true \
	audio.offload.pcm.16bit.enable=false \
	audio.offload.pcm.24bit.enable=false \
	av.streaming.offload.enable=true \
	tunnel.audio.encode=false

# Audio voice recording
PRODUCT_PROPERTY_OVERRIDES += \
	use.voice.path.for.pcm.voip=false \

# Fluence
PRODUCT_PROPERTY_OVERRIDES += \
	persist.audio.fluence.speaker=true \
	persist.audio.fluence.voicecall=true \
	persist.audio.fluence.voicerec=false \
	ro.qc.sdk.audio.fluencetype=none \
	ro.qc.sdk.audio.ssr=false
