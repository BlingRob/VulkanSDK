# VulkanSDK

The easiest way to build Vulkan SDK from source files.
This cmake script collects Vulkan SDK and allows to development and run applications that use this API.
It's the first version and a simple method to build: in cmake scripts using forced commands to generate another libraries via execute_process.   

## How to build

```
cmake -DCMAKE_BUILD_TYPE={Release|Debug} dir_with_sources 
cmake --build .
```

If CMAKE_BUILD_TYPE wasn't setted, use Debug configuration.
All variables needed to create your application are located in build_dir/cmake/VulkanSDKConfig.cmake. 
You can apply them in your project by CMake command: 

```
find_package(VulkanSDK HINTS ../cmake/)
```
## Dependencies

Dependencies on Linux (some extra, some not enough), example on Fedora:

* libXext-devel.x86_64
* libX11-devel.x86_64
* libxcb-devel.x86_64
* libwayland-client.x86_64
* libwayland-cursor.x86_64
* libwayland-egl.x86_64
* libwayland-server.x86_64
* wayland-devel.x86_64
* egl-wayland.x86_64 
* egl-wayland-devel.x86_64
* libXrandr-devel.x86_64
* wayland-protocols-devel.noarch

You should install the drivers on your graphics card. Otherwise vulkan will try to render on the software, it may be successful, but my system was failed on 'vkAcquireNextImageKHR'.

To check the driver you can use this vulkan-tools aplication with command(this file may found in install_dir/bin): 
```
vulkaninfo --summary
```
- shows at least one a GPU device.

On linux can try it:
```
dkms status
``` - shows a GPU driver.

(For nvidia):
```
nvidia-smi
```
```
nvidia-settings
``` 
diplays drivers version and other usefull features.