REQUIRED_DISTRO_FEATURES:remove:stcommon = "x11"

RDEPENDS_PACKAGEGROUP_MINIMAL = "\
    packagegroup-self-hosted-sdk \
    packagegroup-self-hosted-debug \
    packagegroup-self-hosted-extended \
    packagegroup-self-hosted-host-tools \
    "
RDEPENDS:packagegroup-self-hosted:stcommon = "${RDEPENDS_PACKAGEGROUP_MINIMAL}"


RDEPENDS_PACKAGEGROUP_GRAPHICS_MINIMAL = ""
RDEPENDS:packagegroup-self-hosted-graphics:stcommon = "${RDEPENDS_PACKAGEGROUP_GRAPHICS_MINIMAL}"

RDEPENDS_PACKAGEGROUP_EXTENDED_MINIMAL = "settings-daemon"
RDEPENDS:packagegroup-self-hosted-extended:remove:stcommon = "${RDEPENDS_PACKAGEGROUP_EXTENDED_MINIMAL}"