DESCRIPTION += "This recipe doesn't do anything."
LICENSE = "MIT"

# Any of the recipes included within this DEPENDS variable are going to be built
# before this "recipe" is build. Thus making it into a batch build so that the
# recipes don't have to be parsed multiple times.
DEPENDS += " "

# Creating stubs for all functions so that this recipe doesn't actually do
# anything...
do_build() {
}
do_build_without_rm_work() {
}
do_checkuri() {
}
do_clean() {
}
do_cleanall() {
}
do_cleansstate() {
}
do_compile() {
}
do_configure() {
}
do_deploy_source_date_epoch() {
}
do_deploy_source_date_epoch_setscene() {
}
do_devshell() {
}
do_fetch() {
}
do_install() {
}
do_listtasks() {
}
do_package() {
}
do_package_qa() {
}
do_package_qa_setscene() {
}
do_package_setscene() {
}
do_package_write_deb() {
}
do_package_write_deb_setscene() {
}
do_packagedata() {
}
do_packagedata_setscene() {
}
do_patch() {
}
do_populate_lic() {
}
do_populate_lic_setscene() {
}
do_populate_sysroot() {
}
do_populate_sysroot_setscene() {
}
do_prepare_recipe_sysroot() {
}
do_pydevshell() {
}
do_rm_work() {
}
do_rm_work_all() {
}
do_unpack() {
}
