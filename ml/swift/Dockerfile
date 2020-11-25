FROM yinyang/base:cuda10.2

RUN apt-get install -y \
        clang libblocksruntime-dev \
    && apt-get clean

RUN cd / \
    && wget --quiet https://storage.googleapis.com/swift-tensorflow-artifacts/releases/v0.12/rc2/swift-tensorflow-RELEASE-0.12-cuda10.2-cudnn7-ubuntu18.04.tar.gz \
    && tar xzf swift-tensorflow-RELEASE-0.12-cuda10.2-cudnn7-ubuntu18.04.tar.gz \
    && rm swift-tensorflow-RELEASE-0.12-cuda10.2-cudnn7-ubuntu18.04.tar.gz

RUN git clone https://github.com/google/swift-jupyter.git \
    && cd swift-jupyter \
    && /opt/conda/bin/python register.py --sys-prefix --swift-toolchain /

CMD ["bash"]
