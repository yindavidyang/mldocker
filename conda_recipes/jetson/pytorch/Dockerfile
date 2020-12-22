FROM nvcr.io/nvidia/l4t-base:r32.4.4

RUN apt-get update \
    && apt-get install -y python3-pip cmake libopenblas-dev git wget vim

RUN mkdir /pytorch \
    && cd /pytorch \
    && git clone --recurse-submodules -j8 -b v1.7.1 https://github.com/pytorch/pytorch v1.7.1 \
    && cd /pytorch/v1.7.1 \
    && git cherry-pick c86af4aa55ab3e63aba7568692b678ce662f27e2 \
    && wget https://gist.githubusercontent.com/dusty-nv/ce51796085178e1f38e3c6a1663a93a1/raw/3e7a72a4948b16a7b0f35161732675b67f960e56/pytorch-1.7-jetpack-4.4.1.patch \
    && git apply pytorch-1.7-jetpack-4.4.1.patch

RUN pip3 install cython scikit-build ninja

RUN cd /pytorch/v1.7.1 \
    && pip3 install -r requirements.txt

ENV USE_NCCL=0
ENV USE_DISTRIBUTED=0
ENV USE_QNNPACK=0
ENV USE_PYTORCH_QNNPACK=0
ENV TORCH_CUDA_ARCH_LIST="5.3;6.2;7.2"
ENV PYTORCH_BUILD_VERSION=1.7.1
ENV PYTORCH_BUILD_NUMBER=1

WORKDIR /pytorch/v1.7.1

CMD ["bash"]
