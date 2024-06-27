# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
inherit linux-mod-r1 python-single-r1

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
KEYWORDS=""

IUSE="python test"

RDEPEND="${PYTHON_DEPS}
	x11-libs/libdrm
	python? (
		$(python_gen_cond_dep '
			dev-python/pybind11[${PYTHON_USEDEP}]
			test? (
				dev-python/pytest-mock[${PYTHON_USEDEP}]
			)
		')
	)
"

DEPEND="${RDEPEND}
	sys-kernel/linux-headers
"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RESTRICT="!test? ( test )"

CONFIG_CHECK="~FB_VIRTUAL ~I2C"

PATCHES=(
	"${FILESDIR}/${PN}-1.14.4-format-truncation.patch"
	"${FILESDIR}"/linux_src_path.patch
)

pkg_setup() {
	linux-mod-r1_pkg_setup
	use python && python-single-r1_pkg_setup
}

src_compile() {
	local modlist=(
		"evdi=video:${S}/module"
	)
	linux-mod-r1_src_compile

	emake library
	ln -srf "${S}/library/libevdi.so"{".$(ver_cut 1)",} || die

	use python && emake pyevdi
}

src_test() {
	use python && emake -C pyevdi tests
}

src_install() {
	linux-mod-r1_src_install

	dolib.so "library/libevdi.so.${PV}"

	dosym "libevdi.so.${PV}" "/usr/$(get_libdir)/libevdi.so.$(ver_cut 1)"
	dosym "libevdi.so.$(ver_cut 1)" "/usr/$(get_libdir)/libevdi.so"

	use python && DESTDIR="${D}" emake -C pyevdi install
}
