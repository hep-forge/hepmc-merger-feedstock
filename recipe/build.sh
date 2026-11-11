#! /usr/bin/bash
set -e

mkdir -p build
cd build

# conda-forge's HepMC3Config.cmake does not load the rootIO targets: see
# hepmc3-rootio.cmake
EXTRA_ARGS=(-DCMAKE_PROJECT_INCLUDE="${RECIPE_DIR}/hepmc3-rootio.cmake")

cmake .. "${EXTRA_ARGS[@]}" \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DCMAKE_BUILD_TYPE=Release \
  -DHepMC3_DIR="${PREFIX}/share/HepMC3/cmake"

NPROC=$(nproc 2>/dev/null || sysctl -n hw.ncpu)
make -j"$NPROC"
make install
