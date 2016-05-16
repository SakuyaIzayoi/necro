# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools git-r3

DESCRIPTION="rxvt-unicode with 24bit color support"
HOMEPAGE="https://github.com/spudowiar/rxvt-unicode"
EGIT_REPO_URI="https://github.com/spudowiar/rxvt-unicode"
EGIT_BRANCH="24bit"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="+24-bit-color +font-styles +perl pixbuf xft unicode3"

RDEPEND="
	media-libs/fontconfig
	sys-libs/ncurses:*
	x11-libs/libX11
	x11-libs/libXrender
	perl? ( dev-lang/perl:= )
	pixbuf? ( x11-libs/gdk-pixbuf x11-libs/gtk+:2 )
	xft? ( x11-libs/libXft )
"

DEPEND="
	${RDEPEND}
	virtual/pkgconfig
	x11-proto/xproto
"

src_prepare() {
	git submodule update --init --recursive

	sed -i -e "/rxvt-unicode.terminfo/d" doc/Makefile.in || die "sed failed"

	eapply_user

	eautoreconf
}

src_configure() {
	local myconf=''
	econf --enable-everything \
	$(use_enable 24-bit-color) \
	$(use_enable font-styles) \
	$(use_enable perl) \
	$(use_enable pixbuf) \
	$(use_enable xft) \
	$(use_enable unicode3)
	${myconf}
}

src_install() {
	default

	dodoc \
		Changes INSTALL MANIFEST README.FAQ README.configure

	make_desktop_entry urxvt rxvt-unicode utilities-terminal \
		"System;TerminalEmulator"
}
