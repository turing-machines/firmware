###########################################################
#
# bmc_installer
#
###########################################################

BMC_INSTALLER_VERSION = d4453b9574b4d721c2d1ecc6fe98c203b94dd356
BMC_INSTALLER_SITE = $(call github,turing-machines,BMC-Installer,$(BMC_INSTALLER_VERSION))
BMC_INSTALLER_LICENSE = Apache-2.0
BMC_INSTALLER_LICENSE_FILES = LICENSE
BMC_INSTALLER_INSTALL_STAGING = YES
BMC_INSTALLER_INSTALL_TARGET = NO
BMC_INSTALLER_CARGO_BUILD_OPTS = --bin=sdcard --bin=usb_gadget

define BMC_INSTALLER_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0755 $(@D)/target/$(RUSTC_TARGET_NAME)/$(if $(BR2_ENABLE_DEBUG),debug,release)/sdcard $(STAGING_DIR)/initramfs/install/init
	$(INSTALL) -D -m 0755 $(@D)/target/$(RUSTC_TARGET_NAME)/$(if $(BR2_ENABLE_DEBUG),debug,release)/usb_gadget $(STAGING_DIR)/usb_initramfs/init
endef

$(eval $(cargo-package))
