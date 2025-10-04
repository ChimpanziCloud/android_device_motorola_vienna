# maintained by ChimpanziCloud (boii ts tuff)
# chances of working:0.1%

# device makefile cuz yes
PRODUCT_DEVICE := $(notdir $(LOCAL_DIR))
PRODUCT_MAKEFILES := device/motorola/vienna/twrp_vienna.mk

#om nom nom (yummy lunch choicez)
COMMON_LUNCH_CHOICES := \
    twrp_vienna-user \
    twrp_vienna-userdebug \
    twrp_vienna-eng
