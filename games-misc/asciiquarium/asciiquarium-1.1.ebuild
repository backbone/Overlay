# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MY_P=${P/-/_}
DESCRIPTION="an aquarium/sea animation in ASCII art"
HOMEPAGE="http://www.robobunny.com/projects/asciiquarium/html/"
SRC_URI="http://www.robobunny.com/projects/asciiquarium/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/perl-5.6
		 dev-perl/Term-Animation[ncurses]"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

src_install()
{
	dodoc README CHANGES
	dobin asciiquarium
}
