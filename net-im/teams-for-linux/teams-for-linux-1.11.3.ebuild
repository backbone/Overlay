# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg multilib-build

DESCRIPTION="Unofficial Microsoft Teams client for Linux. Binary precompiled version."
HOMEPAGE="https://github.com/IsmaelMartinez/teams-for-linux"
SRC_URI="https://github.com/IsmaelMartinez/${PN}/releases/download/v${PV}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE="system-ffmpeg system-mesa"

QA_PREBUILT="*"

DEPEND="
	app-accessibility/at-spi2-core:2[${MULTILIB_USEDEP}]
	dev-libs/nspr[${MULTILIB_USEDEP}]
	dev-libs/nss[${MULTILIB_USEDEP}]
	media-libs/alsa-lib[${MULTILIB_USEDEP}]
	media-libs/freetype:2[${MULTILIB_USEDEP}]
	media-gfx/graphite2[${MULTILIB_USEDEP}]
	net-print/cups[${MULTILIB_USEDEP}]
	x11-libs/gtk+:3[${MULTILIB_USEDEP}]
	x11-libs/libX11[${MULTILIB_USEDEP}]
	x11-libs/pango[${MULTILIB_USEDEP}]
	system-ffmpeg? ( >=media-video/ffmpeg-6[chromium] )
	system-mesa? ( media-libs/mesa[vulkan] )
"

src_install() {
	dodir /opt/${PN}
	cp -a . "${ED}/opt/${PN}" || die

	if use system-ffmpeg; then
		rm "${ED}/opt/${PN}/libffmpeg.so" || die
		dosym "../../usr/$(get_libdir)/chromium/libffmpeg.so" "opt/${PN}/libffmpeg.so" || die
		elog "Using system ffmpeg. This is experimental and may lead to crashes."
	fi

	if use system-mesa; then
		rm "${ED}/opt/${PN}/libEGL.so" || die
		rm "${ED}/opt/${PN}/libGLESv2.so" || die
		rm "${ED}/opt/${PN}/libvulkan.so.1" || die
		rm "${ED}/opt/${PN}/libvk_swiftshader.so" || die
		rm "${ED}/opt/${PN}/vk_swiftshader_icd.json" || die
		elog "Using system mesa. This is experimental and may lead to crashes."
	fi

	# install wrapper reading /etc/chromium/* for CHROME_FLAGS
	exeinto /opt/${PN}
	doexe "${FILESDIR}/${PN}.sh"

	# remove chrome-sandbox binary, users should use kernel namespaces
	# https://bugs.gentoo.org/692692#c18
	rm "${ED}/opt/${PN}/chrome-sandbox" || die

	dosym ../../opt/${PN}/${PN}.sh /usr/bin/${PN}

	newicon -s scalable "${FILESDIR}/${PN}.svg" ${PN}.svg
	make_desktop_entry "${EPREFIX}"/opt/${PN}/${PN}.sh "Teams for Linux" \
		${PN} "Network;Chat;InstantMessaging;" \
		"MimeType=x-scheme-handler/msteams;"
}
