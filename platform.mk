# Copyright (C) 2014 The Android Open Source Project
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

$(call inherit-product, device/sony/common/common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

SOMC_PLATFORM := kanuti

SONY_ROOT := device/sony/kanuti/rootdir
SONY_PROPRIETARY := device/sony/kanuti/proprietary

# Media
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/aanc_tuning_mixer.txt:system/etc/aanc_tuning_mixer.txt \
    $(SONY_ROOT)/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(SONY_ROOT)/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(SONY_ROOT)/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(SONY_ROOT)/system/etc/mixer_paths_mtp.xml:system/etc/mixer_paths_mtp.xml \
    $(SONY_ROOT)/system/etc/audio_platform_info.xml:system/etc/audio_platform_info.xml

# Qualcom WiFi
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(SONY_ROOT)/system/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

# Qualcom BT
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

# Keylayout
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/usr/keylayout/ft5x06_ts.kl:system/usr/keylayout/ft5x06_ts.kl \
    $(SONY_ROOT)/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(SONY_ROOT)/system/usr/keylayout/synaptics_dsx.kl:system/usr/keylayout/synaptics_dsx.kl \
    $(SONY_ROOT)/system/usr/keylayout/synaptics_rmi4_i2c.kl:system/usr/keylayout/synaptics_rmi4_i2c.kl

# IDC
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/usr/idc/cyttsp4_mt.idc:system/usr/idc/cyttsp4_mt.idc \
    $(SONY_ROOT)/system/usr/idc/cyttsp5_mt.idc:system/usr/idc/cyttsp5_mt.idc

# Configs
PRODUCT_COPY_FILES += \
    $(SONY_PROPRIETARY)/etc/data/dsi_config.xml:system/etc/data/dsi_config.xml \
    $(SONY_PROPRIETARY)/etc/data/netmgr_config.xml:system/etc/data/netmgr_config.xml \
    $(SONY_PROPRIETARY)/etc/data/qmi_config.xml:system/etc/data/qmi_config.xml 

# Device Specific Hardware
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml

# Platform Init
PRODUCT_PACKAGES += \
    fstab.kanuti \
    init.kanuti.pwr

# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm8916

# GFX
PRODUCT_PACKAGES += \
    gralloc.msm8916 \
    copybit.msm8916 \
    hwcomposer.msm8916 \
    memtrack.msm8916

# GPS
PRODUCT_PACKAGES += \
    gps.msm8916 \
    gps.conf \
    libutils \
    libcutils \
    liblog \
    libdl \
    libgps.utils \
    libloc_core

#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/gps/izat.conf:system/etc/izat.conf \
#    $(LOCAL_PATH)/gps/sap.conf:system/etc/sap.conf

# CAMERA
PRODUCT_PACKAGES += \
    camera.msm8916

# Keymaster
PRODUCT_PACKAGES += \
    keystore.msm8916

# Proprietary
PRODUCT_PACKAGES += \
	Bluetooth_cal \
	General_cal \
	Global_cal \
	Hdmi_cal \
	Headset_cal \
	cmnlib_b00 \
	cmnlib_b01 \
	cmnlib_b02 \
	cmnlib_b03 \
	cmnlib_mdt \
	ice40 \
	tzhdcp_b00 \
	tzhdcp_b01 \
	tzhdcp_b02 \
	tzhdcp_b03 \
	tzhdcp_mdt \
	tzlibasb_b00 \
	tzlibasb_b01 \
	tzlibasb_b02 \
	tzlibasb_b03 \
	tzlibasb_mdt \
	tznautilus_b00 \
	tznautilus_b01 \
	tznautilus_b02 \
	tznautilus_b03 \
	tznautilus_mdt \
	tzsuntory_b00 \
	tzsuntory_b01 \
	tzsuntory_b02 \
	tzsuntory_b03 \
	tzsuntory_mdt \
	tzwidevine_b00 \
	tzwidevine_b01 \
	tzwidevine_b02 \
	tzwidevine_b03 \
	tzwidevine_mdt \
	venus_b00 \
	venus_b01 \
	venus_b02 \
	venus_b03 \
	venus_b04 \
	venus_mbn \
	venus_mdt \
	WCNSS_cfg \
	WCNSS_qcom_cfg \
	WCNSS_qcom_wlan_nv \
	hci_qcomm_init \
	wcnss_service \
	libpn547_fw \
	libbtnv

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.bt.hci_transport=smd

# PERFD
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so

# RILD
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
    rild.libargs=-d /dev/smd0 \
    ril.subscription.types=NV,RUIM

# system prop for opengles version
# 196609 is decimal for 0x30001 to
# report major/minor versions as 3/1
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196609

# aDSP sensors
## max rate
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qti.sensors.max_accel_rate=false \
    ro.qti.sensors.max_gyro_rate=false \
    ro.qti.sensors.max_mag_rate=false \
    ro.qti.sensors.max_geomag_rotv=50

## sensor type
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qti.sdk.sensors.gestures=false \
    ro.qti.sensors.pedometer=false \
    ro.qti.sensors.step_detector=false \
    ro.qti.sensors.step_counter=false \
    ro.qti.sensors.pam=false \
    ro.qti.sensors.scrn_ortn=false \
    ro.qti.sensors.smd=true \
    ro.qti.sensors.game_rv=false \
    ro.qti.sensors.georv=false \
    ro.qti.sensors.cmc=false \
    ro.qti.sensors.bte=false \
    ro.qti.sensors.fns=false \
    ro.qti.sensors.qmd=false \
    ro.qti.sensors.amd=false \
    ro.qti.sensors.rmd=false \
    ro.qti.sensors.vmd=false \
    ro.qti.sensors.gtap=false \
    ro.qti.sensors.tap=false \
    ro.qti.sensors.facing=false \
    ro.qti.sensors.tilt=false \
    ro.qti.sensors.tilt_detector=false \
    ro.qti.sensors.dpc=false \
    ro.qti.sensors.wu=false
