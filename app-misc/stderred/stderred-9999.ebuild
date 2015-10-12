# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI=${EGIT_REPO_URI:-"git://github.com/albinoloverats/stderred.git"}
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI=""
	KEYWORDS="-* ~x86 ~amd64"
fi

DESCRIPTION="Standard error output colorizer"

HOMEPAGE="https://github.com/albinoloverats/stderred"

SLOT="0"

LICENSE="GPL-3"

IUSE=""

DEPEND=""

RDEPEND="${DEPEND}"

src_prepare() {
	if [[ ${PV} == "9999" ]] ; then
		# Allow user patches to be applied without modifying the ebuild
		epatch_user
	fi
}

src_compile() {
	if [[ amd64 == ${ARCH} ]]; then
		make both
	else
		make lib/stderred
	fi
}

src_install() {
	if [[ amd64 == ${ARCH} ]]; then
		install -d ${D}//usr/lib32
		install -d ${D}//usr/lib64
		install lib64/*.so ${D}/usr/lib64
		install lib/*.so ${D}/usr/lib32
	else
		install -d ${D}//usr/lib32
		install lib/*.so ${D}/usr/lib32
	fi
}
