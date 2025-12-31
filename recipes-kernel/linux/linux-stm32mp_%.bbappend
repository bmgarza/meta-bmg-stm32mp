FILESEXTRAPATHS:prepend := "${THISDIR}/dt-overlays:${THISDIR}/fragments:"

python () {
    # For some reason, the linux-stm32mp kernel outputs the kernel image and
    # other images to the deploy/images/<MACHINE/kernel/ directory instead of
    # the typical deploy/images/<MACHINE/. This broke the qemu boot
    # configuration as it couldn't find the kernel image that was generated.
    if "qemuall" in (d.getVar('MACHINEOVERRIDES') or "").split(":"):
        d.setVarFlag('do_deploy', 'sstate-outputdirs', "${DEPLOY_DIR_IMAGE}")
}

COMPATIBLE_MACHINE:stm32mp-qemuarm = "(${MACHINE})"

#region Kernel configuration
# By adding the following machine override in the local.conf you can enable
# these fragments in the kernel:
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
#endregion


#region Devicetree configuration
DT_OVERLAY_DIR = "dt-overlays"
DT_OVERLAY_INCLUDES = ""

DT_OVERLAY_INCLUDES:append:stm32mp15-disco = " \
        stm32mp15-disco-enable-usart3 \
    "
SRC_URI:append:stm32mp15-disco = " ${@' '.join('file://%s.dts;subdir=${DT_OVERLAY_DIR}' % d for d in '${DT_OVERLAY_INCLUDES}'.split())} "
STM32MP_KERNEL_DEVICETREE:append:stm32mp15-disco = " ${@' '.join('%s.dtbo' % d for d in '${DT_OVERLAY_INCLUDES}'.split())} "

# We need to make sure that the dtbo files are included in the final bootfs as
# it is not included by default
FILES:${KERNEL_PACKAGE_NAME}-imagebootfs += " boot/*.dtbo "

do_configure:prepend:stm32mp15-disco() {
    # We copy all dts files into the sourcce, only the dtb files compiled will
    # end up in the boot directory that is built by this recipe.
    for f in ${WORKDIR}/${DT_OVERLAY_DIR}/*.dts; do
        cp $f ${S}/arch/${ARCH}/boot/dts/
    done
}
#endregion
