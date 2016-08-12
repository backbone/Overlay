# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit cmake-utils git-r3

MY_PN=${PN}-linux
DESCRIPTION="Reliable MTP client with minimalistic UI"
HOMEPAGE="https://whoozle.github.io/android-file-transfer-linux/"
EGIT_REPO_URI="git://github.com/whoozle/${PN}-linux.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="fuse qt4 +qt5"
REQUIRED_USE="^^ ( qt4 qt5 )"

RDEPEND="fuse? ( sys-fs/fuse )
	qt4? ( dev-qt/qtcore:4
		dev-qt/qtgui:4 )
	qt5? ( dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5 )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_build qt4 QT_UI)
		$(cmake-utils_use_use qt4 QT4)
		$(cmake-utils_use_build qt5 QT_UI)
		$(cmake-utils_use_use qt5 QT5)
	)
	cmake-utils_src_configure
}
