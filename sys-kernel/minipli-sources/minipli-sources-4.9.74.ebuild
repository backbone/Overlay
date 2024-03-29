# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="8"
ETYPE="sources"
inherit kernel-2
detect_version
detect_arch

KEYWORDS="-* ~amd64 ~x86"
HOMEPAGE="https://github.com/minipli/linux-unofficial_grsec"
SLOT="4.9"
PROVIDE="virtual/linux-sources"

DESCRIPTION="Unofficial forward ports of the last publicly available grsecurity patch for ${KV_MAJOR}.${KV_MINOR} kernel tree"
SRC_URI="https://github.com/minipli/linux-unofficial_grsec/archive/v${PVR}-unofficial_grsec.tar.gz -> linux-minipli-${PVR}.tar.gz"

src_unpack() {
	tar -xf ${DISTDIR}/linux-minipli-${PVR}.tar.gz
	if [[ ${PR} != "r0" ]]; then REV="-${PR}"; fi
	mv ${WORKDIR}/linux-unofficial_grsec-${PVR}-unofficial_grsec ${WORKDIR}/linux-${PV}-minipli${REV}
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, and how to report problems, see:"
	einfo "${HOMEPAGE}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
