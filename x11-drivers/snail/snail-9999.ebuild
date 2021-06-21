# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

EGIT_REPO_URI="https://git.backbone.ws/kolan/snail.git"

[[ 9999 == ${PV} ]] && vcs=git-r3

inherit $vcs eutils

if [[ 9999 != ${PV} ]]; then
	SRC_URI="https://git.backbone.ws/kolan/snail/archive/v${PVR}.tar.gz -> snail-${PVR}.tar.gz"
	KEYWORDS="-* ~x86 ~amd64"
fi

DESCRIPTION="Snail - nVidia Optimus support"
HOMEPAGE="https://git.backbone.ws/kolan/Snail"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="x11-drivers/nvidia-drivers
        sys-power/bbswitch
        sys-apps/dmidecode"

RDEPEND="${DEPEND}"

src_prepare() {
	if [[ 9999 == ${PV} ]] ; then
		# Allow user patches to be applied without modifying the ebuild
		epatch_user
	fi
}

src_install() {
	if [[ 9999 == ${PV} ]] ; then
		emake install DESTDIR="${D}"
	else
		emake install DESTDIR="${D}" || die
	fi
}

pkg_postinst() {
	snail.configure
}
