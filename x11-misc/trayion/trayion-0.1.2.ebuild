# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

DESCRIPTION="FreeDesktop trayicon area for Ion3"
HOMEPAGE="http://code.google.com/p/trayion/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/libX11"

src_compile() {
	emake -j1 || die 'emake failed.'
}

src_install(){
	emake \
		prefix="${D}/usr" \
		INSTALL="/usr/bin/install" \
		X11_PREFIX=/usr \
		install || die 'failed emake install.'
	dodoc AUTHORS README || die 'failed dodoc.'
}
