# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"

inherit eutils

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI=${EGIT_REPO_URI:-"https://git.backbone.ws/kolan/corefonts-lucidaconsole.git"}
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI="https://git.backbone.ws/kolan/corefonts-lucidaconsole/archive/v${PV}.tar.gz -> corefonts-lucon-${PV}.tar.gz"
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
	mv corefonts-lucidaconsole ${P}
}

src_install() {
	if [[ ${PV} == "9999" ]] ; then
		emake install DESTDIR="${D}"
	else
		emake install DESTDIR="${D}" || die
	fi
}
