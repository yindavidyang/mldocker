FROM yinyang/jetson-conda

RUN wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate \
    https://nvidia.box.com/shared/static/yr6sjswn25z7oankw8zy1roow9cy5ur1.whl -O torch-1.6.0rc2-cp36-cp36m-linux_aarch64.whl && \
    /opt/conda/bin/pip install torch-1.6.0rc2-cp36-cp36m-linux_aarch64.whl --verbose && \
    rm torch-1.6.0rc2-cp36-cp36m-linux_aarch64.whl

COPY torchvision.zip /

RUN unzip torchvision.zip && rm torchvision.zip

COPY torchaudio.zip /

RUN unzip torchaudio.zip && rm torchaudio.zip

RUN /opt/conda/bin/conda install -yc conda-forge kornia

RUN /opt/conda/bin/conda install -yc fastai nvidia-ml-py3

RUN /opt/conda/bin/pip install --no-deps fastai fastai2

RUN /opt/conda/bin/pip install \
      fastprogress \
      efficientnet-pytorch pretrainedmodels timm \
      libsixel-python fastdot \
      knockknock

# object-detection-fastai kornia

COPY grpcio-1.30.0-cp36-cp36m-linux_aarch64.whl /

RUN wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate \
    https://nvidia.box.com/shared/static/8a3q3dz6juk0xg2e2kwwng9teosyohad.whl \
        -O tensorflow-1.15.2+nv20.6-cp36-cp36m-linux_aarch64.whl && \
    /opt/conda/bin/pip install grpcio-1.30.0-cp36-cp36m-linux_aarch64.whl \
        tensorflow-1.15.2+nv20.6-cp36-cp36m-linux_aarch64.whl && \
    rm tensorflow-1.15.2+nv20.6-cp36-cp36m-linux_aarch64.whl && \
    rm grpcio-1.30.0-cp36-cp36m-linux_aarch64.whl

COPY install_torchvision_torchaudio.sh /

CMD /bin/bash install_torchvision_torchaudio.sh && \
    /bin/bash -c "rm install_torchvision_torchaudio.sh" && \
    /bin/bash