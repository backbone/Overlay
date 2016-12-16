# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="4"
inherit eutils

DESCRIPTION="Gtk+ Widgets for live display of large amounts of fluctuating numerical data"
HOMEPAGE="https://sourceforge.net/projects/gtkdatabox/"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI=${EGIT_REPO_URI:-"git://github.com/erikd/gtkdatabox.git"}
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="LGPL-2.1"
SLOT="0"
IUSE="doc examples +glade static-libs test"

RDEPEND="
	glade? (
		gnome-base/libglade
	)
	x11-libs/cairo
	x11-libs/gtk+:3
	x11-libs/pango
"
DEPEND=${RDEPEND}

src_prepare() {
	./autogen.sh || die "autogen failed"

	# Remove -D.*DISABLE_DEPRECATED cflags
	find . -iname 'Makefile.am' -exec \
		sed -e '/-D[A-Z_]*DISABLE_DEPRECATED/d' -i {} + || die "sed 1 failed"
	# Do Makefile.in after Makefile.am to avoid automake maintainer-mode
	find . -iname 'Makefile.in' -exec \
		sed -e '/-D[A-Z_]*DISABLE_DEPRECATED/d' -i {} + || die "sed 2 failed"
	sed -e '/SUBDIRS/{s: examples::;}' -i Makefile.am -i Makefile.in || die
}

src_configure() {
	econf \
		$(use_enable doc gtk-doc) \
		#$(use_enable glade libglade) \
		$(use_enable glade) \
		$(use_enable static-libs static) \
		$(use_enable test gtktest) \
		--disable-dependency-tracking \
		--enable-libtool-lock
}

src_install() {
	default

	prune_libtool_files

	dodoc AUTHORS ChangeLog README TODO
	if use examples; then
		docinto examples
		dodoc "${S}"/examples/*
	fi
}
