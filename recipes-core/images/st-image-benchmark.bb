SUMMARY = "OpenSTLinux core image."
LICENSE = "Proprietary"

include recipes-st/images/st-image.inc

inherit core-image

IMAGE_LINGUAS = "en-us"

IMAGE_FEATURES += "\
    package-management  \
    ssh-server-dropbear \
    "

IMAGE_INSTALL += " packagegroup-self-hosted "

#
# INSTALL addons
#
CORE_IMAGE_EXTRA_INSTALL += " \
    phoronix-test-suite \
    tmux \
    htop \
    "
