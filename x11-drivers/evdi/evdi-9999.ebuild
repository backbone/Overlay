# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-mod

DESCRIPTION="Extensible Virtual Display Interface"
HOMEPAGE="https://github.com/DisplayLink/evdi"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI=${EGIT_REPO_URI:-"https://github.com/DisplayLink/evdi.git"}
	EGIT_BRANCH="main"
	inherit git-r3
	KEYWORDS=""
else
    SRC_URI="https://github.com/DisplayLink/evdi/archive/v${PV}.tar.gz -> ${P}.tar.gz"
    KEYWORDS=""
fi

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="x11-libs/libdrm"
DEPEND="${RDEPEND}
	sys-kernel/linux-headers"

MODULE_NAMES="evdi(video:${S}/module)"

#CONFIG_CHECK="~FB_VIRTUAL ~!INTEL_IOMMU"
CONFIG_CHECK="~FB_VIRTUAL ~I2C DRM ~USB_SUPPORT USB_ARCH_HAS_HCD"

PATCHES=(
	"${FILESDIR}"/linux_src_path.patch
)

pkg_setup() {
	linux-mod_pkg_setup
}

src_compile() {
	linux-mod_src_compile
	cd "${S}/library"
	default
	#mv libevdi.so libevdi.so.${PV}
}

src_install() {
	linux-mod_src_install
	FNAME=library/libevdi.so.1.[0-9]*.*
	BASENAME=$(basename $FNAME)
	dolib.so $FNAME
	dosym $BASENAME "/usr/$(get_libdir)/libevdi.so.1"
	dosym libevdi.so.1 "/usr/$(get_libdir)/libevdi.so"
}
