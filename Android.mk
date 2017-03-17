#
# Copyright (C) 2008 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ifeq ($(TARGET_BUILD_APPS),)
support_library_root_dir := frameworks/support
else
support_library_root_dir := prebuilts/sdk/current/support
endif

LOCAL_STATIC_JAVA_LIBRARIES += android-support-compat \
    android-support-core-utils \
    android-support-core-ui \
    android-support-media-compat \
    android-support-fragment \
    android-support-v7-palette \
    android-support-v7-appcompat \
    android-support-v7-cardview \
    android-support-v7-recyclerview \
    android-support-v8-renderscript \
    android-support-annotations \
    android-support-vectordrawable \
    android-support-animatedvectordrawable \
    android-support-design \
    android-support-percent \
    android-support-transition \
    universal-image-loader \
    retrofit \
    anjlab-library \
    okhttp2 \
    gson

LOCAL_STATIC_JAVA_AAR_LIBRARIES += app-theme-engine \
    material-dialogs-core \
    material-dialogs-commons \
    track-selector \
    materialiconlib

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res \
                      $(support_library_root_dir)/v7/appcompat/res \
                      $(support_library_root_dir)/v7/recyclerview/res \
                      $(support_library_root_dir)/v7/cardview/res \
                      $(support_library_root_dir)/transition/res \
                      $(support_library_root_dir)/percent/res \
                      $(support_library_root_dir)/design/res

LOCAL_AAPT_FLAGS := --auto-add-overlay 

LOCAL_PROGUARD_FLAG_FILES := proguard.flags
LOCAL_JAR_EXCLUDE_FILES := none
LOCAL_SRC_FILES += $(call all-subdir-java-files)
LOCAL_PACKAGE_NAME := Timber
LOCAL_MODULE_TAGS := optional
include $(BUILD_PACKAGE)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := \
    app-theme-engine:libs/aar/app-theme-engine-0.5.2.aar \
    material-dialogs-core:libs/aar/material-dialogs-core-0.9.0.2.aar \
    material-dialogs-commons:libs/aar/material-dialogs-commons-0.9.0.2.aar \
    track-selector:libs/aar/track-selector-lib-1.1.aar \
    materialiconlib:libs/aar/materialiconlib-1.0.3.aar \
    universal-image-loader:libs/universal-image-loader-1.9.4.jar \
    okhttp2:libs/okhttp-2.3.0.jar \
    retrofit:libs/retrofit-1.9.0.jar \
    anjlab-library:libs/anjlab-library-1.0.38.jar \
    gson:libs/gson-2.7.jar

include $(BUILD_MULTI_PREBUILT)
