# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils
DESCRIPTION="Free calls, text and picture sharing with anyone, anywhere!"
HOMEPAGE="http://www.viber.com"
SRC_URI="http://download.cdn.viber.com/cdn/desktop/Linux/viber.deb"

SLOT="0"
KEYWORDS="amd64"
IUSE="pulseaudio"
RESTRICT="strip"
S="${WORKDIR}"
RDEPEND="dev-libs/nss
	media-libs/alsa-lib
	media-libs/gstreamer:1.0
	media-libs/gst-plugins-base:1.0
	media-libs/gst-plugins-good:1.0
	media-libs/gst-plugins-ugly:1.0
	media-plugins/gst-plugins-libav:1.0
	pulseaudio? ( media-sound/pulseaudio[abi_x86_32(-)] )"


src_unpack() {
	default_src_unpack
	unpack ./data.tar.xz
}

src_install(){
	doins -r opt usr
	fperms -R 755 /opt/viber
}

