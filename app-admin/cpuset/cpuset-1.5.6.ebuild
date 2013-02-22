# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit distutils

DESCRIPTION="A Python wrapper around the standard Linux filesystem calls to manage cpusets"
HOMEPAGE="http://code.google.com/p/cpuset/"
SRC_URI="http://cpuset.googlecode.com/files/cpuset-1.5.6.tar.gz"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="app-text/asciidoc"
RDEPEND=""

src_install() {
	DOCS="doc/*.txt"
	distutils_src_install

	rm -rf "${D}/usr/share/doc/packages"

	dohtml doc/*

	doman doc/cset*.1
}
