# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit eutils

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI=${EGIT_REPO_URI:-"https://github.com/pagekite/Colormake.git"}
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI="${HOMEPAGE}${P}.tar.gz"
	KEYWORDS="-* ~x86 ~amd64"
fi

DESCRIPTION="Colorizing wrapper around make"

HOMEPAGE="http://bre.klaki.net/programs/colormake/"

SLOT="0"

LICENSE="GPL-2"

IUSE=""

DEPEND=""

RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-cmake.patch
	if [[ ${PV} == "9999" ]] ; then
		# Allow user patches to be applied without modifying the ebuild
		epatch_user
	fi
}

src_install() {
	dobin colormake{,.pl} || die
}
