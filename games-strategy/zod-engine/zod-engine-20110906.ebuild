# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
WX_GTK_VER="2.8"
inherit eutils wxwidgets gnome2-utils games

MY_P=zod_gentoo-${PV:0:4}-${PV:4:2}-${PV:6:2}
DESCRIPTION="Zod engine is a remake of the 1996 classic game by Bitmap Brothers called Z"
HOMEPAGE="http://zod.sourceforge.net/"
SRC_URI="mirror://sourceforge/zod/${MY_P}.tar.xz"

LICENSE="GPL-3 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+editor +launcher"

RDEPEND="
	media-libs/libsdl[X,audio,video]
	media-libs/sdl-ttf[X]
	media-libs/sdl-mixer[mp3,timidity,vorbis,wav]
	media-libs/sdl-image[png]
	virtual/mysql
	x11-libs/wxGTK:${WX_GTK_VER}[X]"
DEPEND="${RDEPEND}"
PDEPEND="~games-strategy/zod-engine-data-${PV}"

S=${WORKDIR}/${MY_P}/zod_engine

src_compile() {
	emake -C zod_src DATA_PATH="\"${GAMES_DATADIR}/${PN}\"" main $(usex editor "map_editor" "")
	use launcher && emake -C zod_launcher_src DATA_PATH="\"${GAMES_DATADIR}/${PN}\""
}

src_install() {
	dogamesbin zod_src/zod
	dodoc zod_engine_help.txt

	if use editor ; then
		dogamesbin zod_src/zod_map_editor
		dodoc map_editor_help.txt
	fi

	if use launcher ; then
		dogamesbin zod_launcher_src/zod_launcher
		newicon -s 32 zod_launcher_src/icon.png ${PN}.png
		make_desktop_entry zod_launcher "Zod Engine"
	fi

	prepgamesdirs
}

pkg_preinst() {
	games_pkg_preinst
	gnome2_icon_savelist
}

pkg_postinst() {
	games_pkg_postinst
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
