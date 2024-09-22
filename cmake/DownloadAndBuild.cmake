#Download and install the SDK Vulkan components

include(ExternalProject)

parse_version("${SDK_VERSION}")
if(${MAJOR_SDK_VERSION} GREATER_EQUAL 1 AND ${MINOR_SDK_VERSION} GREATER_EQUAL 3 AND ${PATCH_SDK_VERSION} GREATER_EQUAL 268)
  set(ALLOW_EXTERNAL_SPIRV_TOOLS ON CACHE BOOL "ALLOW_EXTERNAL_SPIRV_TOOLS" FORCE)
  set(tag_v "vulkan-sdk-${SDK_VERSION}")
  set(tag_sdk "vulkan-sdk-${SDK_VERSION}")
else()
  # option(ALLOW_EXTERNAL_SPIRV_TOOLS ON)
  set(tag_v "v${SDK_VERSION}")
  set(tag_sdk "sdk-${SDK_VERSION}")
endif()

message("Set tag: " ${tag_v})

##########################Vulkan Headers#########################
ExternalProject_Add(Vulkan-Headers
  GIT_REPOSITORY    https://github.com/KhronosGroup/Vulkan-Headers.git
  GIT_TAG           ${tag_v}
  CONFIGURE_COMMAND ${CMAKE_COMMAND} -S ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Headers -B ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Headers -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
  BUILD_COMMAND     ${CMAKE_COMMAND} --build ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Headers --target install --config ${CMAKE_BUILD_TYPE}
  INSTALL_COMMAND   ""
  UPDATE_COMMAND    ""
  SOURCE_DIR        "${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Headers"
)
#################################################################
##########################Vulkan Loader##########################
ExternalProject_Add(Vulkan-Loader
  GIT_REPOSITORY    https://github.com/KhronosGroup/Vulkan-Loader.git
  GIT_TAG           ${tag_v}
  CONFIGURE_COMMAND ${CMAKE_COMMAND} -S ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Loader -B ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Loader -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -DVULKAN_HEADERS_INSTALL_DIR=${CMAKE_INSTALL_PREFIX}
  BUILD_COMMAND     ${CMAKE_COMMAND} --build ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Loader --target install --config ${CMAKE_BUILD_TYPE}
  INSTALL_COMMAND   ""
  UPDATE_COMMAND    ""
  SOURCE_DIR        "${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Loader"
  DEPENDS Vulkan-Headers
)
#################################################################
##########################Vulkan SPIRV Headers###################
ExternalProject_Add(SPIRV-Headers
  GIT_REPOSITORY    https://github.com/KhronosGroup/SPIRV-Headers.git
  GIT_TAG           ${tag_sdk}
  CONFIGURE_COMMAND ${CMAKE_COMMAND} -S ${CMAKE_CURRENT_BINARY_DIR}/SPIRV-Headers -B ${CMAKE_CURRENT_BINARY_DIR}/SPIRV-Headers -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
  BUILD_COMMAND     ${CMAKE_COMMAND} --build ${CMAKE_CURRENT_BINARY_DIR}/SPIRV-Headers --target install
  INSTALL_COMMAND   ""
  UPDATE_COMMAND    ""
  SOURCE_DIR        "${CMAKE_CURRENT_BINARY_DIR}/SPIRV-Headers"
)
#################################################################

##########################Vulkan SPIRV Tools#####################
ExternalProject_Add(SPIRV-Tools
  GIT_REPOSITORY    https://github.com/KhronosGroup/SPIRV-Tools.git
  GIT_TAG           ${tag_sdk}
  CONFIGURE_COMMAND ${CMAKE_COMMAND} -S ${CMAKE_CURRENT_BINARY_DIR}/SPIRV-Tools -B ${CMAKE_CURRENT_BINARY_DIR}/SPIRV-Tools -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -DSPIRV-Headers_SOURCE_DIR=${CMAKE_INSTALL_PREFIX} -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
  BUILD_COMMAND     ${CMAKE_COMMAND} --build ${CMAKE_CURRENT_BINARY_DIR}/SPIRV-Tools --target install --config ${CMAKE_BUILD_TYPE}
  INSTALL_COMMAND   ""
  UPDATE_COMMAND    ""
  SOURCE_DIR        "${CMAKE_CURRENT_BINARY_DIR}/SPIRV-Tools"
  DEPENDS SPIRV-Headers
)
#################################################################

