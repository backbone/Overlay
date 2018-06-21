# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools gnome.org

DESCRIPTION="XML parser and writer, providing both Vala and C object oriented API through GObject"
HOMEPAGE="https://wiki.gnome.org/GXml"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	dev-libs/libxml2
	sys-devel/gettext
"
DEPEND="${RDEPEND}
	dev-libs/glib
	dev-libs/libgee
	virtual/pkgconfig
"
