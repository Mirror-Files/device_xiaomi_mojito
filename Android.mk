#
# Copyright (C) 2021 The PixelExperience Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),mojito)
include $(call all-makefiles-under,$(LOCAL_PATH))
subdir_makefiles=$(call first-makefiles-under,$(LOCAL_PATH))
$(foreach mk,$(subdir_makefiles),$(info including $(mk) ...)$(eval include $(mk)))

include $(CLEAR_VARS)

WFD_LIB := libwfdnative.so
WFD_SYMLINKS := $(addprefix $(TARGET_OUT_APPS_PRIVILEGED)/WfdService/lib/arm64/,$(notdir $(WFD_LIB)))
$(WFD_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "WFD lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(WFD_SYMLINKS)

endif
