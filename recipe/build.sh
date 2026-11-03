#! /usr/bin/bash
set -e

mkdir -p build
cd build

EXTRA_ARGS=()
if [[ "$(uname)" == "Darwin" ]]; then
  EXTRA_ARGS+=(-DCMAKE_PROJECT_INCLUDE="${RECIPE_DIR}/hepmc3-rootio-macos.cmake")
fi

cmake .. "${EXTRA_ARGS[@]}" \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DCMAKE_BUILD_TYPE=Release \
  -DHepMC3_DIR="${PREFIX}/share/HepMC3/cmake"

NPROC=$(nproc 2>/dev/null || sysctl -n hw.ncpu)
make -j"$NPROC"
make install
