# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit gnome2-utils cmake-utils git-r3

DESCRIPTION="Lightweight Tox client"
HOMEPAGE="https://github.com/uTox/uTox"
EGIT_REPO_URI="https://github.com/uTox/uTox.git
	git://github.com/uTox/uTox.git"

LICENSE="GPL-3"
SLOT="0"
IUSE="+dbus +filter_audio"

RDEPEND="net-libs/tox[av]
	media-libs/freetype
	filter_audio? ( media-libs/libfilteraudio )
	media-libs/libv4l
	media-libs/libvpx
	media-libs/openal
	x11-libs/libX11
	x11-libs/libXext
	dbus? ( sys-apps/dbus )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"
