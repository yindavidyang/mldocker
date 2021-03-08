FROM nvcr.io/nvidia/l4t-base:r32.5.0

RUN apt-get update \
    && apt-get install -y python3-pip cmake libopenblas-dev libssl-dev git gfortran

RUN pip3 install cython scikit-build

RUN pip3 install cmake

RUN pip3 install ninja

RUN wget http://icl.utk.edu/projectsfiles/magma/downloads/magma-2.5.4.tar.gz \
    && tar xf magma-2.5.4.tar.gz \
    && cd magma-2.5.4 \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make -j8 \
    && make install

RUN mkdir /pytorch \
    && cd /pytorch \
    && git clone --recurse-submodules -j8 -b v1.8.0 https://github.com/pytorch/pytorch v1.8.0 \
    && cd /pytorch/v1.8.0 \
    && wget https://gist.githubusercontent.com/dusty-nv/ce51796085178e1f38e3c6a1663a93a1/raw/b1fb148f0ce8e28d9e6df577c9fd794892002e80/pytorch-1.8-jetpack-4.4.1.patch \
    && git apply pytorch-1.8-jetpack-4.4.1.patch \
    && pip3 install -r requirements.txt

ENV USE_NCCL=0
ENV USE_DISTRIBUTED=0
ENV USE_QNNPACK=0
ENV USE_PYTORCH_QNNPACK=0
ENV TORCH_CUDA_ARCH_LIST="5.3;6.2;7.2"
ENV PYTORCH_BUILD_VERSION=1.8.0
ENV PYTORCH_BUILD_NUMBER=0

RUN cd /pytorch/v1.8.0 \
    && python3 setup.py bdist_wheel \
    && cd dist \
    && pip3 install torch-1.8.0-cp36-cp36m-linux_aarch64.whl

WORKDIR /pytorch/v1.8.0

CMD ["bash"]
