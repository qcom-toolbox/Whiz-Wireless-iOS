ARCHS = arm64 arm64e
TARGET = iphone:clang:16.5:15.0

THEOS_PACKAGE_SCHEME = rootless

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = FakeSignalTweakPrefs
FakeSignalTweakPrefs_FILES = FSTRootListController.m
FakeSignalTweakPrefs_INSTALL_PATH = /Library/PreferenceBundles
FakeSignalTweakPrefs_FRAMEWORKS = UIKit
FakeSignalTweakPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk
