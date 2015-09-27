# Copyright 2008-2012 Funtoo Technologies
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit git-2 cmake-utils
DESCRIPTION="Small tool to show UKSM statistics."
HOMEPAGE="http://github.com/pfactum/uksmstat"
EGIT_REPO_URI="https://github.com/pfactum/uksmstat.git"
EGIT_HAS_SUBMODULES=true

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
