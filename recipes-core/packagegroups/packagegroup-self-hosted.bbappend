
#region ST specific changes
# NOTE: BMG (Dec. 16, 2025) We want to remove any dependencies on graphics
# functionality and we also want to remove any potential conflicts that arrise
# from including this package on the openstlinux-weston distribution
REQUIRED_DISTRO_FEATURES:remove:stcommon = " x11 opengl "
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
#endregion
