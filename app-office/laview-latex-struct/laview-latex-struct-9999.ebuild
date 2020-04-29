# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI=${EGIT_REPO_URI:-"https://git.backbone.ws/kolan/LAview.LaTeX-Struct.git"}
	inherit git-r3
	KEYWORDS=""
else
	#SRC_URI="ftp://ftp.backbone.ws/projects/LAview.LaTeX-Struct/${P}.tar.bz2"
	SRC_URI="https://git.backbone.ws/kolan/LAview.LaTeX-Struct/archive/v${PVR}.tar.gz -> laview-latex-struct-${PVR}.tar.gz"
	KEYWORDS="-* ~x86 ~amd64"
fi

DESCRIPTION="LaTeX representation in the memory + Scanner + Generator + Operations on document objects."

HOMEPAGE="https://git.backbone.ws/kolan/LAview.LaTeX-Struct"

SLOT="0"

LICENSE="LGPL-3"

IUSE=""

DEPEND=">=dev-lang/vala-0.30
	>=dev-libs/libgee-0.18"

RDEPEND="${DEPEND}"
