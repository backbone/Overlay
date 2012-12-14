# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI=${EGIT_REPO_URI:-"git://github.com/masterfri/Charley.git"}
	inherit git-2
	KEYWORDS=""
else
	SRC_URI="https://github.com/masterfri/charley/archive/${P}.zip"
	KEYWORDS="-* ~x86 ~amd64"
fi

DESCRIPTION="A ghost called Charley who wanders in deserted castle."

HOMEPAGE="http://masterfri.org.ua/charley/en/"

SLOT="0"

LICENSE="GPL-2"

IUSE=""

DEPEND="virtual/opengl
	media-libs/libsdl
	media-libs/sdl-image
	media-libs/sdl-mixer
	media-libs/sdl-ttf"

RDEPEND="${DEPEND}"

INSTALL_BASE="opt/Charley"

src_install() {
	local BASE=${INSTALL_BASE}

	mkdir -p ${D}/${BASE}
	cp -R build/* ${D}/${BASE}

	chmod a+x ${D}/${BASE}/charleygame-bin

	mkdir -p ${D}/usr/bin
	cp ${FILESDIR}/charleygame-bin.sh ${D}/usr/bin/charleygame-bin.sh
	chmod a+x ${D}/usr/bin/charleygame-bin.sh
}
