# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"

DESCRIPTION="Emerge (-e) World Optimizer (EWO)"
HOMEPAGE="http://ewo-gentoo.googlecode.com/"
SRC_URI="https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/ewo-gentoo/${P}.tar.bz2"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"
IUSE=""
RDEPEND="app-portage/genlop"
DEPEND=""

RESTRICT="primaryuri"

src_prepare() {
	eapply_user "${FILESDIR}/fix_empty_genlop_output.patch"
}

src_install() {
	newsbin ${PN}.py ${PN} || die "Install failed"
	dodoc AUTHORS README
}

pkg_postinst() {
	einfo "For details about using this tool, see:"
	einfo "${HOMEPAGE}"
}
