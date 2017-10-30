#
# Copyright (C) 2016 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit from samsung qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/samsung/fortunaxx-common/BoardConfigVendor.mk

# PATH
LOCAL_PATH := device/samsung/fortunaxx-common

# Platform
TARGET_BOARD_PLATFORM           := msm8916
TARGET_BOARD_PLATFORM_GPU       := qcom-adreno306
TARGET_BOOTLOADER_BOARD_NAME    := MSM8916
BOARD_USES_CYANOGEN_HARDWARE    := true

# Arch
TARGET_CPU_VARIANT              := cortex-a53
TARGET_CPU_CORTEX_A53           := true
ARCH_ARM_HAVE_TLS_REGISTER      := true
#ENABLE_CPUSETS                 := true

# Qcom
TARGET_PLATFORM_DEVICE_BASE          := /devices/soc.0/
HAVE_SYNAPTICS_I2C_RMI4_FW_UPGRADE   := true
USE_DEVICE_SPECIFIC_QCOM_PROPRIETARY := true
TARGET_USES_QCOM_BSP                 := true
TARGET_USES_NEW_ION_API              := true

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Kernel
TARGET_KERNEL_ARCH                 := arm
BOARD_DTBTOOL_ARG                  := -2
BOARD_KERNEL_BASE                  := 0x80000000
BOARD_KERNEL_CMDLINE               := console=null androidboot.hardware=qcom msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci androidboot.selinux=permissive
BOARD_RAMDISK_OFFSET               := 0x02000000
BOARD_KERNEL_TAGS_OFFSET           := 0x01e00000
BOARD_KERNEL_PAGESIZE              := 2048
BOARD_KERNEL_SEPARATED_DT          := true
TARGET_KERNEL_SOURCE               := kernel/samsung/fortunaxx
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
KERNEL_TOOLCHAIN                   := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin

# Partition sizes
TARGET_USERIMAGES_USE_EXT4          := true
BOARD_BOOTIMAGE_PARTITION_SIZE      := 13631488
BOARD_RECOVERYIMAGE_PARTITION_SIZE  := 15728640
BOARD_SYSTEMIMAGE_PARTITION_SIZE    := 1568669696
BOARD_CACHEIMAGE_PARTITION_SIZE     := 314572800
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_PERSISTIMAGE_PARTITION_SIZE   := 8388608
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
# (5731495936 - 16384)
BOARD_USERDATAIMAGE_PARTITION_SIZE  := 5731479552
BOARD_FLASH_BLOCK_SIZE              := 131072

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_WLAN_DEVICE                := qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_PROVIDES_WCNSS_QMI        := true
TARGET_USES_QCOM_WCNSS_QMI       := true
TARGET_USES_WCNSS_CTRL           := true
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"

WLAN_MODULES:
	mkdir -p $(KERNEL_MODULES_OUT)/pronto
	mv $(KERNEL_MODULES_OUT)/wlan.ko $(KERNEL_MODULES_OUT)/pronto/pronto_wlan.ko
	ln -sf /system/lib/modules/pronto/pronto_wlan.ko $(TARGET_OUT)/lib/modules/wlan.ko

TARGET_KERNEL_MODULES += WLAN_MODULES

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH                        := true
BOARD_HAVE_BLUETOOTH_QCOM                   := true
BLUETOOTH_HCI_USE_MCT                       := true

# Custom RIL class
BOARD_RIL_CLASS                      := ../../../device/samsung/fortunaxx-common/ril/
PROTOBUF_SUPPORTED                   := true

# Fonts
EXTENDED_FONT_FOOTPRINT              := true

# malloc implementation
MALLOC_SVELTE                        := true

# Audio
BOARD_USES_ALSA_AUDIO                := true
USE_CUSTOM_AUDIO_POLICY              := 1
TARGET_QCOM_AUDIO_VARIANT            := caf
TARGET_USES_QCOM_MM_AUDIO            := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND         := true
BOARD_CHARGING_MODE_BOOTING_LPM      := /sys/class/power_supply/battery/batt_lp_charging
BACKLIGHT_PATH                       := "/sys/class/leds/lcd-backlight/brightness"
CHARGING_ENABLED_PATH                := /sys/class/power_supply/battery/batt_lp_charging
BOARD_NO_CHARGER_LED                 := true
BOARD_CHARGER_DISABLE_INIT_BLANK     := true

# Enable QCOM FM feature
AUDIO_FEATURE_ENABLED_FM             := true

