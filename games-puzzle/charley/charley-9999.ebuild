# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI=${EGIT_REPO_URI:-"git://github.com/masterfri/Charley.git"}
	inherit git-r3
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

INSTALL_BASE="usr"

src_compile() {
	make PREFIX=/usr
}

src_install() {
	local BASE=${INSTALL_BASE}

	mkdir -p ${D}/${BASE}/share/charleygame
	cp -R build/*/ ${D}/${BASE}/share/charleygame
	mkdir -p ${D}/${BASE}/bin
	cp build/charleygame-bin ${D}/${BASE}/bin

	chmod a+x ${D}/${BASE}/bin/charleygame-bin

	mkdir -p ${D}/${BASE}/bin
	chmod a+x ${D}/${BASE}/bin/charleygame-bin.sh
}
