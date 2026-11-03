# macOS only (see build.sh). HepMC3 there is conda-forge's hepmc3, built
# without rootIO, whose HepMC3Config.cmake therefore never loads the rootIO
# targets that hep-forge's hepmc package adds next to it. Load them.
find_package(HepMC3 REQUIRED)
if(NOT TARGET HepMC3::rootIO AND EXISTS "${HepMC3_DIR}/HepMC3rootIOTargets.cmake")
  include("${HepMC3_DIR}/HepMC3rootIOTargets.cmake")
endif()
