# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI=${EGIT_REPO_URI:-"git://git.backbone.ws/linux-fonts/corefonts-lucon.git"}
	inherit git-2
	KEYWORDS=""
else
	SRC_URI="https://git.backbone.ws/linux-fonts/corefonts-lucon/archive-tarball/v${PV} -> corefonts-lucon-${PV}.tar.gz"
	KEYWORDS="-* x86 amd64"
fi

DESCRIPTION="Lucida Console fonts"

HOMEPAGE=""

SLOT="0"

LICENSE="EULA"

IUSE=""

DEPEND=""

RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${WORKDIR}"
	mv linux-fonts-corefonts-lucon ${P}
}

src_install() {
	if [[ ${PV} == "9999" ]] ; then
		emake install DESTDIR="${D}"
	else
		emake install DESTDIR="${D}" || die
	fi
}
