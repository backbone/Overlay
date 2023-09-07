# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Ilya Kashirin (seclorum@seclorum.ru)

EAPI=2

DESCRIPTION="Oxygen XML Editor is a complete cross platform XML editor providing the tools for XML authoring, XML conversion, XML Schema, DTD, Relax NG and Schematron development, XPath, XSLT, XQuery debugging, SOAP and WSDL testing."
HOMEPAGE="http://oxygenxml.com"
SRC_URI="http://mirror.oxygenxml.com/InstData/Editor/All/oxygen.tar.gz -> oxygen.tar.gz"

LICENSE="Oxygen"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND=">=dev-java/sun-jdk-1.6"

INSTALL_DIR="/opt/${PN}"
S=${WORKDIR}/oxygen

src_unpack () {
	unpack ${A}
	cd ${S}
}

src_compile() {
	echo "Nothing to compile."
}

src_install() {
	dodir ${INSTALL_DIR}
	cp -R ${S}/* ${D}/${INSTALL_DIR}/ || die "Install failed!"
	
	dosym ${INSTALL_DIR}/oxygen.sh /usr/bin/oxygenxml
	doicon ${S}/Oxygen128.png
	make_desktop_entry "oxygenxml" "Oxygen XML Editor" Oxygen128.png "Application;Development"
}

pkg_postinst() {
	echo ""
	einfo "To run Oxygen XML Editor use oxygenxml command"
	einfo "If you have troubles with \"Assertion c->xlib.lock failed\" then"
	einfo "you need do follow (http://bugs.freedesktop.org/show_bug.cgi?id=9336)"
	einfo "For sun-java5-bin:"
	einfo "sed -i 's/XINERAMA/FAKEEXTN/g' /usr/lib/jvm/sun-jdk-1.5/jre/lib/i386/xawt/libmawt.so"
	einfo "For sun-java6-bin:"
	einfo "sed -i 's/XINERAMA/FAKEEXTN/g' /usr/lib/jvm/sun-jdk-1.6/jre/lib/i386/xawt/libmawt.so"
	echo ""

}
