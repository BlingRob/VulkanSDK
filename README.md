# VulkanSDK

The easiest way to build Vulkan SDK from source files.
This cmake script collects Vulkan SDK and allows to development and run applications that use this API.
The foundation of this script is `ExternalProject` module and building with command `ExternalProject_Add`. 

## How to build

```
cmake -DCMAKE_BUILD_TYPE={Release|Debug} dir_with_sources -DSDK_VERSION=x.x.xxx
cmake --build .
```

If CMAKE_BUILD_TYPE wasn't set, use Debug configuration. 
SDK_VERSION is numeric version, if wasn't set, then using last stable version.

## How to use
All variables needed to create your application are located in build_dir/cmake/VulkanSDKConfig.cmake. 
You can apply them in your project by CMake command: 

```
find_package(VulkanSDK HINTS build_dir/cmake/)
```

VulkanSDKConfig.cmake file contains variables: 
- VULKAN_LIBS - static vulkan files;
- VULKAN_SHARED_LIBS - shared vulkan files;
- VULKAN_SHARED_LIB - vulkan loader shared library;
- VULKAN_SDK_INCLUDE_DIR - headers files;
- VULKAN_SDK_BINARY_DIR - binaries files.

Two environment variables are also set: 
* VK_LAYER_PATH - directory with json files;
* VK_LOADER_DEBUG - include layers (all). 

## Dependencies

Utils:
* git
* CMake - 3.17.2

Dependencies on Linux (some extra, some not enough), example on Fedora:

* libXext-devel.x86_64
* libX11-devel.x86_64
* libxcb-devel.x86_64
* wayland-devel.x86_64
* egl-wayland-devel.x86_64
* libXrandr-devel.x86_64
* wayland-protocols-devel.noarch

You should install the drivers on your graphics card. Otherwise vulkan will try to render on the software, it may be successful, but my system was failed on 'vkAcquireNextImageKHR'.

To check the driver you can use this vulkan-tools aplication with command(this file may found in install_dir/bin):

```
vulkaninfo --summary
```
shows at least one a GPU device.

On linux can try it:
```
dkms status
```
 shows a GPU driver.

(For nvidia):

```
nvidia-smi
```

```
nvidia-settings
``` 

diplays drivers version and other usefull features.