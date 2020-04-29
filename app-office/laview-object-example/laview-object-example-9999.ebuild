# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils gnome2-utils

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI=${EGIT_REPO_URI:-"https://git.backbone.ws/kolan/LAview.Object-Example.git"}
	inherit git-r3
	KEYWORDS=""
else
	#SRC_URI="ftp://ftp.backbone.ws/projects/LAview.Object-Example/${P}.tar.bz2"
	SRC_URI="https://git.backbone.ws/kolan/LAview.Object-Example/archive/v${PVR}.tar.gz -> laview-object-example-${PVR}.tar.gz"
	KEYWORDS="-* ~x86 ~amd64"
fi

DESCRIPTION="LAview Object protocol plugin sample."

HOMEPAGE="https://git.backbone.ws/kolan/LAview.Object-Example"

SLOT="0"

LICENSE="LGPL-3"

IUSE=""

DEPEND="app-office/laview-core
	x11-libs/gtk+:3
	app-office/laview-data-example"

RDEPEND="${DEPEND}"

pkg_preinst() {
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_schemas_update
}

pkg_postrm() {
	gnome2_schemas_update
}
