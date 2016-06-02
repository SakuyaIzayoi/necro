# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools git-r3

DESCRIPTION="fish is the Friendly Interactive SHell"
HOMEPAGE="http://fishshell.com/"
EGIT_REPO_URI="https://github.com/fish-shell/fish-shell"
EGIT_BRANCH="master"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="X"

DEPEND="sys-libs/ncurses:*
	sys-devel/bc
	sys-devel/gettext
	X? ( x11-misc/xsel )"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoconf
	default
}

src_configure() {
	eautoconf
	econf \
		docdir="${EPREFIX}/usr/share/doc/${PF}" \
		--bindir="${EPREFIX}/bin"
}

src_test() {
	if has_version ~${CATEGORY}/${P} ; then
		emake test
	else
		ewarn "The test suite only works when the package is already installed"
	fi
}

pkg_postinst() {
	elog "fish is now installed on your system."
	elog "To run fish, type 'fish' in your terminal."
	elog
	elog "To use fish as your login shell:"
	elog "* add the line '${EPREFIX}/bin/${PN}'"
	elog "* to the file '${EPREFIX}/etc/shells'."
	elog "* use the command 'chsh -s ${EPREFIX}/bin/${PN}'."
	elog
	elog "To set your colors, run 'fish_config'"
	elog "To scan your man pages for completions, run 'fish_update_completions'"
	elog "To autocomplete command suggestions press Ctrl + F or right arrow key."
	elog
	elog "Please add a \"BROWSER\" variable to ${PN}'s environment pointing to the"
	elog "browser of your choice to get acces to ${PN}'s help system:"
	elog "  BROWSER=\"/usr/bin/firefox\""
	elog
	elog "In order to get lzma and xz support for man-page completion please"
	elog "emerge one of the following packages:"
	elog "  dev-python/backports-lzma"
	elog "  >=dev-lang/python-3.3"
	elog
	elog "Have fun!"
}
