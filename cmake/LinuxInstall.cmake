set(VULKAN_SDK_LIBRARY_DIR ${CMAKE_INSTALL_PREFIX}/lib64 CACHE STRING "Vulkan libs")

add_custom_command(
TARGET ${PROJECT_NAME}
POST_BUILD
COMMAND ${CMAKE_SOURCE_DIR}/scripts/setx.sh VK_LAYER_PATH ${CMAKE_INSTALL_PREFIX}/share/vulkan/explicit_layer.d
COMMAND ${CMAKE_SOURCE_DIR}/scripts/setx.sh VK_LOADER_DEBUG "all"
COMMENT "Set layer path and debug level"
VERBATIM)

list(APPEND Vulkan_Libs "${CMAKE_INSTALL_PREFIX}/lib64/libglslang.a")
list(APPEND Vulkan_Libs "${CMAKE_INSTALL_PREFIX}/lib64/libSPIRV-Tools-opt.a")
list(APPEND Vulkan_Libs "${CMAKE_INSTALL_PREFIX}/lib64/libSPIRV.a")
list(APPEND Vulkan_Libs "${CMAKE_INSTALL_PREFIX}/lib64/libMachineIndependent.a")
list(APPEND Vulkan_Libs "${CMAKE_INSTALL_PREFIX}/lib64/libOSDependent.a")
list(APPEND Vulkan_Libs "${CMAKE_INSTALL_PREFIX}/lib64/libGenericCodeGen.a")
list(APPEND Vulkan_Libs "${CMAKE_INSTALL_PREFIX}/lib64/libglslang-default-resource-limits.a")
list(APPEND Vulkan_Libs "${CMAKE_INSTALL_PREFIX}/lib64/libSPVRemapper.a")
list(APPEND Vulkan_Libs "${CMAKE_INSTALL_PREFIX}/lib64/libSPIRV-Tools.a")

list(APPEND Vulkan_shared_Libs "${CMAKE_INSTALL_PREFIX}/lib64/libSPIRV-Tools-shared.so")
list(APPEND Vulkan_shared_Libs "${CMAKE_INSTALL_PREFIX}/lib64/libvulkan.so")
list(APPEND Vulkan_shared_Libs "${CMAKE_INSTALL_PREFIX}/lib64/libVkLayer_khronos_validation.so")

set(Vulkan_shared_lib "${CMAKE_INSTALL_PREFIX}/lib64/libvulkan.so.${SDK_VERSION}")
