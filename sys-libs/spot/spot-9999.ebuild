# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="A platform for LTL and ω-automata manipulation."
HOMEPAGE="https://spot.lrde.epita.fr/"
EGIT_REPO_URI="https://gitlab.lrde.epita.fr/spot/spot.git"
REFS="refs/heads/master"
TAGS="${PV}"

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

src_unpack() {
	git-r3_fetch ${EGIT_REPO_URI} ${REFS}
	git-r3_checkout ${EGIT_REPO_URI} ${WORKDIR}/${P} ${TAG}
}

src_prepare() {
	default
}

src_configure() {
    autoreconf -fi
    if use python; then
        econf --prefix=/usr/local/ --disable-devel
    else
        econf --prefix=/usr/local/ --disable-python --disable-devel
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
