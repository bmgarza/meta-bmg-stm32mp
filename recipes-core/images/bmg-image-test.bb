SUMMARY = "An image meant for testing."
LICENSE = "Proprietary"

include recipes-core/images/core-image-minimal.bb

inherit core-image

IMAGE_LINGUAS = "en-us"

IMAGE_INSTALL += " \
    systemd-analyze \
    vim \
    "
