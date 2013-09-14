# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
ETYPE="sources"
inherit kernel-2
detect_version
detect_arch

KEYWORDS="-* ~amd64 ~x86"
HOMEPAGE="https://git.backbone.ws/linux/backbone-sources"
SLOT="3.10.12"
PROVIDE="virtual/linux-sources"

DESCRIPTION="Full kernel sources including Zen, TuxOnIce, Gcc, BLD, cjktty for ${KV_MAJOR}.${KV_MINOR} kernel tree"
SRC_URI="https://git.backbone.ws/linux/backbone-sources/archive-tarball/v${PVR} -> linux-backbone-${PVR}.tar.gz"

src_unpack() {
	tar -xf ${DISTDIR}/linux-backbone-${PVR}.tar.gz
	mv ${WORKDIR}/linux-backbone-sources ${WORKDIR}/linux-${PVR}-backbone
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
