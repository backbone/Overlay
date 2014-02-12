# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/vala/vala-0.23.2.ebuild,v 1.4 2013/12/22 15:48:13 jer Exp $

EAPI="5"
GCONF_DEBUG="no"

inherit gnome2

DESCRIPTION="Compiler for the GObject type system"
HOMEPAGE="https://wiki.gnome.org/Vala"

LICENSE="LGPL-2.1"
SLOT="0.23"
KEYWORDS="~alpha amd64 ~arm hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc x86 ~amd64-fbsd ~x86-fbsd ~arm-linux ~x86-linux"
IUSE="test +vapigen"

RDEPEND="
	>=dev-libs/glib-2.18:2
	>=dev-libs/vala-common-${PV}
"
DEPEND="${RDEPEND}
	!${CATEGORY}/${PN}:0
	dev-libs/libxslt
	sys-devel/flex
	virtual/pkgconfig
	virtual/yacc
	test? (
		dev-libs/dbus-glib
		>=dev-libs/glib-2.26:2 )
"

src_configure() {
	DOCS="AUTHORS ChangeLog MAINTAINERS NEWS README"
	gnome2_src_configure \
		--disable-unversioned \
		$(use_enable vapigen)
}
