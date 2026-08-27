ARCHS = arm64 arm64e
TARGET = iphone:clang:16.5:15.0
INSTALL_TARGET_PROCESSES = SpringBoard

THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FakeSignalTweak
FakeSignalTweak_FILES = Tweak.xm
FakeSignalTweak_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += fakesignaltweakprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
