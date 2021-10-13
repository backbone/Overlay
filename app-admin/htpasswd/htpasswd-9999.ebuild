# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit eutils

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI=${EGIT_REPO_URI:-"https://git.backbone.ws/kolan/htpasswd.git"}
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI="https://git.backbone.ws/kolan/htpasswd/archive/v${PVR}.tar.gz -> htpasswd-${PVR}.tar.gz"
	KEYWORDS="-* ~x86 ~amd64"
fi

DESCRIPTION="Automated Gentoo upgrading"

HOMEPAGE="https://git.backbone.ws/kolan/htpasswd"

SLOT="0"

LICENSE="GPL-3"

IUSE=""

DEPEND=""

RDEPEND="${DEPEND}"

src_prepare() {
	if [[ ${PV} == "9999" ]] ; then
		# Allow user patches to be applied without modifying the ebuild
		eapply_user
	fi
}

src_install() {
	if [[ ${PV} == "9999" ]] ; then
		emake install DESTDIR="${D}"
	else
		emake install DESTDIR="${D}" || die
	fi
}
