cmake_minimum_required(VERSION 3.10)

set(CMAKE_SYSTEM_PROCESSOR powerpc)

set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)

set(S32DS "/opt/nxp/S32DS_Power_v2.1" CACHE FILEPATH "Path to S32DS Power Install")
set(S32DS_BUILD_TOOLS "${S32DS}/S32DS/build_tools" CACHE FILEPATH "Path to S32DS Power build_tools")
set(S32DS_GCC_VLE  "${S32DS_BUILD_TOOLS}/powerpc-eabivle-4_9" CACHE FILEPATH "Path to powerpc-eabivle root")
set(S32DS_E200_EWL2  "${S32DS_BUILD_TOOLS}/e200_ewl2" CACHE FILEPATH "Path to powerpc-eabivle root")

set(tools ${S32DS_GCC_VLE})
set(CMAKE_C_COMPILER ${tools}/bin/powerpc-eabivle-gcc)
set(CMAKE_CXX_COMPILER ${tools}/bin/powerpc-eabivle-g++)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(CMAKE_C_FLAGS_DEBUG "")
set(CMAKE_CXX_FLAGS_DEBUG "")
set(CMAKE_C_FLAGS_RELEASE "")
set(CMAKE_CXX_FLAGS_RELEASE "")
set(CMAKE_C_FLAGS_RELWITHDEBINFO "")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "")
set(CMAKE_C_FLAGS_MINSIZEREL "")
set(CMAKE_CXX_FLAGS_MINSIZEREL "")

# set the project name and version
project(adc_Z2_. VERSION 1.0)

# set the project name
project(adc_Z2_3)

# add the executable
add_executable(adc_Z2_3 src/adc_Z2_3.c)

include_directories(include)
include_directories(${S32DS_E200_EWL2}/EWL_C++/include/)
include_directories(${S32DS_E200_EWL2}/EWL_C/include/)
include_directories(${S32DS_E200_EWL2}/EWL_Runtime/include/)
