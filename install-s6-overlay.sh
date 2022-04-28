#!/usr/bin/env bash

# download s6-overlay
# Check CPU architecture

S6_VER=2.1.0.2
ARCH=$(uname -m)
echo -e "${INFO} Check CPU architecture ..."
if [[ ${ARCH} == "x86_64" ]]; then
    ARCH="amd64"
elif [[ ${ARCH} == "aarch64" ]]; then
    ARCH="aarch64"
else
    echo -e "${ERROR} This architecture is not supported."
    exit 1
fi

wget --no-check-certificate https://github.com/just-containers/s6-overlay/releases/download/v${S6_VER}/s6-overlay-${ARCH}.tar.gz
mkdir ./s6-overlay
tar -xvzf s6-overlay-${ARCH}.tar.gz -C ./s6-overlay
