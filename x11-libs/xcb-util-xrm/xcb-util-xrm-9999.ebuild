# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="xrm: utility functions for the X resource manager"
HOMEPAGE="https://github.com/Airblader/xcb-util-xrm"
EGIT_REPO_URI="https://github.com/Airblader/xcb-util-xrm"
EGIT_BRANCH="master"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="x11-libs/xcb-util"
RDEPEND="${DEPEND}"

src_prepare() {
	git submodule update --init --recursive
	eapply_user
}

src_configure() {
	./autogen.sh --prefix=/usr
}
