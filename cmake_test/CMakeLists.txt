cmake_minimum_required(VERSION 3.10)

SET(CMAKE_SYSTEM_PROCESSOR powerpc)
SET(CMAKE_CROSSCOMPILING 1)

#set(CMAKE_C_COMPILER_WORKS 1)
#set(CMAKE_CXX_COMPILER_WORKS 1)

set(S32DS "/opt/nxp/S32DS_Power_v2.1" CACHE FILEPATH "Path to S32DS Power Install")
set(S32DS_BUILD_TOOLS "${S32DS}/S32DS/build_tools" CACHE FILEPATH "Path to S32DS Power build_tools")
set(S32DS_GCC_VLE  "${S32DS_BUILD_TOOLS}/powerpc-eabivle-4_9" CACHE FILEPATH "Path to powerpc-eabivle root")
set(TOOLCHAIN_BIN_DIR "${S32DS_GCC_VLE}/bin")
set(S32DS_E200_EWL2  "${S32DS_BUILD_TOOLS}/e200_ewl2" CACHE FILEPATH "Path to powerpc-eabivle root")


set(TOOLCHAIN powerpc-eabivle)
set(CMAKE_C_COMPILER ${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN}-gcc)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN}-g++)
set(CMAKE_OBJCOPY ${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN}-objcopy${TOOLCHAIN_EXT})
set(CMAKE_OBJDUMP ${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN}-objdump${TOOLCHAIN_EXT})
set(CMAKE_SIZE ${TOOLCHAIN_BIN_DIR}/${TOOLCHAIN}-size${TOOLCHAIN_EXT})


set(CMAKE_FIND_LIBRARY_PREFIXES "")
set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")

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
add_executable(minimal main.c)

include_directories(include)
include_directories(${S32DS_GCC_VLE}/powerpc-eabivle/newlib)
include_directories(${S32DS_E200_EWL2}/EWL_C++/include)
include_directories(${S32DS_E200_EWL2}/EWL_C/include)
include_directories(${S32DS_E200_EWL2}/EWL_Runtime/include)

find_library (LIBSTDC libstdc++.a)

set(GHSMULTI 0)
set(DIAB 0)







#---------------------------------------------------------------------------------------
# Prints the section sizes
#---------------------------------------------------------------------------------------
function(print_section_sizes TARGET)
    add_custom_command(TARGET ${TARGET} POST_BUILD COMMAND ${CMAKE_SIZE} ${TARGET})
endfunction()

#---------------------------------------------------------------------------------------
# Creates output in hex format
#---------------------------------------------------------------------------------------
function(create_hex_output TARGET)
    add_custom_target(${TARGET}.hex ALL DEPENDS ${TARGET} COMMAND ${CMAKE_OBJCOPY} -Oihex ${TARGET} ${TARGET}.hex)
endfunction()

#---------------------------------------------------------------------------------------
# Creates output in binary format
#---------------------------------------------------------------------------------------
function(create_bin_output TARGET)
    add_custom_target(${TARGET}.bin ALL DEPENDS ${TARGET} COMMAND ${CMAKE_OBJCOPY} -Obinary ${TARGET} ${TARGET}.bin)
endfunction()
