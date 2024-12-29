COMPATIBLE_MACHINE:stm32mp-qemuarm64 = "(stm32mp-qemuarm64)"

python () {
    # For some reason, the linux-stm32mp kernel outputs the kernel image and
    # other images to the deploy/images/<MACHINE/kernel/ directory instead of
    # the typical deploy/images/<MACHINE/. This broke the qemu boot
    # configuration as it couldn't find the kernel image that was generated.
    if d.getVar('MACHINE') == 'stm32mp-qemuarm64':
        d.setVarFlag('do_deploy', 'sstate-outputdirs', "${DEPLOY_DIR_IMAGE}")
}
