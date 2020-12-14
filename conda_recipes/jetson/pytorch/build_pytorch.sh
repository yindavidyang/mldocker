git clone -b v1.7.1 https://github.com/pytorch/pytorch
cd pytorch
git submodule update --init --recursive
wget https://gist.githubusercontent.com/dusty-nv/ce51796085178e1f38e3c6a1663a93a1/raw/3e7a72a4948b16a7b0f35161732675b67f960e56/pytorch-1.7-jetpack-4.4.1.patch
git apply pytorch-1.7-jetpack-4.4.1.patch
export USE_NCCL=0
export USE_DISTRIBUTED=0                # skip setting this if you want to enable OpenMPI backend
export USE_QNNPACK=0
export USE_PYTORCH_QNNPACK=0
export TORCH_CUDA_ARCH_LIST="5.3;6.2;7.2"
export PYTORCH_BUILD_VERSION=1.7.1
export PYTORCH_BUILD_NUMBER=1
conda install -c yinyang magma
python3 setup.py bdist_wheel