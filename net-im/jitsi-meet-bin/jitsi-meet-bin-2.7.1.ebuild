# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop xdg

DESCRIPTION="Desktop application for Jitsi Meet built with Electron"
HOMEPAGE="https://github.com/jitsi/jitsi-meet-electron"
SRC_URI="https://github.com/jitsi/jitsi-meet-electron/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"

DEPEND="net-libs/nodejs[npm] \
	sys-fs/fuse \
"

KEYWORDS="~amd64"

RESTRICT=network-sandbox

src_unpack() {
	default
	mv ${WORKDIR}/* ${WORKDIR}/${P}
}

src_compile() {
	einfo
	einfo 'Note, allowing network access from the sandbox via RESTRICT=network-sandbox'
	einfo
	einfo 'Fetching dependenies via npm'
	npm install >> npm.log 2>&1 || die
	sed -e 's:AppImage:dir:g' -i package.json
	einfo 'Building package via npm'
	npm run dist >> npm.log 2>&1 || die
}

src_install() {
	mkdir -p ${D}/opt/jitsi-meet
	cp ${S}/dist/linux-unpacked/* ${D}/opt/jitsi-meet -r
	dosym /opt/jitsi-meet/jitsi-meet /usr/bin/jitsi-meet

	einfo 'Applying chmod 4755 to chrome-sandbox'
	chmod 4755 ${D}/opt/jitsi-meet/chrome-sandbox

	newicon "${S}/resources/icon.png" jitsi-meet.png
	make_desktop_entry "${PN}" Jitsi-meet jitsi-meet \
		"Network;Chat;InstantMessaging;IRCClient" \
		"Terminal=false\\nStartupNotify=true\\nStartupWMClass=Jitsi-meet"
}
