cmake_minimum_required (VERSION 3.10)
set(CMAKE_CXX_STANDARD 17)

project ("VulkanSDK")

set(CMAKE_INSTALL_PREFIX ${CMAKE_CURRENT_BINARY_DIR}/install)

if("${CMAKE_BUILD_TYPE}" STREQUAL "")
	set(CMAKE_BUILD_TYPE "Debug")
endif()

if("${SDK_VERSION}" STREQUAL "")
	set(SDK_VERSION "1.3.236")
endif()

include(cmake/DownloadAndBuild.cmake)

add_custom_target(${PROJECT_NAME} ALL
    WORKING_DIRECTORY
        ${CMAKE_CURRENT_BINARY_DIR}
    COMMENT
      "Build Vulkan SDK"
  )

include(cmake/Package.cmake)
