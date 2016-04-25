# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit git-r3

DESCRIPTION="C Rectangular oUtline Drawer - Prints the geometry of a selected region in x11"
HOMEPAGE="https://github.com/rxse/crud"
SRC_URI=""
EGIT_REPO_URI="git://github.com/rxse/crud"
EGIT_BRANCH="master"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

CDEPEND="
	dev-util/pkgconfig
"

src_compile() {
	emake
}

src_install() {
	exeinto /usr/local/bin
	doexe crud
	dodoc README*
}
