FROM debian:10
ARG TOOLCHAIN_URL="https://dl.espressif.com/dl/"
ARG TOOLCHAIN_FILE="xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz"
ENV PATH="${HOME}/esp/xtensa-esp32-elf/bin:${PATH}"

# Following Guide from:
# https://docs.espressif.com/projects/esp-idf/en/v3.3/get-started-cmake/linux-setup.html

# Install Prerequisites
RUN apt-get update \
  && apt-get install -y \
  git \
  wget \
  curl \
  libncurses-dev \
  flex \
  bison \
  gperf \
  python \
  python-pip \
  python-setuptools \
  python-serial \
  python-cryptography \
  python-future \
  python-pyparsing \
  cmake \
  ninja-build \
  ccache
  
# Toolchain Setup
RUN curl -O ${TOOLCHAIN_URL}${TOOLCHAIN_FILE}
RUN pwd \
  && mkdir -p ~/esp \
  && cd ~/esp \
  && tar -xzf /${TOOLCHAIN_FILE}
  
# Set the path
# export PATH="$HOME/esp/xtensa-esp32-elf/bin:$PATH"
# alias get_esp32='export PATH="$HOME/esp/xtensa-esp32-elf/bin:$PATH"'

