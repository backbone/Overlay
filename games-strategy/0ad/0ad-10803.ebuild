# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils wxwidgets games

MY_P="0ad-r${PV}-alpha"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="0 A.D. is a free, real-time strategy game currently under development by Wildfire Games."
HOMEPAGE="http://wildfiregames.com/0ad/"
SRC_URI="mirror://sourceforge/zero-ad/${MY_P}-unix-build.tar.xz
	mirror://sourceforge/zero-ad/${MY_P}-unix-data.tar.xz"

LICENSE="GPL-2 CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug editor pch test"

RDEPEND=">=dev-lang/spidermonkey-1.8.5
	dev-libs/boost
	dev-libs/libxml2
	media-libs/devil
	media-libs/openal
	media-libs/libogg
	media-libs/libpng
	media-libs/libsdl[joystick]
	media-libs/libvorbis
	net-libs/enet:1.3
	net-misc/curl
	sys-libs/zlib
	virtual/fam
	virtual/jpeg
	virtual/opengl
	editor? ( x11-libs/wxGTK:2.8 )"

DEPEND="${RDEPEND}
	app-arch/zip
	dev-lang/nasm
	dev-util/cmake"

RESTRICT="strip mirror"

dir=${GAMES_PREFIX_OPT}/${PN}

pkg_setup() {
	games_pkg_setup
	if use editor ; then
		WX_GTK_VER=2.8 need-wxwidgets unicode
	fi
}

src_prepare() {
	epatch "${FILESDIR}"/premake-archless.patch
	epatch "${FILESDIR}"/premake-script-archless.patch
}

src_compile() {
	UPDATE_ARGS="--with-system-enet --with-system-mozjs185"

	if ! use editor ; then
		UPDATE_ARGS="${UPDATE_ARGS} --disable-atlas"
	fi

	cd "${S}/build/workspaces"
	einfo "Running update-workspaces.sh with ${UPDATE_ARGS}"
	./update-workspaces.sh ${UPDATE_ARGS} || die "update-workspaces.sh failed"
	cd gcc

	TARGETS="pyrogenesis Collada"
	if use test ; then
		TARGETS="${TARGETS} test"
	fi
	if use editor ; then
		TARGETS="${TARGETS} AtlasUI"
	fi
	if use debug ; then
		CONFIG=Debug
	else
		CONFIG=Release
	fi
	CONFIG=${CONFIG} emake ${TARGETS} || die "Can't build"
}

src_test() {
	cd "${S}/binaries/system"
	if use debug ; then
		./test_dbg || die "Tests failed"
	else
		./test || die "Tests failed"
	fi
}

src_install() {
	cd "${S}"/binaries
	insinto "${dir}"
	doins -r data || die "doins -r failed"

	insinto "${dir}"/system

	doins "${S}"/binaries/system/libnvcore.so || die "doins failed"
	doins "${S}"/binaries/system/libnvimage.so || die "doins failed"
	doins "${S}"/binaries/system/libnvmath.so || die "doins failed"
	doins "${S}"/binaries/system/libnvtt.so || die "doins failed"

	if use debug ; then
#		doins "${S}"/binaries/system/libmozjs185-ps-debug.so.1.0 || die "doins failed"
		doins "${S}"/binaries/system/libCollada_dbg.so || die "doins failed"
		if use editor ; then
			doins "${S}"/binaries/system/libAtlasUI_dbg.so || die "doins failed"
		fi
		EXE_NAME=pyrogenesis_dbg
	else
#		doins "${S}"/binaries/system/libmozjs185-ps-release.so.1.0 || die "doins failed"
		doins "${S}"/binaries/system/libCollada.so || die "doins failed"
		if use editor ; then
			doins "${S}"/binaries/system/libAtlasUI.so || die "doins failed"
		fi
		EXE_NAME=pyrogenesis
	fi

	exeinto "${dir}"/system
	doexe "${S}"/binaries/system/${EXE_NAME} || die "doexe failed"

	games_make_wrapper ${PN} ./system/${EXE_NAME} ${dir}
	doicon "${S}"/build/resources/0ad.png
	make_desktop_entry "${dir}"/system/${EXE_NAME} "0 A.D."

	prepgamesdirs
}
