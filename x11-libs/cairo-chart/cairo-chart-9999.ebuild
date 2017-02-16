# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI=${EGIT_REPO_URI:-"git://git.backbone.ws/gtk/cairo-chart.git"}
	inherit git-r3
	KEYWORDS=""
else
	#SRC_URI="ftp://ftp.backbone.ws/projects/cairo-chart/${P}.tar.bz2"
	SRC_URI="https://git.backbone.ws/gtk/cairo-chart/archive-tarball/v${PVR}.tgz -> cairo--chart-${PVR}.tar.gz"
	KEYWORDS="-* ~x86 ~amd64"
fi

DESCRIPTION="GtkChart for Gtk.DrawingArea (Cairo)."

HOMEPAGE="https://redmine.backbone.ws/projects/cairo-chart"

SLOT="0"

LICENSE="LGPL-3"

IUSE=""

DEPEND=">=dev-lang/vala-0.26
	>=x11-libs/gtk+-3.20"

RDEPEND="${DEPEND}"
