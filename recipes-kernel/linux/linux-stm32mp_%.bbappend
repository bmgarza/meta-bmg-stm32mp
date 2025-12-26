FILESEXTRAPATHS:prepend := "${THISDIR}/fragments:"

COMPATIBLE_MACHINE:stm32mp-qemuarm = "(${MACHINE})"

# By adding a new machine override in the local.conf you can enable these fragments in the kernel.
#   MACHINEOVERRIDES =. "debug:"
SRC_URI:append:debug = " \
    file://enable-all-logs.cfg;subdir=fragments \
    "
KERNEL_CONFIG_FRAGMENTS:append:debug = " \
    ${WORKDIR}/fragments/enable-all-logs.cfg \
    "

# The default stm32mp kernel doesn't include any drivers in the case that it is
# being run inside of a qemu virtual machine.
SRC_URI:append:qemuall = " \
    file://enable-virtio-drivers.cfg;subdir=fragments \
    "
KERNEL_CONFIG_FRAGMENTS:append:qemuall = " \
    ${WORKDIR}/fragments/enable-virtio-drivers.cfg \
    "

python () {
    # For some reason, the linux-stm32mp kernel outputs the kernel image and
    # other images to the deploy/images/<MACHINE/kernel/ directory instead of
    # the typical deploy/images/<MACHINE/. This broke the qemu boot
    # configuration as it couldn't find the kernel image that was generated.
    if "qemuall" in (d.getVar('MACHINEOVERRIDES') or "").split(":"):
        d.setVarFlag('do_deploy', 'sstate-outputdirs', "${DEPLOY_DIR_IMAGE}")
}
