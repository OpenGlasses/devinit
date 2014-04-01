LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

#��� ������������ ����������
LOCAL_MODULE    := librkapp

#������������ ����� � �������� �����
#����� �����������
LOCAL_SRC_FILES := \
	librkapp/rkapp_worker.c \
	librkapp/com_rkapp_JNICaller.c
#�������� ���� ��������� libusb
LOCAL_SRC_FILES+= libusb/libusb/core.c libusb/libusb/descriptor.c \
	libusb/libusb/io.c libusb/libusb/sync.c \
	libusb/libusb/os/linux_usbfs.c
#�������� ���� ��������� libfreenect
LOCAL_SRC_FILES+= libfreenect/audio.c libfreenect/cameras.c \
	libfreenect/core.c libfreenect/loader.c \
	libfreenect/registration.c libfreenect/tilt.c \
	libfreenect/usb_libusb10.c
#�����, � ������� ���������� �������� ����
#����������� ��� ����������
LOCAL_C_INCLUDES += $(LOCAL_PATH)/libusb/android  $(LOCAL_PATH)/libusb/libusb \
	$(LOCAL_PATH)/libusb/libusb/os 	$(LOCAL_PATH)/libfreenect \
	$(LOCAL_PATH)/librkapp
#�������������� ��������� ����������. ������������ ��� ������	
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog -lstdc++ -lc -lm -ldl -landroid  -lGLESv2  -lEGL 

LOCAL_ALLOW_UNDEFINED_SYMBOLS := true
include $(BUILD_SHARED_LIBRARY)
