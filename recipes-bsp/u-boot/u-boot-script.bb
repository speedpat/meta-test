LICENSE = "closed"
LIC_FILES_CHKSUM = "file://license;md5=0c26108d29f701848fe87a821513d2b2"
COMPATIBLE_MACHINE = "(imx6dlsabresd|imx6qsabresd)"
DEPENDS = "u-boot-mkimage-native"

PV = "1.0"

SRC_URI = "file://boot.cmd file://license"

S = "${WORKDIR}"

inherit deploy

do_mkimage () {
    uboot-mkimage  -A arm -O linux -T script -C none -a 0 -e 0 \
                   -n "boot script" -d boot.cmd \
                   boot.scr

}

addtask mkimage after do_compile before do_install

do_deploy () {
    install -d ${DEPLOYDIR}
    install ${S}/boot.scr \
            ${DEPLOYDIR}/boot.scr

}

addtask deploy after do_install before do_build

do_compile[noexec] = "1"
do_install[noexec] = "1"
do_populate_sysroot[noexec] = "1"

PACKAGE_ARCH = "${MACHINE_ARCH}"
