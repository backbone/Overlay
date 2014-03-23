# no-lto
if [[ true != false
&& ${CATEGORY}/${PN} != sys-apps/sandbox
&& ${CATEGORY}/${PN} != sys-apps/sysvinit
&& ${CATEGORY}/${PN} != dev-lang/perl
&& ${CATEGORY}/${PN} != sys-apps/gawk
&& ${CATEGORY}/${PN} != sys-apps/coreutils
&& ${CATEGORY}/${PN} != dev-libs/elfutils
&& ${CATEGORY}/${PN} != sys-apps/shadow
&& ${CATEGORY}/${PN} != dev-lang/python
&& ${CATEGORY}/${PN} != dev-libs/glib
&& ${CATEGORY}/${PN} != sys-fs/e2fsprogs
&& ${CATEGORY}/${PN} != net-misc/openssh
&& ${CATEGORY}/${PN} != sys-apps/hdparm
&& ${CATEGORY}/${PN} != sys-apps/hwinfo
&& ${CATEGORY}/${PN} != media-libs/alsa-lib
&& ${CATEGORY}/${PN} != dev-util/valgrind
&& ${CATEGORY}/${PN} != sys-fs/mtools
&& ${CATEGORY}/${PN} != dev-libs/boost
&& ${CATEGORY}/${PN} != app-text/rarian
&& ${CATEGORY}/${PN} != net-analyzer/nmap
&& ${CATEGORY}/${PN} != sys-apps/pciutils
&& ${CATEGORY}/${PN} != sys-devel/distcc
&& ${CATEGORY}/${PN} != media-libs/libcdr
&& ${CATEGORY}/${PN} != media-libs/libvisio
&& ${CATEGORY}/${PN} != sys-devel/llvm
&& ${CATEGORY}/${PN} != app-admin/sudo
&& ${CATEGORY}/${PN} != x11-base/xorg-server
&& ${CATEGORY}/${PN} != sys-power/upower
&& ${CATEGORY}/${PN} != dev-qt/qtdeclarative
&& ${CATEGORY}/${PN} != media-libs/mesa
&& ${CATEGORY}/${PN}-${PV} != dev-lang/spidermonkey-1.8.5
&& ${CATEGORY}/${PN} != games-action/minetest
&& ${CATEGORY}/${PN} != app-emulation/wine
&& ${CATEGORY}/${PN} != app-emulation/virtualbox
&& ${CATEGORY}/${PN} != media-video/ffmpeg
&& ${CATEGORY}/${PN} != x11-libs/wxGTK
&& ${CATEGORY}/${PN} != www-client/firefox
&& ${CATEGORY}/${PN} != mail-client/thunderbird
&& ${CATEGORY}/${PN} != dev-tex/luatex
&& ${CATEGORY}/${PN} != dev-python/notify-python
&& ${CATEGORY}/${PN} != media-plugins/audacious-plugins
&& ${CATEGORY}/${PN} != media-video/avidemux
&& ${CATEGORY}/${PN} != media-video/mplayer
&& ${CATEGORY}/${PN} != media-video/mplayer2
&& ${CATEGORY}/${PN} != media-libs/avidemux-plugins
&& ${CATEGORY}/${PN} != net-p2p/eiskaltdcpp
&& ${CATEGORY}/${PN} != dev-qt/qtwebkit
&& ${CATEGORY}/${PN} != net-libs/webkit-gtk
&& ${CATEGORY}/${PN} != media-libs/avidemux-core
&& ${CATEGORY}/${PN} != dev-libs/libaio  # Required by Qemu
&& ${CATEGORY}/${PN} != dev-games/simgear
&& ${CATEGORY}/${PN} != dev-qt/qtgui
&& ${CATEGORY}/${PN} != dev-libs/libbsd
&& ${CATEGORY}/${PN} != app-misc/vlock
&& ${CATEGORY}/${PN} != app-cdr/cdrtools
&& ${CATEGORY}/${PN} != dev-vcs/cvs
&& ${CATEGORY}/${PN} != media-libs/flac
&& ${CATEGORY}/${PN} != sys-process/audit
&& ${CATEGORY}/${PN} != dev-cpp/libcmis
&& ${CATEGORY}/${PN} != sys-fs/e4rat
&& ${CATEGORY}/${PN} != app-antivirus/clamav
&& ${CATEGORY}/${PN} != sys-boot/grub
&& ${CATEGORY}/${PN} != dev-qt/qtscript
&& ${CATEGORY}/${PN} != sys-libs/gpm
&& ${CATEGORY}/${PN} != dev-libs/xmlrpc-c
&& ${CATEGORY}/${PN} != media-tv/v4l-utils
&& ${CATEGORY}/${PN} != x11-drivers/xf86-video-intel
&& ${CATEGORY}/${PN} != media-gfx/fbida
&& ${CATEGORY}/${PN} != x11-misc/primus
&& ${CATEGORY}/${PN} != dev-lang/ruby
&& ${CATEGORY}/${PN} != sys-apps/kmod
&& ${CATEGORY}/${PN} != x11-misc/x11vnc
&& ${CATEGORY}/${PN} != x11-libs/gtkglext
&& ${CATEGORY}/${PN} != gnome-base/gvfs
]] ; then
    tmp="-flto=4"
    CFLAGS="${CFLAGS} ${tmp}"
    CXXFLAGS="${CXXFLAGS} ${tmp}"
    LDFLAGS="${LDFLAGS} ${tmp}"
fi