##########################Vulkan glslang#########################
ExternalProject_Add(glslang
  GIT_REPOSITORY    https://github.com/KhronosGroup/glslang.git
  GIT_TAG           ${tag_sdk}
  CONFIGURE_COMMAND ${CMAKE_COMMAND} -S ${CMAKE_CURRENT_BINARY_DIR}/glslang -B ${CMAKE_CURRENT_BINARY_DIR}/glslang -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} -DALLOW_EXTERNAL_SPIRV_TOOLS=1
  BUILD_COMMAND     ${CMAKE_COMMAND} --build ${CMAKE_CURRENT_BINARY_DIR}/glslang --target install --config ${CMAKE_BUILD_TYPE}
  INSTALL_COMMAND   ""
  UPDATE_COMMAND    ""
  SOURCE_DIR        "${CMAKE_CURRENT_BINARY_DIR}/glslang"
)
#################################################################
##########################Volk###################################
ExternalProject_Add(volk
  GIT_REPOSITORY    https://github.com/zeux/volk.git
  GIT_TAG           ${tag_sdk}
  CONFIGURE_COMMAND ${CMAKE_COMMAND} -S ${CMAKE_CURRENT_BINARY_DIR}/volk -B ${CMAKE_CURRENT_BINARY_DIR}/volk -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -DVOLK_INSTALL=ON
  BUILD_COMMAND     ${CMAKE_COMMAND} --build ${CMAKE_CURRENT_BINARY_DIR}/volk --target install --config ${CMAKE_BUILD_TYPE}
  INSTALL_COMMAND   ""
  UPDATE_COMMAND    ""
  SOURCE_DIR        "${CMAKE_CURRENT_BINARY_DIR}/volk"
)
#################################################################
##########################Vulkan Tools###########################
ExternalProject_Add(Vulkan-Tools
  GIT_REPOSITORY    https://github.com/KhronosGroup/Vulkan-Tools.git
  GIT_TAG           ${tag_sdk}
  CONFIGURE_COMMAND ${CMAKE_COMMAND} -S ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Tools -B ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Tools -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} 
                                     -DVULKAN_HEADERS_INSTALL_DIR=${CMAKE_INSTALL_PREFIX}
                                     -DVULKAN_LOADER_INSTALL_DIR=${CMAKE_INSTALL_PREFIX}
                                     -DGLSLANG_INSTALL_DIR=${CMAKE_INSTALL_PREFIX}
                                     -DBUILD_ICD=OFF
  BUILD_COMMAND     ${CMAKE_COMMAND} --build ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Tools --target install --config ${CMAKE_BUILD_TYPE}
  INSTALL_COMMAND   ""
  UPDATE_COMMAND    ""
  SOURCE_DIR        "${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Tools"
  DEPENDS glslang Vulkan-Loader Vulkan-Headers volk
)
#########################Robin-hood-hashing#####################
#ExternalProject_Add(robin-hood-hashing
#  GIT_REPOSITORY https://github.com/martinus/robin-hood-hashing
#  GIT_TAG        master
#  SOURCE_DIR        "${CMAKE_CURRENT_BINARY_DIR}/robin-hood-hashing"
#)
#################################################################
##########################Vulkan-Utility-Libraries###############
ExternalProject_Add(Vulkan-Utility-Libraries
  GIT_REPOSITORY    https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git
  GIT_TAG           ${tag_sdk}
  CONFIGURE_COMMAND ${CMAKE_COMMAND} -S ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Utility-Libraries -B ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Utility-Libraries -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
  BUILD_COMMAND     ${CMAKE_COMMAND} --build ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Utility-Libraries --target install --config ${CMAKE_BUILD_TYPE}
  INSTALL_COMMAND   ""
  UPDATE_COMMAND    ""
  SOURCE_DIR        "${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Utility-Libraries"
)
#################################################################
##########################Vulkan ValidationLayers################
ExternalProject_Add(Vulkan-ValidationLayers
  GIT_REPOSITORY    https://github.com/KhronosGroup/Vulkan-ValidationLayers.git
  GIT_TAG           ${tag_v}
  CONFIGURE_COMMAND ${CMAKE_COMMAND} -S ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-ValidationLayers -B ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-ValidationLayers 
                    -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
                    -DVULKAN_HEADERS_INSTALL_DIR=${CMAKE_INSTALL_PREFIX}
                    -DGLSLANG_INSTALL_DIR=${CMAKE_INSTALL_PREFIX}
                    -DSPIRV_HEADERS_INSTALL_DIR=${CMAKE_INSTALL_PREFIX} 
                    -DSPIRV_TOOLS_INSTALL_DIR=${CMAKE_INSTALL_PREFIX}
                    -DUSE_ROBIN_HOOD_HASHING=false 
                    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
  BUILD_COMMAND     ${CMAKE_COMMAND} --build ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-ValidationLayers --target install --config ${CMAKE_BUILD_TYPE}
  INSTALL_COMMAND   ""
  UPDATE_COMMAND    ""
  SOURCE_DIR        "${CMAKE_CURRENT_BINARY_DIR}/Vulkan-ValidationLayers"
  DEPENDS Vulkan-Headers glslang SPIRV-Headers SPIRV-Tools Vulkan-Utility-Libraries
)
#################################################################
