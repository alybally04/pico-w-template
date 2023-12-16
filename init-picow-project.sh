#!/bin/bash
echo "----- Setup Pico Project -----"
echo -n "Enter a build directory name (leave blank to skip): "
read -r build_dir_path

echo "Getting Pico SDK"
if [ ! -d "$build_dir_path" ]
then 
    git clone https://github.com/raspberrypi/pico-sdk.git
else
    echo "Pico-SDK found"
fi
(
cd pico-sdk || ("Failed to enter pico-sdk dir" && exit)
git submodule update --init
)

if [ ! -d "$build_dir_path" ]
then
    mkdir "$build_dir_path"
    cd "$build_dir_path" || ("Failed to enter build dir" && exit)
    cmake ..
else
    echo "Build directory specified already exists"
fi
