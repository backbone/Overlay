# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI=${EGIT_REPO_URI:-"git://git.backbone.ws/gtk/gtkchart.git"}
	inherit git-r3
	KEYWORDS=""
else
	#SRC_URI="ftp://ftp.backbone.ws/projects/gtkchart/${P}.tar.bz2"
	SRC_URI="https://git.backbone.ws/gtk/gtkchart/archive-tarball/v${PVR}.tgz -> gtk-chart-${PVR}.tar.gz"
	KEYWORDS="-* ~x86 ~amd64"
fi

DESCRIPTION="GtkChart for Gtk.DrawingArea."

HOMEPAGE="https://redmine.backbone.ws/projects/gtkchart"

SLOT="0"

LICENSE="LGPL-3"

IUSE=""

DEPEND=">=dev-lang/vala-0.26
	>=dev-libs/gtk+-3.20"

RDEPEND="${DEPEND}"
