# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="xrm: utility functions for the X resource manager"
HOMEPAGE="https://github.com/Airblader/xcb-util-xrm"
SRC_URI="https://github.com/Airblader/${PN}/releases/download/v${PV}/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEN="x11-libs/xcb-util"
RDEPEND="${DEPEND}"

src_configure() {
	./autogen.sh --prefix=/usr
}
