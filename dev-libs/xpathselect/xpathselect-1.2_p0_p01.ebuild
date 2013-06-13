# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

GTESTVER="1.6.0"

inherit cmake-utils ubuntu-versionator

UURL="mirror://ubuntu/pool/universe/x/${PN}"
URELEASE="raring"
UVER_PREFIX="~daily13.02.25"

DESCRIPTION="Select objects in an object tree using XPath queries"
HOMEPAGE="https://launchpad.net/xpathselect"
SRC_URI="${UURL}/${MY_P}${UVER_PREFIX}.orig.tar.gz
	test? ( http://googletest.googlecode.com/files/gtest-${GTESTVER}.zip )"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="mirror"

DEPEND="test? ( dev-cpp/gtest )"

S="${WORKDIR}/${PN}-${PV}${UVER_PREFIX}"

src_prepare() {
	! use test && \
		sed -e '/add_subdirectory(test)/d' \
			-i CMakeLists.txt
}

src_configure() {
	use test && \
		local mycmakeargs="${mycmakeargs}
				-DGTEST_ROOT_DIR="${WORKDIR}/gtest-${GTESTVER}"
				-DGTEST_SRC_DIR="${WORKDIR}/gtest-${GTESTVER}/src/"
				"
	cmake-utils_src_configure
}
