cmake_minimum_required (VERSION 3.21)
set(CMAKE_CXX_STANDARD 17)

project ("VulkanSDK")

if("${CMAKE_BUILD_TYPE}" STREQUAL "")
	set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/install)
endif()
if("${CMAKE_BUILD_TYPE}" STREQUAL "")
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

include(cmake/Package.cmake)