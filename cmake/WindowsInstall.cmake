set(VULKAN_SDK_LIBRARY_DIR ${CMAKE_INSTALL_PREFIX}/lib CACHE STRING "Vulkan libs")

add_custom_command(
TARGET ${PROJECT_NAME}
POST_BUILD
COMMAND cmd /c ${CMAKE_CURRENT_SOURCE_DIR}/scripts/setx.bat VK_LAYER_PATH ${CMAKE_INSTALL_PREFIX}/bin/
COMMAND cmd /c ${CMAKE_CURRENT_SOURCE_DIR}/scripts/setx.bat VK_LOADER_DEBUG "all"
COMMENT "Set layer path and debug level"
VERBATIM)

if("${CMAKE_BUILD_TYPE}" STREQUAL "Debug")
	set(DEBUG_SUFFIX "d")
endif()

list(APPEND Vulkan_Libs "${CMAKE_INSTALL_PREFIX}/lib/glslang${DEBUG_SUFFIX}.lib")
list(APPEND Vulkan_Libs "${CMAKE_INSTALL_PREFIX}/lib/SPIRV-Tools-opt.lib")
list(APPEND Vulkan_Libs "${CMAKE_INSTALL_PREFIX}/lib/SPIRV${DEBUG_SUFFIX}.lib")
list(APPEND Vulkan_Libs "${CMAKE_INSTALL_PREFIX}/lib/MachineIndependent${DEBUG_SUFFIX}.lib")
list(APPEND Vulkan_Libs "${CMAKE_INSTALL_PREFIX}/lib/OSDependent${DEBUG_SUFFIX}.lib")
list(APPEND Vulkan_Libs "${CMAKE_INSTALL_PREFIX}/lib/GenericCodeGen${DEBUG_SUFFIX}.lib")
list(APPEND Vulkan_Libs "${CMAKE_INSTALL_PREFIX}/lib/glslang-default-resource-limits${DEBUG_SUFFIX}.lib")
list(APPEND Vulkan_Libs "${CMAKE_INSTALL_PREFIX}/lib/SPVRemapper${DEBUG_SUFFIX}.lib")
list(APPEND Vulkan_Libs "${CMAKE_INSTALL_PREFIX}/lib/SPIRV-Tools.lib")
list(APPEND Vulkan_Libs "${CMAKE_INSTALL_PREFIX}/lib/vulkan-1.lib")

list(APPEND Vulkan_shared_Libs "${CMAKE_INSTALL_PREFIX}/bin/SPIRV-Tools-shared.dll")
list(APPEND Vulkan_shared_Libs "${CMAKE_INSTALL_PREFIX}/bin/vulkan-1.dll")
list(APPEND Vulkan_shared_Libs "${CMAKE_INSTALL_PREFIX}/bin/VkLayer_khronos_validation.dll")

set(Vulkan_shared_lib "${CMAKE_INSTALL_PREFIX}/bin/vulkan-1.dll")
