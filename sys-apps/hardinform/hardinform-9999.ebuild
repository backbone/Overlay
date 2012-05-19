# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

EGIT_REPO_URI="git://github.com/inish777/hardinform.git"

[[ 9999 == ${PV} ]] && vcs=git-2

inherit eutils cmake-utils $vcs

if [[ 9999 != ${PV} ]]; then
	SRC_URI="Here must be http/ftp uri to the hardinform-X.Y.Z.tar.bz2"
	KEYWORDS="-* ~x86 ~amd64"
fi

DESCRIPTION="Gathers system information"
HOMEPAGE="http://inish777.blogspot.com/p/hardinform.html"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="dev-python/pygobject:3"

RDEPEND="${DEPEND}"

CMAKE_IN_SOURCE_BUILD=1
