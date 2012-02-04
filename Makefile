include theos/makefiles/common.mk

DEBUG = 1
GO_EASY_ON_ME = 1
SDKVERSION = 5.0
include theos/makefiles/common.mk

TWEAK_NAME = SMSmileys
SMSmileys_FILES = Tweak.xm
SMSmileys_FRAMEWORKS = Foundation
include $(THEOS_MAKE_PATH)/tweak.mk
