# ScatteringOnSpheroidsCppInterface
Cpp interface for integration of ScatteringOnSpheroidalParticles with CosTuuM
# Building ScatteringOnSpheroidalParticles with CosTuuM
1. Build library spheroidail_scattering from https://github.com/Kifye/ScatteringOnSpheroidalParticles
2. Clone CosTuuM from https://github.com/SKIRT/CosTuuM
3. Copy \*.hpp, \*.cpp, \*.f90 files into CosTuuM/src directory
4. Copy lines from add_cmake.txt into  CosTuuM/src/CMakeLists.txt setting the directory paths to libspheroidail_scattering.a (and the mod files)
5. Build CosTuuM
6. To use T-matrix from ScatteringOnSpheroidalParticles run CosTuuM with option -t "spheroidal"
