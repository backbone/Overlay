# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils

PATCH_VERSION="20090526"

MY_PN="ion-3"
MY_P="${MY_PN}-${PV}"
MY_P_DOC="ion-doc-3-${PV}"

DESCRIPTION="A tiling tabbed window manager designed with keyboard users in mind"
HOMEPAGE="http://modeemi.fi/~tuomov/ion/"
SRC_URI="http://files.rafaelmartins.eng.br/distfiles/${MY_P}.tar.gz
	doc? ( http://files.rafaelmartins.eng.br/distfiles/${MY_P_DOC}.tar.gz )"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="proportional-tabs xscreensaver systray wallpaper doc"

DEPEND="dev-lang/lua
	x11-libs/libX11
	x11-libs/libSM
	x11-libs/libXext
	x11-libs/libICE"

RDEPEND="x11-apps/xrdb
	systray? ( x11-misc/trayion )
	xscreensaver? ( x11-misc/xscreensaver )
	wallpaper? ( media-gfx/imagemagick )"

S="${WORKDIR}/${MY_P}"
S_DOC="${WORKDIR}/${MY_P_DOC}"

src_prepare(){
	epatch "${FILESDIR}/${PN}-fix_build_system.patch"

	if [ "${PATCH_VERSION:-}" != "" ]; then
		epatch "${FILESDIR}/${MY_PN}-${PATCH_VERSION}.diff"
	fi

	if use proportional-tabs; then
		epatch "${FILESDIR}/${MY_PN}plus.proportional.patch"
	fi

	if use systray; then
		sed -i \
			-e 's/max_/--max_/' \
			-e 's/min_/--min_/' \
			etc/cfg_kludges.lua || die 'sed failed.'
	fi

	if use xscreensaver; then
		sed -i -e 's/xlock/xscreensaver-command -lock/' \
			etc/cfg_ioncore.lua || die 'sed failed.'
	fi
}

src_compile(){
	emake -j1 || die 'emake failed.'
}

src_install(){
	emake \
		PREFIX="${D}/usr" \
		ETCDIR="${D}/etc/${PN}" \
		DOCDIR="${D}/usr/share/doc/${PF}" \
		install || die 'emake install failed.'

	ecompressdir "/usr/share/doc/${PF}"

	insinto /usr/share/xsessions
	doins "${FILESDIR}"/*.desktop

	use doc && cd "${S_DOC}" && dodoc *.pdf

	for i in ion3 pwm3; do
		mv "${D}/usr/bin/${i}"{,-bin}

		echo -e "#!/bin/bash\n\n[ -f ~/.Xresources ] && xrdb ~/.Xresources" \
			> ${i}

		if use wallpaper; then
			echo -n "[ -f ~/.ion3/wallpaper ] && " >> ${i}
			echo "display -window root ~/.ion3/wallpaper" >> ${i}
		fi

		if use systray; then
			echo "(trayion&)" >> ${i}
		fi

		if use xscreensaver; then
			echo "(xscreensaver&)" >> ${i}
		fi

		echo "exec ${i}-bin" >> ${i}

		dobin ${i}
	done
}

pkg_postinst() {
	einfo 'Save your X settings to ~/.Xresources.'
	if use wallpaper; then
		einfo
		einfo 'You have enabled the wallpaper USE flag.'
		einfo 'Save your wallpaper at ~/.ion3/ with the name "wallpaper"'
	fi
}
