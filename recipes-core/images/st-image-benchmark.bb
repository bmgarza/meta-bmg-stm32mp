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

# pts/sqlite
# pts/ramspeed
# pts/cython-bench
# pts/network-loopback

#
# INSTALL addons
#
CORE_IMAGE_EXTRA_INSTALL += " \
    phoronix-test-suite \
    tmux \
    htop \
    python3 \
    python3-datetime \
    python3-dateutil \
    python3-distutils \
    python3-email \
    python3-fcntl \
    python3-io \
    python3-logging \
    python3-misc \
    python3-numbers \
    python3-pycairo \
    python3-pygobject \
    python3-pyparsing \
    python3-shell \
    python3-stringold \
    python3-threading \
    python3-unittest \
    python3-pyyaml \
    python3-pexpect \
    python3-evdev \
    "
