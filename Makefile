include theos/makefiles/common.mk

DEBUG = 0
GO_EASY_ON_ME = 1
SDKVERSION = 5.0
include theos/makefiles/common.mk

TWEAK_NAME = SMSmileys
SMSmileys_FILES = Tweak.xm
SMSmileys_FRAMEWORKS = Foundation CoreGraphics
include $(THEOS_MAKE_PATH)/tweak.mk
