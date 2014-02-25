#!/bin/sh
if [ ! -e $BUILDDIR/conf/local.conf ]; then
    echo -e "\n ERROR - No build directory is set yet. Run the 'setup-environment' script before running this script to create " $BUILD_DIR
    echo -e "\n"
    return 1
fi

clean_up()
{
    unset clean_up
}


# Run this part only the first time the script is executed
if [ ! -e $BUILDDIR/conf/local.conf.org2 ]; then
    cp $BUILDDIR/conf/local.conf $BUILDDIR/conf/local.conf.org2

    echo "##Test yocot layer" >> $BUILDDIR/conf/bblayers.conf
    echo "BBLAYERS += \" \${BSPDIR}/sources/meta-test \"" >> $BUILDDIR/conf/bblayers.conf

    echo >> $BUILDDIR/conf/local.conf
    echo "LICENSE_FLAGS_WHITELIST += \"commercial\"" >> $BUILDDIR/conf/local.conf
    echo >> $BUILDDIR/conf/local.conf

    echo "IMAGE_INSTALL_append = \" chromium-wayland \"" >> $BUILDDIR/conf/local.conf
    echo "IMAGE_INSTALL_append = \" dropbear \"" >> $BUILDDIR/conf/local.conf
    echo "IMAGE_INSTALL_append = \" connman \"" >> $BUILDDIR/conf/local.conf
    echo "IMAGE_INSTALL_append = \" bash \"" >> $BUILDDIR/conf/local.conf
    echo >> $BUILDDIR/conf/local.conf

    echo "RM_WORK_EXCLUDE += \" chromium-wayland\"" >> $BUILDDIR/conf/local.conf
    echo >> $BUILDDIR/conf/local.conf

    echo "INHERIT += \"rm_work\"" >> $BUILDDIR/conf/local.conf


else
    echo -e "\n Existing build already configured - to reconfigure - delete " $BUILDDIR
    echo -e "\n Rerun setup-environment then rerun chromium-setup.sh"
    echo -e "\n Configure multiple backends with different directory names like build-fb, build-dfb"
    return 1
fi


cd  $BUILDDIR
clean_up
