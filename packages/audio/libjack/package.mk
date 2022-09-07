# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libjack"
PKG_VERSION="1.9.21"
PKG_SHA256="8b044a40ba5393b47605a920ba30744fdf8bf77d210eca90d39c8637fe6bc65d"
PKG_LICENSE="GPLv2"
PKG_SITE="https://jackaudio.org/"
PKG_URL="https://github.com/jackaudio/jack2/archive/refs/tags/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_HOST="toolchain:host waf:host"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="JACK Audio Connection Kit (or JACK) is a professional sound server API and pair of daemon implementations to provide real-time, low-latency connections for both audio and MIDI data between applications."
PKG_TOOLCHAIN="manual"

configure_target() {
  ./waf configure --prefix=/usr
}

make_target() {
  ./waf build
}

makeinstall_target() {
  ./waf install --destdir=${INSTALL}
}
