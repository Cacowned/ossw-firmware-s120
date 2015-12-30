TARGET_CHIP     := NRF51822_QFAA_CA
BOARD           := BOARD_PCA10001
DEVICE_VARIANT  := xxaa
USE_SOFTDEVICE  := S120
OUTPUT_FILENAME := ossw_firmware

# Project Source Files
C_SOURCE_FILES += main.c
C_SOURCE_FILES += battery.c
C_SOURCE_FILES += buttons.c
C_SOURCE_FILES += ext_flash.c
C_SOURCE_FILES += ext_ram.c
C_SOURCE_FILES += mlcd.c
C_SOURCE_FILES += mlcd_draw.c
C_SOURCE_FILES += notifications.c
C_SOURCE_FILES += rtc.c
C_SOURCE_FILES += scr_controls.c
C_SOURCE_FILES += scr_mngr.c
C_SOURCE_FILES += spi.c
C_SOURCE_FILES += utf8.c
C_SOURCE_FILES += vibration.c
C_SOURCE_FILES += accel.c
C_SOURCE_FILES += fs.c
C_SOURCE_FILES += config.c
C_SOURCE_FILES += command.c
C_SOURCE_FILES += ossw.c
C_SOURCE_FILES += stopwatch.c
C_SOURCE_FILES += watchset.c

# [SDK]/ble and [SDK]/ble/ble_services
C_SOURCE_FILES += twi_sw_master.c
C_SOURCE_FILES += ble_advdata.c
C_SOURCE_FILES += ble_conn_params.c
C_SOURCE_FILES += softdevice_handler.c
C_SOURCE_FILES += ble_flash.c
C_SOURCE_FILES += crc16.c
C_SOURCE_FILES += ble_srv_common.c
C_SOURCE_FILES += ble_db_discovery.c
C_SOURCE_FILES += ble_advertising.c
C_SOURCE_FILES += ble_hrs.c
C_SOURCE_FILES += ble_hrs_c.c
C_SOURCE_FILES += ble_dis.c
C_SOURCE_FILES += ble_bas.c
C_SOURCE_FILES += ble_bas_c.c
C_SOURCE_FILES += ble_dfu.c
C_SOURCE_FILES += nrf_delay.c
C_SOURCE_FILES += nrf_adc.c
C_SOURCE_FILES += nrf_drv_gpiote.c
C_SOURCE_FILES += nrf_drv_common.c
C_SOURCE_FILES += pstorage.c
C_SOURCE_FILES += device_manager_peripheral.c
C_SOURCE_FILES += dfu_app_handler.c
C_SOURCE_FILES += bootloader_util.c

# /ble
C_SOURCE_FILES += ble_central.c
C_SOURCE_FILES += ble_ossw.c
C_SOURCE_FILES += ble_peripheral.c
# /i18n
C_SOURCE_FILES += i18n.c
# /pawn
C_SOURCE_FILES += amx.c
C_SOURCE_FILES += amxext.c
C_SOURCE_FILES += amxutil.c
# /screens
C_SOURCE_FILES += scr_alert_notification.c
C_SOURCE_FILES += scr_changedate.c
C_SOURCE_FILES += scr_changetime.c
C_SOURCE_FILES += scr_choosemode.c
C_SOURCE_FILES += scr_notifications.c
C_SOURCE_FILES += scr_settings.c
C_SOURCE_FILES += scr_watchface.c
C_SOURCE_FILES += scr_watchset.c
C_SOURCE_FILES += scr_watchset_list.c
C_SOURCE_FILES += scr_about.c
C_SOURCE_FILES += scr_status.c
# /spiffs
C_SOURCE_FILES += spiffs_check.c
C_SOURCE_FILES += spiffs_gc.c
C_SOURCE_FILES += spiffs_hydrogen.c
C_SOURCE_FILES += spiffs_nucleus.c

# [SDK]/app_common
C_SOURCE_FILES += app_button.c
C_SOURCE_FILES += app_error.c
C_SOURCE_FILES += app_fifo.c
C_SOURCE_FILES += app_timer.c
C_SOURCE_FILES += app_trace.c
C_SOURCE_FILES += app_uart_fifo.c

# Make sure we're pointing to the right SDK version
ROOT_PATH = D:/nRF51822/
SDK_PATH = $(ROOT_PATH)lib/sdk/nRF51_SDK_9.0.0/components/
SOFTDEVICE = $(SDK_PATH)/softdevice/s120/hex/s120_softdevice.hex

# Include the correct SoftDevice header files
INCLUDEPATHS += -I"$(SDK_PATH)softdevice/s120/headers"
INCLUDEPATHS += -I"$(SDK_PATH)softdevice/common/softdevice_handler"

