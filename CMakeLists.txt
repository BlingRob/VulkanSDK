cmake_minimum_required (VERSION 3.21)
set(CMAKE_CXX_STANDARD 17)

project ("Vulkan_SDK")

if(NOT DEFINED ${CMAKE_INSTALL_PREFIX})
	set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/install)
endif()
if(NOT DEFINED ${CMAKE_BUILD_TYPE})
	set(CMAKE_BUILD_TYPE "Debug")
endif()

#May be no effect
option(BUILD_WSI_WAYLAND_SUPPORT OFF)

include(cmake/Building.cmake)

add_custom_target(${PROJECT_NAME} ALL
    WORKING_DIRECTORY
        ${CMAKE_CURRENT_BINARY_DIR}
    COMMENT
      "Build Vulkan SDK"
  )
#############

set(VULKAN_SDK_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include CACHE STRING "Vulkan headers")
set(VULKAN_SDK_BINARY_DIR ${CMAKE_INSTALL_PREFIX}/bin CACHE STRING "Vulkan binaries")

if(WIN32)
    include(cmake/WindowsInstall.cmake)
elseif(UNIX)
    include(cmake/LinuxInstall.cmake)
endif()

set(VULKAN_LIBS ${Vulkan_Libs} CACHE STRING "Vulkan libraries")
set(VULKAN_SHARED_LIBS ${Vulkan_shared_Libs} CACHE STRING "Vulkan shared libraries")
 
