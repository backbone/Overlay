# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils

DESCRIPTION="Snail - nVidia Optimus support"

SRC_URI="ftp://backbone.ws/projects/snail/${P}.tar.bz2"

HOMEPAGE="https://chili.backbone.ws/projects/snail"

KEYWORDS="-* ~x86 ~amd64"

SLOT="0"

LICENSE="GPL-3"

IUSE=""

DEPEND="x11-drivers/nvidia-drivers
        sys-apps/dmidecode"

RDEPEND="${DEPEND}"

src_install() {
	emake install DESTDIR="${D}" || die
}

pkg_postinst() {
	snail.configure
}