# Local and SDK include paths
INCLUDEPATHS += -I"."
INCLUDEPATHS += -I"ble"
INCLUDEPATHS += -I"config"
INCLUDEPATHS += -I"fonts"
INCLUDEPATHS += -I"i18n"
INCLUDEPATHS += -I"pawn"
INCLUDEPATHS += -I"screens"
INCLUDEPATHS += -I"spiffs"
INCLUDEPATHS += -I"$(SDK_PATH)device"
INCLUDEPATHS += -I"$(SDK_PATH)libraries/button"
INCLUDEPATHS += -I"$(SDK_PATH)libraries/bootloader_dfu"
INCLUDEPATHS += -I"$(SDK_PATH)libraries/trace"
INCLUDEPATHS += -I"$(SDK_PATH)libraries/crc16"
INCLUDEPATHS += -I"$(SDK_PATH)libraries/gpiote"
INCLUDEPATHS += -I"$(SDK_PATH)libraries/timer"
INCLUDEPATHS += -I"$(SDK_PATH)libraries/fifo"
INCLUDEPATHS += -I"$(SDK_PATH)libraries/util"
INCLUDEPATHS += -I"$(SDK_PATH)ble/ble_advertising"
INCLUDEPATHS += -I"$(SDK_PATH)ble/ble_services/ble_dis"
INCLUDEPATHS += -I"$(SDK_PATH)ble/ble_services/ble_hrs"
INCLUDEPATHS += -I"$(SDK_PATH)ble/ble_services/ble_hrs_c"
INCLUDEPATHS += -I"$(SDK_PATH)ble/ble_services/ble_bas"
INCLUDEPATHS += -I"$(SDK_PATH)ble/ble_services/ble_bas_c"
INCLUDEPATHS += -I"$(SDK_PATH)ble/ble_services/ble_dfu"
INCLUDEPATHS += -I"$(SDK_PATH)ble/ble_db_discovery"
INCLUDEPATHS += -I"$(SDK_PATH)ble/common"
INCLUDEPATHS += -I"$(SDK_PATH)ble/device_manager"
INCLUDEPATHS += -I"$(SDK_PATH)drivers_nrf/common"
INCLUDEPATHS += -I"$(SDK_PATH)drivers_nrf/ble_flash"
INCLUDEPATHS += -I"$(SDK_PATH)drivers_nrf/pstorage/config"
INCLUDEPATHS += -I"$(SDK_PATH)drivers_nrf/pstorage"
INCLUDEPATHS += -I"$(SDK_PATH)drivers_nrf/hal"
INCLUDEPATHS += -I"$(SDK_PATH)drivers_nrf/gpiote"
INCLUDEPATHS += -I"$(SDK_PATH)drivers_nrf/uart"
INCLUDEPATHS += -I"$(SDK_PATH)drivers_nrf/twi_master/incubated"
INCLUDEPATHS += -I"$(SDK_PATH)drivers_nrf/twi_master/incubated/config"
INCLUDEPATHS += -I"$(SDK_PATH)toolchain/gcc"
INCLUDEPATHS += -I"$(SDK_PATH)toolchain"

C_SOURCE_PATHS += $(wildcard ./*) $(SDK_PATH)softdevice/common/softdevice_handler
C_SOURCE_PATHS += $(SDK_PATH)device
C_SOURCE_PATHS += $(SDK_PATH)libraries/button
C_SOURCE_PATHS += $(SDK_PATH)libraries/bootloader_dfu
C_SOURCE_PATHS += $(SDK_PATH)libraries/trace
C_SOURCE_PATHS += $(SDK_PATH)libraries/crc16
C_SOURCE_PATHS += $(SDK_PATH)libraries/gpiote
C_SOURCE_PATHS += $(SDK_PATH)libraries/timer
C_SOURCE_PATHS += $(SDK_PATH)libraries/fifo
C_SOURCE_PATHS += $(SDK_PATH)libraries/util
C_SOURCE_PATHS += $(SDK_PATH)ble/ble_advertising
C_SOURCE_PATHS += $(SDK_PATH)ble/ble_services/ble_dis
C_SOURCE_PATHS += $(SDK_PATH)ble/ble_services/ble_hrs
C_SOURCE_PATHS += $(SDK_PATH)ble/ble_services/ble_hrs_c
C_SOURCE_PATHS += $(SDK_PATH)ble/ble_services/ble_bas
C_SOURCE_PATHS += $(SDK_PATH)ble/ble_services/ble_bas_c
C_SOURCE_PATHS += $(SDK_PATH)ble/ble_services/ble_dfu
C_SOURCE_PATHS += $(SDK_PATH)ble/ble_db_discovery
C_SOURCE_PATHS += $(SDK_PATH)ble/device_manager
C_SOURCE_PATHS += $(SDK_PATH)ble/common
C_SOURCE_PATHS += $(SDK_PATH)drivers_nrf/ble_flash
C_SOURCE_PATHS += $(SDK_PATH)drivers_nrf/common
C_SOURCE_PATHS += $(SDK_PATH)drivers_nrf/pstorage
C_SOURCE_PATHS += $(SDK_PATH)drivers_nrf/hal
C_SOURCE_PATHS += $(SDK_PATH)drivers_nrf/gpiote
C_SOURCE_PATHS += $(SDK_PATH)drivers_nrf/uart
C_SOURCE_PATHS += $(SDK_PATH)drivers_nrf/twi_master/incubated
C_SOURCE_PATHS += $(SDK_PATH)toolchain

ASSEMBLER_SOURCE_PATHS += $(SDK_PATH)toolchain/gcc

# Additional Flags
CFLAGS += -DBLE_STACK_SUPPORT_REQD
CFLAGS += -DBLE_DFU_APP_SUPPORT
CFLAGS += -Wno-unused-local-typedefs

# Add in the global Makefile
include $(ROOT_PATH)projects/Makefile.common
#include $(SDK_PATH)toolchain/gcc/Makefile.common

INCLUDEPATHS += -I"$(GNU_INSTALL_ROOT)/$(GNU_PREFIX)/include"
