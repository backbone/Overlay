# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

SRC_URI="http://files.backbone.ws/projects/stardict-dicts/${P}.tar.bz2"
KEYWORDS="-* ~x86 ~amd64"

DESCRIPTION="Set of en/ru dictionaries for stardict"

HOMEPAGE="http://code.google.com/p/stardict-3"

SLOT="0"

LICENSE="GPL-3"

IUSE=""

DEPEND=""

RDEPEND="${DEPEND}"

src_install() {
	emake install DESTDIR="${D}" || die
}
