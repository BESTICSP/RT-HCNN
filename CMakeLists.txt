cmake_minimum_required(VERSION 3.10)
project(MyApp CUDA)

# 设置 C++ 标准
set(CMAKE_CUDA_STANDARD 11)
set(CMAKE_CUDA_STANDARD_REQUIRED True)

# set(OpenCV_DIR  /home/ubuntu/extend/ghh/opencv-3.4.16/build)
#find_package(OpenCV REQUIRED)
#include_directories(${OpenCV_INCLUDE_DIRS})
# 添加可执行文件
add_executable(myapp src/main1.cu)

# 添加头文件搜索路径
include_directories(include)

# 链接共享库
target_link_libraries(myapp ${CMAKE_CURRENT_SOURCE_DIR}/lib/libBlindMnist.so)
target_link_libraries(myapp ${CMAKE_CURRENT_SOURCE_DIR}/lib/libimg.so)
#target_link_libraries(myapp ${OpenCV_LIBS})
# 指定 CUDA 架构类型
set_property(TARGET myapp PROPERTY CUDA_ARCHITECTURES 70)

# 设置其他 CUDA 相关选项（根据实际需求进行修改）
set(CMAKE_CUDA_FLAGS "-O3 -use_fast_math")
