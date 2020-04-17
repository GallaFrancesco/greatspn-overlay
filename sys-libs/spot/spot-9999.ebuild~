# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Multi-terminal and Edge-valued Decision Diagram LibrarY"
HOMEPAGE="https://github.com/asminer/meddly"
EGIT_REPO_URI="https://github.com/asminer/meddly.git"
REFS="refs/tags/master"
TAGS="${PV}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=""
BDEPEND="
	dev-vcs/git
	sys-devel/libtool
	sys-devel/autoconf
	sys-devel/automake
	sys-devel/gcc
	"
DEPEND="${BDEPEND}"

src_unpack() {
	git-r3_fetch ${EGIT_REPO_URI}
	git-r3_checkout ${EGIT_REPO_URI} ${WORKDIR}/${P} ${TAG}
}

src_prepare() {
	default
}

src_configure() {
	bash ./autogen.sh
	econf --prefix=/usr/local/
}

src_compile() {
	if [ -f Makefile ] || [ -f GNUmakefile ] || [ -f makefile ]; then
		emake || die "emake failed"
	fi
}
