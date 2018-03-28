# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI=${EGIT_REPO_URI:-"https://git.backbone.ws/kolan/gobject-plugin.git"}
	inherit git-r3
	KEYWORDS=""
else
	#SRC_URI="ftp://ftp.backbone.ws/projects/gobject-plugin/${P}.tar.bz2"
	SRC_URI="https://git.backbone.ws/kolan/gobject-plugin/archive/v${PVR}.tar.gz -> gobject-plugin-${PVR}.tar.gz"
	KEYWORDS="-* ~x86 ~amd64"
fi

DESCRIPTION="Host/Plugin Interfaces for GObject Based Applications/Libraries."

HOMEPAGE="https://git.backbone.ws/kolan/gobject-plugin"

SLOT="0"

LICENSE="LGPL-3"

IUSE=""

DEPEND=">=dev-lang/vala-0.26
	>=dev-libs/glib-2.40
	>=dev-libs/libgee-0.16"

RDEPEND="${DEPEND}"
