# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A platform for LTL and ω-automata manipulation."
HOMEPAGE="https://spot.lrde.epita.fr/"
SRC_URI="http://www.lrde.epita.fr/dload/spot/spot-2.8.7.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="python"

RDEPEND="
    python? ( dev-lang/python )
    "
BDEPEND="
	dev-vcs/git
	sys-devel/libtool
	sys-devel/autoconf
	sys-devel/automake
	sys-devel/gcc
	"
DEPEND="${BDEPEND} ${RDEPEND}"

src_configure() {
    if use python; then
        econf --prefix=/usr/local/
    else
        econf --prefix=/usr/local/ --disable-python
    fi
}

src_compile() {
	if [ -f Makefile ] || [ -f GNUmakefile ] || [ -f makefile ]; then
		emake || die "emake failed"
	fi
}

pkg_postinst() {
	elog "Spot has been installed to /usr/local/"
}
