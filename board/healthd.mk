# Charger
BOARD_CHARGER_ENABLE_SUSPEND         := true
BOARD_CHARGING_MODE_BOOTING_LPM      := /sys/class/power_supply/battery/batt_lp_charging
BACKLIGHT_PATH                       := "/sys/class/leds/lcd-backlight/brightness"
CHARGING_ENABLED_PATH                := /sys/class/power_supply/battery/batt_lp_charging
BOARD_NO_CHARGER_LED                 := true
BOARD_CHARGER_DISABLE_INIT_BLANK     := true

# Healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.cm
