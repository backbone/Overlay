# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

SRC_URI="http://files.backbone.ws/projects/labview/${P}.tar.bz2"
KEYWORDS="-* x86 amd64"

DESCRIPTION="LabVIEW System Design Software"

HOMEPAGE="http://www.ni.com/labview"

SLOT="0"

LICENSE="GPL-3"

IUSE=""

DEPEND=""

RDEPEND="${DEPEND}"

src_install() {
	emake install DESTDIR="${D}" || die
}
