git clone -b v1.7.1 https://github.com/pytorch/pytorch v1.7.1
cd v1.7.1
git submodule update --init --recursive

# apt-get install python3-pip cmake libopenblas-dev
# pip3 install cython
# pip3 install -r requirements.txt
# pip3 install scikit-build
# pip3 install ninja

# wget https://gist.githubusercontent.com/dusty-nv/ce51796085178e1f38e3c6a1663a93a1/raw/3e7a72a4948b16a7b0f35161732675b67f960e56/pytorch-1.7-jetpack-4.4.1.patch
# git apply pytorch-1.7-jetpack-4.4.1.patch

export USE_NCCL=0
export USE_DISTRIBUTED=0                # skip setting this if you want to enable OpenMPI backend
export USE_QNNPACK=0
export USE_PYTORCH_QNNPACK=0
export TORCH_CUDA_ARCH_LIST="5.3;6.2;7.2"
export PYTORCH_BUILD_VERSION=1.7.1
export PYTORCH_BUILD_NUMBER=1

export CUDNN_LIB_DIR=/usr/lib/aarch64-linux-gnu
export BUILD_CAFFE2_OPS=0
export BUILD_CAFFE2=0

# cuda10.2 requires a lower version of GCC (< 8)
conda remove sysroot_linux-aarch64
# export CC=/usr/bin/gcc
# export CXX=/usr/bin/g++

# Jetpack install cublas in a nonstandard location. The following is required when using conda's gcc.
ln -s /usr/lib/aarch64-linux-gnu/libcublas.so /opt/conda/lib/libcublas.so

python3 setup.py bdist_wheel
