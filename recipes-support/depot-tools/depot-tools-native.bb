DESCRIPTION = "depot tools"
LICENSE = "Apache-2"

inherit native

LIC_FILES_CHKSUM = "file://LICENSE;md5=c2c05f9bdd5fc0b458037c2d1fb8d95e"

SRCREV="682d0d7378c6a318668e7732497f44ba16b4c768"

SRC_URI = "git://chromium.googlesource.com/chromium/tools/depot_tools.git;protocol=https"

S="${WORKDIR}/git"

do_configure() {
}

do_compile() {
}

do_install() {
    install -d ${D}${bindir}/depot_tools/
    cp -r ${S}/* ${D}${bindir}/depot_tools/
}

FILES_${PN} = "${bindir}/depot_tools/"
