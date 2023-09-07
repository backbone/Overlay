# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI=${EGIT_REPO_URI:-"https://git.backbone.ws/kolan/obsolete.gentoo-network-profile.git"}
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI="https://git.backbone.ws/kolan/obsolete.gentoo-network-profile/archive/v${PVR}.tar.gz -> gentoo-network-profile-${PVR}.tar.gz"
	KEYWORDS="-* ~x86 ~amd64"
fi

DESCRIPTION="Gentoo network profiling"

HOMEPAGE="https://git.backbone.ws/kolan/obsolete.gentoo-network-profile"

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
