# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-cluster/nova/nova-2013.1.ebuild,v 1.1 2013/04/10 17:34:19 prometheanfire Exp $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 eutils

DESCRIPTION="Nova is a cloud computing fabric controller (main part of an
IaaS system). It is written in Python."
HOMEPAGE="https://launchpad.net/nova"
SRC_URI="http://launchpad.net/${PN}/grizzly/${PV}/+download/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

RDEPEND=">=dev-python/amqplib-0.6.1[${PYTHON_USEDEP}]
		>=dev-python/anyjson-0.2.4[${PYTHON_USEDEP}]
		>=dev-python/cheetah-2.4.4
		>=dev-python/sqlalchemy-0.7.8
		<=dev-python/sqlalchemy-0.7.99
		dev-python/boto[${PYTHON_USEDEP}]
		>=dev-python/eventlet-0.9.17[${PYTHON_USEDEP}]
		>=dev-python/kombu-1.0.4-r1[${PYTHON_USEDEP}]
		>=dev-python/routes-1.12.3-r1[${PYTHON_USEDEP}]
		=dev-python/webob-1.2.3-r1
		>=dev-python/greenlet-0.3.1[${PYTHON_USEDEP}]
		>=dev-python/pastedeploy-1.5.0-r1[${PYTHON_USEDEP}]
		dev-python/paste[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-migrate-0.7.2
		dev-python/netaddr
		>=dev-python/suds-0.4
		dev-python/paramiko[${PYTHON_USEDEP}]
		dev-python/pyasn1[${PYTHON_USEDEP}]
		>=dev-python/Babel-0.9.6[${PYTHON_USEDEP}]
		>=dev-python/iso8601-0.1.4[${PYTHON_USEDEP}]
		dev-python/httplib2[${PYTHON_USEDEP}]
		>=dev-python/setuptools-git-0.4[${PYTHON_USEDEP}]
		>=dev-python/python-cinderclient-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/python-glanceclient-0.5.0[${PYTHON_USEDEP}]
		<dev-python/python-glanceclient-2[${PYTHON_USEDEP}]
		>=dev-python/python-quantumclient-2.2.0[${PYTHON_USEDEP}]
		<dev-python/python-quantumclient-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/python-keystoneclient-0.2.0[${PYTHON_USEDEP}]
		>=dev-python/stevedore-0.7
		>dev-python/websockify-0.4[${PYTHON_USEDEP}]
		>=dev-python/oslo-config-1.1.0[${PYTHON_USEDEP}]
		virtual/python-argparse[${PYTHON_USEDEP}]"

PATCHES=(
)

python_install() {
	distutils-r1_python_install
	keepdir /etc/nova
	insinto /etc/nova

	newins "etc/nova/nova.conf.sample" "nova.conf"
	newins "etc/nova/api-paste.ini" "api-paste.ini"
	newins "etc/nova/logging_sample.conf" "logging_sample.conf"
	newins "etc/nova/policy.json" "policy.json"
	newins "etc/nova/rootwrap.conf" "rootwrap.conf"
	insinto /etc/nova/rootwrap.d
	doins "etc/nova/rootwrap.d/api-metadata.filters"
	doins "etc/nova/rootwrap.d/compute.filters"
	doins "etc/nova/rootwrap.d/network.filters"
}
