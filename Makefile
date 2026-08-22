TARGET := iphone:clang:latest:14.0
ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Snapchat-Dylib-Vip
Snapchat-Dylib-Vip_FILES = Tweak.x
Snapchat-Dylib-Vip_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
