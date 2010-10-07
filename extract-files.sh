#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
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

DEVICE=SGH-T959

mkdir -p ../../../vendor/samsung/$DEVICE/proprietary

DIRS="
bin
etc/wifi
lib/egl
lib/hw
"

for DIR in $DIRS; do
	mkdir -p ../../../vendor/samsung/$DEVICE/proprietary/$DIR
done

FILES="
bin/drexe
bin/efsd
bin/efsd30
bin/rilclient-test
bin/wlservice

etc/asound.conf
etc/wifi/nvram_net.txt
etc/wifi/nvram_mfg.txt
etc/wifi/bcm4329_aps.bin
etc/wifi/bcm4329_mfg.bin
etc/wifi/bcm4329_sta.bin

lib/libarccamera.so
lib/libcamerafirmwarejni.so
lib/libcamera.so
lib/libseccameraadaptor.so
lib/libseccamera.so
lib/libclientgps.so
lib/libsecgps.so
lib/libril.so
lib/libreference-ril.so
lib/libsecril-client.so
lib/libs263domxoc.so
lib/libs263eomxoc.so
lib/libs264domxoc.so
lib/libs264eomxoc.so
lib/libsaacdomxoc.so
lib/libsaaceomxoc.so
lib/libsac3domxoc.so
lib/libsamrdomxoc.so
lib/libsamreomxoc.so
lib/libsdiv3domxoc.so
lib/libsflacdomxoc.so
lib/libsmp3domxoc.so
lib/libsmp4fmocn.so
lib/libsmp4vdomxoc.so
lib/libsmp4veomxoc.so
lib/libsvc1domxoc.so
lib/libswmadomxoc.so
lib/libswmv7domxoc.so
lib/libswmv8domxoc.so
lib/libspeech.so
lib/libwlservice.so

lib/egl/egl.cfg
lib/egl/libEGL_POWERVR_SGX540_120.so
lib/egl/libGLES_android.so
lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so
lib/egl/libGLESv2_POWERVR_SGX540_120.so

lib/hw/copybit.s5pc110.so
lib/hw/lights.default.so
lib/hw/sensors.SGH-T959.so
lib/hw/gralloc.s5pc110.so
"

for FILE in $FILES; do
	adb pull system/$FILE ../../../vendor/samsung/$DEVICE/proprietary/$FILE
done

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/samsung/$DEVICE/$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The Android Open Source Project
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

# This file is generated by device/samsung/__DEVICE__/extract-files.sh

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES := \\
    vendor/samsung/__DEVICE__/proprietary/lib/libclientgps.so:obj/lib/libclientgps.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsecgps.so:obj/lib/libsecgps.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libcamera.so:obj/lib/libcamera.so
#
# Wifi
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/lib/libwlservice.so:system/lib/libwlservice.so \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/nvram_net.txt:system/etc/wifi/nvram_net.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/bcm4329_aps.bin:system/etc/wifi/bcm4329_aps.bin \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/bcm4329_mfg.bin:system/etc/wifi/bcm4329_mfg.bin \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/bcm4329_sta.bin:system/etc/wifi/bcm4329_sta.bin \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/wlservice:system/bin/wlservice

#
# Display (3D)
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/lib/egl/egl.cfg:system/lib/egl/egl.cfg \\
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libEGL_POWERVR_SGX540_120.so:system/lib/egl/libEGL_POWERVR_SGX540_120.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so:system/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libGLESv2_POWERVR_SGX540_120.so:system/lib/egl/libGLESv2_POWERVR_SGX540_120.so

#
# Sensors, Lights etc
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/lib/hw/copybit.s5pc110.so:system/lib/hw/copybit.s5pc110.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/hw/lights.default.so:system/lib/hw/lights.default.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/hw/sensors.SGH-T959.so:system/lib/hw/sensors.SGH-T959.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/hw/gralloc.s5pc110.so:system/lib/hw/gralloc.s5pc110.so

#
# Camera
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/lib/libarccamera.so:system/lib/libarccamera.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libcamerafirmwarejni.so:system/lib/libcamerafirmwarejni.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libcamera.so:system/lib/libcamera.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libseccameraadaptor.so:system/lib/libseccameraadaptor.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libseccamera.so:system/lib/libseccamera.so

#
# RIL
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/lib/libril.so:system/lib/libril.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libreference-ril.so:system/lib/libreference-ril.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsecril-client.so:system/lib/libsecril-client.so \\
    vendor/samsung/__DEVICE__/proprietary/bin/drexe:system/bin/drexe \\
    vendor/samsung/__DEVICE__/proprietary/bin/efsd:system/bin/efsd \\
    vendor/samsung/__DEVICE__/proprietary/bin/efsd30:system/bin/efsd30 \\
    vendor/samsung/__DEVICE__/proprietary/bin/rilclient-test:system/bin/rilclient-test

#
# GPS
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/lib/libclientgps.so:system/lib/libclientgps.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsecgps.so:system/lib/libsecgps.so

#
# OMX
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/lib/libs263domxoc.so:system/lib/libs263domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libs263eomxoc.so:system/lib/libs263eomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libs264domxoc.so:system/lib/libs264domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libs264eomxoc.so:system/lib/libs264eomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsaacdomxoc.so:system/lib/libsaacdomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsaaceomxoc.so:system/lib/libsaaceomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsac3domxoc.so:system/lib/libsac3domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsamrdomxoc.so:system/lib/libsamrdomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsamreomxoc.so:system/lib/libsamreomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsdiv3domxoc.so:system/lib/libsdiv3domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsflacdomxoc.so:system/lib/libsflacdomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsmp3domxoc.so:system/lib/libsmp3domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsmp4fmocn.so:system/lib/libsmp4fmocn.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsmp4vdomxoc.so:system/lib/libsmp4vdomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsmp4veomxoc.so:system/lib/libsmp4veomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsvc1domxoc.so:system/lib/libsvc1domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libswmadomxoc.so:system/lib/libswmadomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libswmv7domxoc.so:system/lib/libswmv7domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libswmv8domxoc.so:system/lib/libswmv8domxoc.so \\

EOF

./setup-makefiles.sh
