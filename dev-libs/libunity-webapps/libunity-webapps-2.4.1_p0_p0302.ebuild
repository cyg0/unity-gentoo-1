EAPI=4
GCONF_DEBUG="no"
GNOME2_LA_PUNT="yes"

inherit base eutils autotools gnome2 ubuntu-versionator

UURL="http://archive.ubuntu.com/ubuntu/pool/main/libu/${PN}"
URELEASE="quantal-updates"

DESCRIPTION="Webapps integration with the Unity desktop"
HOMEPAGE="https://launchpad.net/libunity-webapps"
SRC_URI="${UURL}/${MY_P}.orig.tar.gz
	${UURL}/${MY_P}-${UVER}.debian.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"
RESTRICT="mirror"

DEPEND="app-admin/packagekit-gtk
	app-misc/geoclue
	dev-db/sqlite:3
	>=dev-libs/glib-2.32.3:2
	dev-libs/gobject-introspection
	dev-libs/libdbusmenu
	dev-libs/json-glib
	dev-libs/libindicate[gtk]
	dev-libs/libunity
	dev-util/intltool
	net-libs/libsoup
	net-libs/telepathy-glib
	x11-libs/gtk+:3
	unity-base/indicator-messages
	x11-libs/libnotify
	x11-libs/libwnck:3"

src_prepare() {
	for patch in $(cat "${WORKDIR}/debian/patches/series" | grep -v \# ); do
		PATCHES+=( "${WORKDIR}/debian/patches/${patch}" )
	done
	base_src_prepare

	# Fix spelling mistakes #
	sed -e 's:flavor:flavour:g' \
		-i configure.ac

	eautoreconf
}

src_configure() {
	econf \
		--disable-static \
		--libexecdir=/usr/lib/libunity-webapps
}

pkg_postinst() {
	elog "Unity webapps will only currently work if your default browser"
	elog "is set to either Firefox or Chromium"
}
