# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

MAKEOPTS="-j1"
DESCRIPTION="Modeling, validation and performance evaluation of distributed systems."
HOMEPAGE="http://www.di.unito.it/~greatspn/index.html"
EGIT_REPO_URI="https://github.com/greatspn/sources"
REFS="refs/tags/master"
TAGS="${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
		dev-libs/gmp
		dev-libs/boost
		dev-java/openjdk-bin
		dev-python/graphviz
		dev-cpp/libxmlpp:2.6
		dev-cpp/glibmm
		dev-libs/glib
		sci-mathematics/glpk
		sci-mathematics/lpsolve
		sys-libs/meddly
		x11-misc/xdg-utils
		"
BDEPEND="
	dev-vcs/git
	sys-devel/libtool
	sys-devel/autoconf
	sys-devel/automake
	=sys-devel/flex-2.6.1
	dev-util/byacc
	dev-java/ant-antlr
	"
DEPEND="${BDEPEND} ${RDEPEND}"

src_unpack() {
	git-r3_fetch ${EGIT_REPO_URI}
	git-r3_checkout ${EGIT_REPO_URI} ${WORKDIR}/${P} ${TAG}
}

src_prepare() {
	default
}

src_compile() {
	if [ -f Makefile ] || [ -f GNUmakefile ] || [ -f makefile ]; then
		emake || die "emake failed"
	fi
}

src_install() {
	if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]] ; then
		emake XDG_DIR="${D}/usr/local/share" INSTALLDIR="${D}/usr/local/GreatSPN" install || die "make install failed"
	fi

	echo "Remember to add /usr/local/GreatSPN/bin and /usr/local/GreatSPN/scripts to your PATH"
}

pkg_postinst() {
	elog "GreatSPN has been installed to /usr/local/GreatSPN"
	elog "Remember to add /usr/local/GreatSPN/bin and /usr/local/GreatSPN/scripts to your PATH"
	elog "To use it in your current shell:"
	elog '$ export PATH=$PATH:/usr/local/GreatSPN/bin:/usr/local/GreatSPN/scripts'
}

