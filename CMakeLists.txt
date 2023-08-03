cmake_minimum_required(VERSION 3.10)
project(MyApp CUDA)

set(CMAKE_CUDA_STANDARD 11)
set(CMAKE_CUDA_STANDARD_REQUIRED True)

add_executable(myapp src/main.cu)

include_directories(include)

target_link_libraries(myapp ${CMAKE_CURRENT_SOURCE_DIR}/lib/libBlindMnist.so)

set_property(TARGET myapp PROPERTY CUDA_ARCHITECTURES 70)

set(CMAKE_CUDA_FLAGS "-O3 -use_fast_math")
