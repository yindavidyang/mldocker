mkdir build
cd build
cmake ..
make -j $CPU_COUNT
prefix=$PREFIX make install