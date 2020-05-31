# Copyright (C) 2017-2018 The LineageOS Project
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

# echo "$(call inherit-product, vendor/microg/microg.mk)" >> ~/lineage/device/google/muskie/aosp_walleye.mk
# echo "$(call inherit-product, vendor/microg/microg.mk)" >> ~/lineage/device/google/crosshatch/aosp_blueline.mk

LOCAL_PATH := vendor/microg

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/lib/libjni_latinimegoogle.so:$(TARGET_COPY_OUT_SYSTEM)/lib/libjni_latinimegoogle.so \
    $(LOCAL_PATH)/etc/permissions/features.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/features.xml \
    $(LOCAL_PATH)/etc/default-permissions/microg-permissions.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/default-permissions/microg-permissions.xml \
    $(LOCAL_PATH)/etc/default-permissions/phonesky-permissions.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/default-permissions/phonesky-permissions.xml \
    $(LOCAL_PATH)/etc/sysconfig/microg-a5k.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/microg-a5k.xml

PRODUCT_PACKAGES += \
    FakeStore \
    AuroraStore \
    DroidGuard \
    YouTubeVanced \
    FDroid \
    FDroidPrivileged \
    GmsCore \
    GoogleBackupTransport \
    GoogleCalendarSync \
    GoogleContactsSync \
    GsfProxy \
    OpenWeatherMapProvider \
    com.google.android.maps \
    UnifiedNlp \
    nlpBackendNominatim
