# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from common shooter
-include device/htc/shooter-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/htc/shooter/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH := device/htc/shooter/include

TARGET_BOOTLOADER_BOARD_NAME := shooter

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := shooter

# CDMA Ril and Wimax Support
BOARD_USES_LEGACY_RIL := true
COMMON_GLOBAL_CFLAGS += -DBOARD_HAVE_SQN_WIMAX
BOARD_HAVE_SQN_WIMAX := true

# Kernel Details
TARGET_KERNEL_CONFIG := shooter_defconfig
BOARD_KERNEL_CMDLINE := console=ttyHSL0 androidboot.hardware=shooter no_console_suspend=1

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/htc/shooter

# RIL
COMMON_GLOBAL_CFLAGS += -DNEW_LIBRIL_HTC

# cat /proc/emmc
#dev:        size     erasesize name
# mmcblk0p17: 00040000 00000200 "misc"
# mmcblk0p22: 00fffc00 00000200 "recovery"
# mmcblk0p21: 01000000 00000200 "boot"
# mmcblk0p23: 31fffc00 00000200 "system"
# mmcblk0p32: 00140200 00000200 "local"
# mmcblk0p25: 06ebde00 00000200 "cache"
# mmcblk0p24: 4aabc400 00000200 "userdata"
# mmcblk0p28: 01400000 00000200 "devlog"
# mmcblk0p30: 00040000 00000200 "pdata"
# mmcblk0p18: 02800000 00000200 "radio"
# mmcblk0p19: 007ffa00 00000200 "radio_config"
# mmcblk0p26: 00400000 00000200 "modem_st1"
# mmcblk0p27: 00400000 00000200 "modem_st2"
# mmcblk0p8:  00c00200 00000200 "wimax"
# mmcblk0p33: 007ffa00 00000200 "udata_wimax"

BOARD_SYSTEMIMAGE_PARTITION_SIZE := 435941376
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1394606080
BOARD_BOOTIMAGE_PARTITION_SIZE := 5242880

TARGET_RECOVERY_FSTAB := device/htc/shooter/rootdir/etc/fstab.shooter
TARGET_RECOVERY_UI_LIB := librecovery_ui_shooter
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
BOARD_USES_MMCUTILS := true
BOARD_HAS_NO_SELECT_BUTTON := true
#TARGET_RECOVERY_NO_MSM_BSP := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_RECOVERY_SWIPE := true
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"

# Twrp
DEVICE_RESOLUTION = 540x960
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_NO_REAL_SDCARD := false
TW_NO_SCREEN_BLANK := true
HAVE_SELINUX := true
TW_TARGET_USES_QCOM_BSP := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
SP1_NAME := "wimax"
SP1_DISPLAY_NAME := "WiMAX"
SP1_BACKUP_METHOD := image
SP1_MOUNTABLE := 0
SP2_NAME := "udata_wimax"
SP2_DISPLAY_NAME := "WiMAX Settings"
SP2_BACKUP_METHOD := image
SP2_MOUNTABLE := 0
TW_INCLUDE_DUMLOCK := true
TW_INCLUDE_JB_CRYPTO := true
