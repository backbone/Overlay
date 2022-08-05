# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit gnome2-utils cmake

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI=${EGIT_REPO_URI:-"https://git.backbone.ws/kolan/LAview.Desktop.git"}
	inherit git-r3
	KEYWORDS=""
else
	#SRC_URI="ftp://ftp.backbone.ws/projects/LAview.Desktop/${P}.tar.bz2"
	SRC_URI="https://git.backbone.ws/kolan/LAview.Desktop/archive/v${PVR}.tar.gz -> laview-desktop-${PVR}.tar.gz"
	KEYWORDS="-* ~x86 ~amd64"
fi

DESCRIPTION="LAview Desktop Application."

HOMEPAGE="https://git.backbone.ws/kolan/LAview.Desktop"

SLOT="0"

LICENSE="LGPL-3"

IUSE="examples"

DEPEND="app-office/laview-core
	x11-libs/gtk+:3"

RDEPEND="${DEPEND}
	examples? ( app-office/laview-object-example )"

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_schemas_update
}

pkg_postrm() {
	gnome2_schemas_update
}