# No parallelize-loops-all
if [[ true != false
&& ${CATEGORY}/${PN} != dev-lang/perl
&& ${CATEGORY}/${PN} != sys-apps/gawk  # Internal error when emerging hyphen
&& ${CATEGORY}/${PN} != app-shells/bash
&& ${CATEGORY}/${PN} != sys-apps/groff
&& ${CATEGORY}/${PN} != media-libs/libogg
&& ${CATEGORY}/${PN} != dev-libs/openssl
&& ${CATEGORY}/${PN} != sys-libs/ncurses
&& ${CATEGORY}/${PN} != dev-libs/expat
&& ${CATEGORY}/${PN} != media-video/dirac
&& ${CATEGORY}/${PN} != dev-games/openscenegraph
&& ${CATEGORY}/${PN} != dev-vcs/subversion
&& ${CATEGORY}/${PN} != media-video/ffmpeg
&& ${CATEGORY}/${PN} != media-video/mjpegtools
&& ${CATEGORY}/${PN} != media-libs/gegl
&& ${CATEGORY}/${PN} != media-gfx/graphviz
&& ${CATEGORY}/${PN} != media-sound/audacious
&& ${CATEGORY}/${PN} != app-text/texlive-core
&& ${CATEGORY}/${PN} != media-video/mplayer
&& ${CATEGORY}/${PN} != media-video/mplayer2
&& ${CATEGORY}/${PN} != media-video/vlc
&& ${CATEGORY}/${PN} != media-libs/avidemux-core
&& ${CATEGORY}/${PN} != games-fps/nexuiz
&& ${CATEGORY}/${PN} != sys-apps/dbus
&& ${CATEGORY}/${PN} != dev-qt/qtgui
&& ${CATEGORY}/${PN} != media-gfx/inkscape
&& ${CATEGORY}/${PN} != dev-libs/glib  # epiphany hangs (GObject)
&& ${CATEGORY}/${PN} != www-client/firefox
&& ${CATEGORY}/${PN} != app-emulation/wine
&& ${CATEGORY}/${PN} != app-text/poppler # Evince hangs on www.fairchildsemi.com/ds/ND/NDS9435A.pdf
&& ${CATEGORY}/${PN} != media-libs/libmikmod
&& ${CATEGORY}/${PN} != media-libs/libvorbis
&& ${CATEGORY}/${PN} != media-libs/x264
&& ${CATEGORY}/${PN} != net-misc/openssh
&& ${CATEGORY}/${PN} != media-libs/sdl-mixer # Sauerbraten segfaults
&& ${CATEGORY}/${PN} != net-libs/webkit-gtk # Epiphany segfaults on 1.8.3, liferea segfaults when open contents in a new tab
&& ${CATEGORY}/${PN} != sci-libs/gdal # Out of memory when building the package
&& ${CATEGORY}/${PN} != dev-util/anjuta # anjuta-tags segfaults
&& ${CATEGORY}/${PN} != net-libs/libvncserver # Black rectangular artefacts in Remmina
&& ${CATEGORY}/${PN} != x11-base/xorg-server # Hangs in ~30% cases of Awesome Restarts (Ctrl+Alt+R)
&& ${CATEGORY}/${PN} != dev-util/valgrind # Fails to run any elf file
&& ${CATEGORY}/${PN} != net-p2p/transmission # Segfaults after ~1-2 minutes when downloading something big
&& ${CATEGORY}/${PN} != dev-libs/icu # Liferea segfaults on double click
&& ${CATEGORY}/${PN} != dev-tex/luatex # luatex segfaults
&& ${CATEGORY}/${PN} != media-plugins/audacious-plugins
]] ; then
    tmp="-floop-parallelize-all"
    CFLAGS="${CFLAGS} ${tmp}"
    CXXFLAGS="${CXXFLAGS} ${tmp}"
    LDFLAGS="${LDFLAGS} ${tmp}"
fi

# No OpenMP
if [[ true != false
&& ${CATEGORY}/${PN} != sys-apps/busybox
&& ${CATEGORY}/${PN} != media-libs/mesa
&& ${CATEGORY}/${PN} != app-emulation/wine
&& ${CATEGORY}/${PN} != dev-db/sqlite  # Required to emerge avidemux-core
]] ; then
    tmp="-fopenmp"
    CFLAGS="${CFLAGS} ${tmp}"
    CXXFLAGS="${CFLAGS} ${tmp}"
    LDFLAGS="${LDFLAGS} ${tmp}"
fi

# no-graphite
if [[ true != false
&& ${CATEGORY}/${PN} != undefined/undefined
&& ${CATEGORY}/${PN} != www-client/firefox
]] ; then
    tmp="-floop-interchange -ftree-loop-distribution -floop-strip-mine -floop-block"
    CFLAGS="${CFLAGS} ${tmp}"
    CXXFLAGS="${CXXFLAGS} ${tmp}"
    LDFLAGS="${LDFLAGS} ${tmp}"
fi

# fno-tree-vectorize
if [[ true != false
&& ${CATEGORY}/${PN} != undefined/undefined
&& ${CATEGORY}/${PN} != www-client/firefox
&& ${CATEGORY}/${PN} != x11-base/xorg-server # Artefacts in Dia (app-office/dia) when drawing an ellipse
&& ${CATEGORY}/${PN} != sys-devel/llvm
]] ; then
    tmp="-ftree-vectorize"
    CFLAGS="${CFLAGS} ${tmp}"
    CXXFLAGS="${CXXFLAGS} ${tmp}"
    LDFLAGS="${LDFLAGS} ${tmp}"
fi
