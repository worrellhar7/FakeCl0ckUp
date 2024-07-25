ARCHS = arm64 arm64e

TARGET := iphone:clang:16.5:10.3

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FakeClockUp
FakeClockUp_FILES = Tweak.xm
FakeClockUp_FRAMEWORKS = UIKit
ADDITIONAL_OBJCFLAGS = -fobjc-arc
SUBPROJECTS += fakeclockupprefs

include $(THEOS)/makefiles/tweak.mk
include $(THEOS)/makefiles/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"
