if(WIN32)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/WindowsInstall.cmake)
elseif(UNIX)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/LinuxInstall.cmake)
endif()

set_target_properties(${PROJECT_NAME} PROPERTIES EXPORT_NAME ${PROJECT_NAME})

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/cmake/VulkanSDKConfig.cmake.in "${CMAKE_CURRENT_BINARY_DIR}/cmake/VulkanSDKConfig.cmake")