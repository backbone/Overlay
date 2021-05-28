# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"
VALA_MIN_API_VERSION="0.20"

inherit autotools eutils git-r3 vala

DESCRIPTION="Documentation generator for Vala source code"
HOMEPAGE="https://live.gnome.org/Valadoc"
EGIT_REPO_URI="https://github.com/GNOME/valadoc.git"

LICENSE="GPL-2"
SLOT="1.0"
KEYWORDS=""
IUSE=""

RDEPEND="
	>=dev-lang/vala-0.20
	>=dev-libs/glib-2.24:2
	>=dev-libs/libgee-0.8:0.8
	>=media-gfx/graphviz-2.16
"
DEPEND="${RDEPEND}
	$(vala_depend)
	virtual/pkgconfig
"

src_prepare() {
	eautoreconf
	vala_src_prepare
}

src_configure() {
	econf --disable-static
}

src_install() {
	default
	prune_libtool_files
}
