# HepMC3's core is conda-forge's hepmc3 (conda-forge's pythia8 depends on
# it; macOS first, every platform since the switch to conda-forge's ROOT),
# built without rootIO: its HepMC3Config.cmake sets HEPMC3_COMPONENTS to
# "search" only and so never loads the rootIO targets that hep-forge's hepmc
# package adds next to it. Load them.
find_package(HepMC3 REQUIRED)
if(NOT TARGET HepMC3::rootIO AND EXISTS "${HepMC3_DIR}/HepMC3rootIOTargets.cmake")
  include("${HepMC3_DIR}/HepMC3rootIOTargets.cmake")
endif()
