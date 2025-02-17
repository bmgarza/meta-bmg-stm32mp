DESCRIPTION += "This recipe doesn't do anything."
LICENSE = "MIT"

# Any of the recipes included within this DEPENDS variable are going to be built
# before this "recipe" is build. Thus making it into a batch build so that the
# recipes don't have to be parsed multiple times.
DEPENDS += " phoronix-test-suite-native "
RDEPENDS:${PN} += " phoronix-test-suite "

do_compile() {
    phoronix-test-suite user-config-set "EnvironmentDirectory=${D}/var/lib/phoronix-test-suite/"
    phoronix-test-suite install pts/sqlite
}
