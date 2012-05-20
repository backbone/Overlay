# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI=${EGIT_REPO_URI:-"git://github.com/backbone/findcruftfiles.git"}
	inherit git-2
	KEYWORDS=""
else
	SRC_URI="ftp://backbone.ws/projects/findcruftfiles/${P}.tar.bz2"
	KEYWORDS="-* ~x86 ~amd64"
fi

DESCRIPTION="Automated Gentoo upgrading"

HOMEPAGE="https://chili.backbone.ws/projects/findcruftfiles"

SLOT="0"

LICENSE="GPL-3"

IUSE=""

DEPEND=""

RDEPEND="${DEPEND}"

src_prepare() {
	if [[ ${PV} == "9999" ]] ; then
		# Allow user patches to be applied without modifying the ebuild
		epatch_user
	fi
}

src_install() {
	if [[ ${PV} == "9999" ]] ; then
		emake install DESTDIR="${D}"
	else
		emake install DESTDIR="${D}" || die
	fi
}
