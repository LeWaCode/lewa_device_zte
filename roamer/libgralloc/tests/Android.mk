
LOCAL_PATH := $(call my-dir)

# you can use EXTRA_CFLAGS to indicate additional CFLAGS to use
# in the build. The variables will be cleaned on exit
#
#

libgralloc_test_includes:= \
    bionic/libstdc++/include \
    external/astl/include \
    external/gtest/include \
    $(LOCAL_PATH)/..

libgralloc_test_static_libs := \
    libgralloc_qsd8k_host \
    libgtest_main_host \
	libgtest_host  \
	libastl_host \
    liblog

define host-test
  $(foreach file,$(1), \
    $(eval include $(CLEAR_VARS)) \
    $(eval LOCAL_CPP_EXTENSION := .cpp) \
    $(eval LOCAL_SRC_FILES := $(file)) \
    $(eval LOCAL_C_INCLUDES := $(libgralloc_test_includes)) \
    $(eval LOCAL_MODULE := $(notdir $(file:%.cpp=%))) \
    $(eval LOCAL_CFLAGS += $(EXTRA_CFLAGS)) \
    $(eval LOCAL_LDLIBS += $(EXTRA_LDLIBS)) \
    $(eval LOCAL_STATIC_LIBRARIES := $(libgralloc_test_static_libs)) \
    $(eval LOCAL_MODULE_TAGS := eng tests) \
    $(eval include $(BUILD_HOST_EXECUTABLE)) \
  ) \
  $(eval EXTRA_CFLAGS :=) \
  $(eval EXTRA_LDLIBS :=)
endef

TEST_SRC_FILES := \
	pmemalloc_test.cpp

$(call host-test, $(TEST_SRC_FILES))
