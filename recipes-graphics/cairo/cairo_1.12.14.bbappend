PRINC := "${@int(PRINC) + 1}"

PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
           ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
           ${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}"

PACKAGECONFIG[wayland] = "--enable-egl=yes --enable-glesv2,,wayland"

CFLAGS += " -DLINUX=1 -DEGL_API_FB -DEGL_API_WL "
