# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="OutFox"
PKG_VERSION="0.4.16.0"
PKG_SHA256="f3bcde9bf0053839de999d36ce200f2f0bd63850f6808b263dbb56b092df7a35"
PKG_LICENSE="GPL"
PKG_SITE="https://projectoutfox.com/"
PKG_URL="https://github.com/TeamRizu/OutFox/releases/download/OF4.16.0/OutFox-alpha-0.4.16.0HF2-Linux-amd64-legacy-date-20220801.tar.gz"
PKG_TOOLCHAIN="manual"
PKG_DEPENDS_TARGET="pulseaudio libjack socat"
PKG_LONGDESC="Project OutFox is an extensible rhythm game engine based on StepMania, featuring 17 different modes simulating different dance, instrument, and key-based rhythm games."

makeinstall_target() {
  mkdir -p ${INSTALL}/opt/outfox
  cp -frp * ${INSTALL}/opt/outfox/
  rm -rf ${INSTALL}/opt/outfox/Songs/Outfox
  cp -fp ${PKG_DIR}/scripts/configure.sh ${INSTALL}/opt/outfox/

  mkdir -p ${INSTALL}/opt/outfox/Data
  ln -s /tmp/outfox/StepMania-Lights-SextetStream.out ${INSTALL}/opt/outfox/Data/StepMania-Lights-SextetStream.out
}

post_install() {
  enable_service outfox.target
  enable_service outfox.service
  enable_service outfox-sextetstream.socket
  enable_service outfox-sextetstream.service
  enable_service litboard.service
}
