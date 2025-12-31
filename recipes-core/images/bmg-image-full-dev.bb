SUMMARY = "OpenSTLinux core image."
LICENSE = "Proprietary"

include recipes-st/images/st-image.inc

inherit core-image

# ST_BOOTFS   = "0"
# We don't want any additional partitions created on the ST platform.
ST_VENDORFS:st-common = "0"
ST_USERFS:st-common   = "0"

# Update the userfs size to be a maximum of 4GB
STM32MP_USERFS_SIZE:st-common = "4194304"

IMAGE_LINGUAS = "en-us"

IMAGE_FEATURES += "\
    package-management  \
    ssh-server-dropbear \
    "

#
# INSTALL addons
#
IMAGE_INSTALL += " \
    packagegroup-self-hosted \
    \
    systemd-analyze \
    vim \
    tmux \
    dtc \
    \
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
    \
    networkmanager \
    "
