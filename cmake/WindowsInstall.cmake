set(VULKAN_SDK_LIBRARY_DIR ${CMAKE_INSTALL_PREFIX}/lib CACHE STRING "Vulkan libs")

add_custom_command(
TARGET ${PROJECT_NAME}
PRE_BUILD
COMMAND cmd /c ${CMAKE_SOURCE_DIR}/scripts/setx.bat VK_LAYER_PATH ${CMAKE_INSTALL_PREFIX}/bin/)

add_custom_command(
TARGET ${PROJECT_NAME}
PRE_BUILD
COMMAND cmd /c ${CMAKE_SOURCE_DIR}/scripts/setx.bat VK_LOADER_DEBUG "all")

file(GLOB_RECURSE Vulkan_Libs
${CMAKE_INSTALL_PREFIX}/lib/*.lib)

file(GLOB_RECURSE Vulkan_shared_Libs
${CMAKE_INSTALL_PREFIX}/bin/*.dll)

file(GLOB_RECURSE Vulkan_shared_lib
${CMAKE_INSTALL_PREFIX}/bin/vulkan-1.dll)
