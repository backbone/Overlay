# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod linux-info toolchain-funcs

DESCRIPTION="rtw89 driver for Realtek 8111/8168 PCI-E NICs"
HOMEPAGE="https://github.com/lwfinger/rtw89"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI=${EGIT_REPO_URI:-"https://github.com/lwfinger/rtw89.git"}
	EGIT_BRANCH="main"
	inherit git-r3
	KEYWORDS=""
else
	SRC_URI="https://dev.gentoo.org/~pacho/${PN}/${P}.tar.bz2"
	KEYWORDS="-* ~x86 ~amd64"
fi

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

MODULE_NAMES="rtw89core(kernel/drivers/net/wireless/rtw89) \
				rtw89pci(kernel/drivers/net/wireless/rtw89)"
BUILD_TARGETS="all"

pkg_setup() {
	linux_config_exists

	linux-mod_pkg_setup

	BUILD_TARGETS="all"
	BUILD_PARAMS="KVER=$KV_FULL"
}

src_install() {
	linux-mod_src_install
}
