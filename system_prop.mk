# GPS
persist.loc.nlp_name=com.qualcomm.location \
    persist.gps.qc_nlp_in_use=1 \
    ro.gps.agps_provider=1

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    qcom.bluetooth.soc=smd \
    ro.bluetooth.dun=true \
    ro.bluetooth.hfp.ver=1.7 \
    ro.bluetooth.sap=true \
    ro.qualcomm.bluetooth.ftp=true \
    ro.qualcomm.bluetooth.hfp=true \
    ro.qualcomm.bluetooth.hsp=true \
    ro.qualcomm.bluetooth.map=true \
    ro.qualcomm.bluetooth.nap=true \
    ro.qualcomm.bluetooth.opp=true \
    ro.qualcomm.bluetooth.pbap=true \
    ro.qualcomm.bt.hci_transport=smd \
    persist.bt.enableAptXHD=true

# Storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=true

# Encrypt
PRODUCT_PROPERTY_OVERRIDES += \
    sys.keymaster.loaded=true
