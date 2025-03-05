FILESEXTRAPATHS:prepend := "${THISDIR}/fragments:"

COMPATIBLE_MACHINE:stm32mp-qemuarm = "(${MACHINE})"

# Special configuration changes
SRC_URI:append = " \
    file://disable-usb-dwc3.cfg;subdir=fragments \
    file://disable-stm32mp-gpu-drm.cfg;subdir=fragments \
    "

# QEMU ARMv7 configuration modifications, these cause the kernel build to fail due to the change in hardware.
KERNEL_CONFIG_FRAGMENTS:append:stm32mp-qemuarm32 = " \
    ${WORKDIR}/fragments/disable-usb-dwc3.cfg \
    ${WORKDIR}/fragments/disable-stm32mp-gpu-drm.cfg \
    "

python () {
    # For some reason, the linux-stm32mp kernel outputs the kernel image and
    # other images to the deploy/images/<MACHINE/kernel/ directory instead of
    # the typical deploy/images/<MACHINE/. This broke the qemu boot
    # configuration as it couldn't find the kernel image that was generated.
    if "qemuall" in (d.getVar('MACHINEOVERRIDES') or "").split(":"):
        d.setVarFlag('do_deploy', 'sstate-outputdirs', "${DEPLOY_DIR_IMAGE}")
}
