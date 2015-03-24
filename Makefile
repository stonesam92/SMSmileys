DEBUG = 0
GO_EASY_ON_ME = 1
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 8.0
ARCHS = armv7 arm64 armv7s

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SMSmileys
SMSmileys_FILES = Tweak.xm
SMSmileys_FRAMEWORKS = Foundation
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	    install.exec "killall -9 MobileSMS"
