EAPI=4
GNOME2_LA_PUNT="yes"

inherit base eutils gnome2 ubuntu-versionator

UURL="http://archive.ubuntu.com/ubuntu/pool/main/i/${PN}"
URELEASE="quantal"

DESCRIPTION="Widgets and other objects used for indicators by the Unity desktop"
HOMEPAGE="https://launchpad.net/ido"
SRC_URI="${UURL}/${MY_P}.orig.tar.gz"

LICENSE="LGPL-2.1 LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

DEPEND="x11-libs/gtk+:3"
