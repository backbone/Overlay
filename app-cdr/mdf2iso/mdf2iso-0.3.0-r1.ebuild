# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-cdr/mdf2iso/Attic/mdf2iso-0.3.0-r1.ebuild,v 1.8 2009/12/01 19:54:35 vostorga dead $

inherit autotools eutils

DESCRIPTION="Alcohol 120% bin image to ISO image file converter"
HOMEPAGE="http://mdf2iso.berlios.de/"
SRC_URI="mirror://berlios/${PN}/${P}-src.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""

S=${WORKDIR}/${PN}

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}-bigfiles.patch
	eautoreconf
}

src_install() {
	dobin src/${PN} || die "dobin failed."
	dodoc ChangeLog
}
