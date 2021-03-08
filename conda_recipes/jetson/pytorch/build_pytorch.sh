export USE_NCCL=0
export USE_DISTRIBUTED=0                # skip setting this if you want to enable OpenMPI backend
export USE_QNNPACK=0
export USE_PYTORCH_QNNPACK=0
export TORCH_CUDA_ARCH_LIST="5.3;6.2;7.2"
export PYTORCH_BUILD_VERSION=1.8.0
export PYTORCH_BUILD_NUMBER=0

# ln -s /usr/lib/aarch64-linux-gnu/libcublas.so /opt/conda/lib/libcublas.so
# export CUDNN_LIB_DIR=/usr/lib/aarch64-linux-gnu

python3 setup.py clean
python3 setup.py bdist_wheel
