# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools

DESCRIPTION="GXml library"
HOMEPAGE="https://wiki.gnome.org/GXml"
SRC_URI="https://github.com/GNOME/${PN}/archive/${PV}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	default
	mv "${WORKDIR}/gxml-${PV}" "${S}"
}

src_prepare() {
	default
	./autogen.sh || die
}
