EAPI=4
PYTHON_DEPEND="2:2.7"
SUPPORT_PYTHON_ABIS="1"

inherit base eutils python ubuntu-versionator

UURL="http://archive.ubuntu.com/ubuntu/pool/main/g/${PN}"
URELEASE="quantal-updates"

DESCRIPTION="An implementation of the GEIS (Gesture Engine Interface and Support) interface"
HOMEPAGE="https://launchpad.net/geis"
SRC_URI="${UURL}/${MY_P}.orig.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

DEPEND="!!unity-base/utouch-geis
	!!unity-base/utouch-grail
	unity-base/grail"

src_prepare() {
	sed -i 's/python >= 2.7/python-2.7 >= 2.7/g' configure

	export EPYTHON="$(PYTHON -2)"
        python_convert_shebangs -r 2 .
        python_src_prepare
}

src_install() {
	emake DESTDIR="${D}" install
	prune_libtool_files --modules
}
