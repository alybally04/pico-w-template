cmake_minimum_required(VERSION 3.13)

set(PICO_BOARD pico_w)
# initialize pico-sdk from submodule
# note: this must happen before project()
include(pico-sdk/pico_sdk_init.cmake)

project(hello_world)

# initialize the Raspberry Pi Pico SDK
pico_sdk_init()

add_executable(${CMAKE_PROJECT_NAME}
        main.c
)

target_link_libraries(${CMAKE_PROJECT_NAME}
        pico_stdlib
)

# Create map/bin/hex/uf2 files
pico_add_extra_outputs(${CMAKE_PROJECT_NAME})

# Enable USB serial
pico_enable_stdio_usb(${CMAKE_PROJECT_NAME} 1)
# Disable USB serial
pico_enable_stdio_uart(${CMAKE_PROJECT_NAME} 0)