# Enable HW based full disk encryption
TARGET_HW_DISK_ENCRYPTION            := false
TARGET_KEYMASTER_WAIT_FOR_QSEE       := true

# Power HAL
#TARGET_POWERHAL_SET_INTERACTIVE_EXT  := $(LOCAL_PATH)/power/power_ext.c
TARGET_POWERHAL_VARIANT              := none
WITH_QC_PERF                         := false

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH      := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS  := true
BOARD_VOLD_MAX_PARTITIONS            := 65

# Camera
TARGET_PROVIDES_CAMERA_HAL             := true
USE_DEVICE_SPECIFIC_CAMERA             := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_HAS_LEGACY_CAMERA_HAL1          := true
TARGET_NEEDS_TEXT_RELOCATIONS          := true

# GPS
TARGET_GPS_HAL_PATH                    := device/samsung/fortunaxx-common/gps
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET  := true

# CMHW
BOARD_HARDWARE_CLASS                 += $(LOCAL_PATH)/cmhw

# Workaround to avoid issues with legacy liblights on QCOM platforms
TARGET_PROVIDES_LIBLIGHT              := true

# Media
TARGET_QCOM_MEDIA_VARIANT             := caf

# Fm radio
BOARD_HAVE_QCOM_FM                    := true

# Display
TARGET_CONTINUOUS_SPLASH_ENABLED      := true
TARGET_USES_OVERLAY                   := true
TARGET_HARDWARE_3D                    := true
TARGET_HAVE_HDMI_OUT                  := false
USE_OPENGL_RENDERER                   := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS       := 3
MAX_EGL_CACHE_KEY_SIZE                := 12*1024
MAX_EGL_CACHE_SIZE                    := 2048*1024
OVERRIDE_RS_DRIVER                    := libRSDriver.so

# Boot animation
TARGET_SCREEN_WIDTH                  := 540
TARGET_SCREEN_HEIGHT                 := 960

# Snapdragon LLVM
TARGET_USE_SDCLANG                   := true

# Recovery
TARGET_RECOVERY_FSTAB                := $(LOCAL_PATH)/rootdir/fstab.qcom
TARGET_USERIMAGES_USE_EXT4           := true
BOARD_HAS_LARGE_FILESYSTEM           := true
TARGET_RECOVERY_DENSITY              := hdpi
BOARD_HAS_NO_MISC_PARTITION          := true
BOARD_HAS_NO_SELECT_BUTTON           := true
BOARD_RECOVERY_SWIPE                 := true
BOARD_USE_CUSTOM_RECOVERY_FONT       := \"roboto_23x41.h\"
BOARD_USES_MMCUTILS                  := true

# TWRP
ifneq ($(wildcard bootable/recovery-twrp),)
    RECOVERY_VARIANT := twrp
endif
ifeq ($(RECOVERY_VARIANT),twrp)
    BOARD_GLOBAL_CFLAGS += -DTW_USE_MINUI_CUSTOM_FONTS
    TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
    TW_MAX_BRIGHTNESS := 255
    TW_HAS_DOWNLOAD_MODE := true
    TW_HAS_MTP := true
    TW_INCLUDE_CRYPTO := true
    TW_INPUT_BLACKLIST := "accelerometer\x0ahbtp_vm"
    TW_INTERNAL_STORAGE_PATH := "/data/media"
    TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
    TW_EXTERNAL_STORAGE_PATH := "/external_sd"
    TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
    TW_MTP_DEVICE := /dev/mtp_usb
    TW_DEFAULT_EXTERNAL_STORAGE := true
    TW_NEW_ION_HEAP := true
    TW_NO_REBOOT_BOOTLOADER := true
    TW_TARGET_USES_QCOM_BSP := false
    TW_THEME := portrait_hdpi
    RECOVERY_GRAPHICS_USE_LINELENGTH := true
    TW_SCREEN_BLANK_ON_BOOT := true
endif

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS       := $(LOCAL_PATH)

# Misc.
TARGET_SYSTEM_PROP                   := $(LOCAL_PATH)/system.prop

PRODUCT_COPY_FILES                   := $(filter-out frameworks/base/data/keyboards/Generic.kl:system/usr/keylayout/Generic.kl , $(PRODUCT_COPY_FILES))
PRODUCT_COPY_FILES                   := $(filter-out frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf , $(PRODUCT_COPY_FILES))

#SU
WITH_SU                              := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
   device/samsung/fortunaxx-common/sepolicy
