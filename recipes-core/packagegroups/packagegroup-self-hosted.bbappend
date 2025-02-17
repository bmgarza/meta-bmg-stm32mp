REQUIRED_DISTRO_FEATURES:remove:stm32mp-qemuarm64 = "x11"

RDEPENDS:packagegroup-self-hosted:stm32mp-qemuarm64 = "\
    packagegroup-self-hosted-sdk \
    packagegroup-self-hosted-debug \
    packagegroup-self-hosted-extended \
    packagegroup-self-hosted-host-tools \
    "

RDEPENDS:packagegroup-self-hosted-graphics:stm32mp-qemuarm64 = ""

RDEPENDS:packagegroup-self-hosted-extended:remove:stm32mp-qemuarm64 = "settings-daemon"