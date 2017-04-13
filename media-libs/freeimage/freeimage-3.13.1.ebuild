# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit flag-o-matic toolchain-funcs multilib

MY_PN=FreeImage
MY_P=${MY_PN}${PV//.}
DESCRIPTION="Image library supporting many formats"
HOMEPAGE="http://freeimage.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.zip
	doc? ( mirror://sourceforge/${PN}/${MY_P}.pdf )"

LICENSE="|| ( GPL-2 FIPL-1.0 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cxx doc"

DEPEND="
	media-libs/jpeg
	media-libs/libmng
	media-libs/libpng
	media-libs/tiff
	sys-libs/zlib
	media-libs/openjpeg
	media-libs/openexr
	app-arch/unzip"
RDEPEND=""

S=${WORKDIR}/${MY_PN}

src_prepare() {
	append-cflags -std=c99 -D_POSIX_SOURCE # silence warnings from gcc
	rm -rf \
		"${S}/Source/LibJPEG" \
		"${S}/Source/LibMNG" \
		"${S}/Source/LibOpenJPEG" \
		"${S}/Source/LibPNG" \
		"${S}/Source/LibTIFF" \
		"${S}/Source/OpenEXR" \
		"${S}/Source/ZLib" || die "rm -rf failed"
	epatch "${FILESDIR}/${P}-systemlibs.patch"
}

src_compile() {
	emake -f Makefile.gnu || die "emake failed"
	if use cxx ; then
		emake -f Makefile.fip || die "emake fip failed"
	fi
}

src_install() {
	dodir /usr/include /usr/$(get_libdir)
	emake DESTDIR="${D}" -f Makefile.gnu install || die "emake install failed"
	if use cxx ; then
		emake DESTDIR="${D}" -f Makefile.fip install || die "emake install fip failed"
	fi
	dodoc README.linux Whatsnew.txt
	use doc && dodoc "${DISTDIR}"/${MY_P}.pdf
}
