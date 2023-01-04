##########################Vulkan Headers#########################
execute_process(COMMAND ${CMAKE_COMMAND} -S ${CMAKE_CURRENT_SOURCE_DIR}/Vulkan-Headers -B ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Headers -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX})
execute_process(COMMAND ${CMAKE_COMMAND} --build ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Headers --target install)
#################################################################
##########################Vulkan Loader##########################
execute_process(COMMAND ${CMAKE_COMMAND} -S ${CMAKE_CURRENT_SOURCE_DIR}/Vulkan-Loader -B ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Loader -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -DVULKAN_HEADERS_INSTALL_DIR=${CMAKE_INSTALL_PREFIX})
execute_process(COMMAND ${CMAKE_COMMAND} --build ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Loader --target install --config ${CMAKE_BUILD_TYPE})
#################################################################
##########################Vulkan SPIRV Headers###################
execute_process(COMMAND ${CMAKE_COMMAND} -S ${CMAKE_CURRENT_SOURCE_DIR}/SPIRV-Headers -B ${CMAKE_CURRENT_BINARY_DIR}/SPIRV-Headers -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX})
execute_process(COMMAND ${CMAKE_COMMAND} --build ${CMAKE_CURRENT_BINARY_DIR}/SPIRV-Headers --target install)
#################################################################
##########################Vulkan SPIRV Tools#####################
execute_process(COMMAND ${CMAKE_COMMAND} -S ${CMAKE_CURRENT_SOURCE_DIR}/SPIRV-Tools -B ${CMAKE_CURRENT_BINARY_DIR}/SPIRV-Tools -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -DSPIRV-Headers_SOURCE_DIR=${CMAKE_INSTALL_PREFIX} -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE})
execute_process(COMMAND ${CMAKE_COMMAND} --build ${CMAKE_CURRENT_BINARY_DIR}/SPIRV-Tools --target install --config ${CMAKE_BUILD_TYPE})
#################################################################
##########################Vulkan glslang#########################
execute_process(COMMAND ${CMAKE_COMMAND} -S ${CMAKE_CURRENT_SOURCE_DIR}/glslang -B ${CMAKE_CURRENT_BINARY_DIR}/glslang -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE})
execute_process(COMMAND ${CMAKE_COMMAND} --build ${CMAKE_CURRENT_BINARY_DIR}/glslang --target install --config ${CMAKE_BUILD_TYPE})
##########################Vulkan Tools###########################
execute_process(COMMAND ${CMAKE_COMMAND} -S ${CMAKE_CURRENT_SOURCE_DIR}/Vulkan-Tools -B ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Tools -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} 
-DVULKAN_HEADERS_INSTALL_DIR=${CMAKE_INSTALL_PREFIX}
-DVULKAN_LOADER_INSTALL_DIR=${CMAKE_INSTALL_PREFIX}
-DGLSLANG_INSTALL_DIR=${CMAKE_INSTALL_PREFIX}
-DBUILD_ICD=OFF)
execute_process(COMMAND ${CMAKE_COMMAND} --build ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-Tools --target install --config ${CMAKE_BUILD_TYPE})
#################################################################
##########################Vulkan ValidationLayers################
execute_process(COMMAND ${CMAKE_COMMAND} -S ${CMAKE_CURRENT_SOURCE_DIR}/Vulkan-ValidationLayers -B ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-ValidationLayers 
-DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
-DVULKAN_HEADERS_INSTALL_DIR=${CMAKE_INSTALL_PREFIX}
-DGLSLANG_INSTALL_DIR=${CMAKE_INSTALL_PREFIX}
-DSPIRV_HEADERS_INSTALL_DIR=${CMAKE_INSTALL_PREFIX} 
-DSPIRV_TOOLS_INSTALL_DIR=${CMAKE_INSTALL_PREFIX}
-DUSE_ROBIN_HOOD_HASHING=false -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE})
execute_process(COMMAND ${CMAKE_COMMAND} --build ${CMAKE_CURRENT_BINARY_DIR}/Vulkan-ValidationLayers --target install --config ${CMAKE_BUILD_TYPE})
#################################################################
