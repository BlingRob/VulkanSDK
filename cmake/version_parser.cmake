cmake_minimum_required(VERSION 3.10)

macro(parse_version version)

    STRING(REGEX MATCH "^([0-9]+)\\.([0-9]+)\\.([0-9]+)" _ ${version})

    set(MAJOR_SDK_VERSION ${CMAKE_MATCH_1})
    set(MINOR_SDK_VERSION ${CMAKE_MATCH_2})
    set(PATCH_SDK_VERSION ${CMAKE_MATCH_3})

    message("Set vulkan sdk version: ${MAJOR_SDK_VERSION}.${MINOR_SDK_VERSION}.${PATCH_SDK_VERSION}")
endmacro()

