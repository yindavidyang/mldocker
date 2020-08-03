FROM yinyang/conda

RUN /opt/conda/bin/conda install -y \
      cudatoolkit=10.2 cudnn

RUN /opt/conda/bin/conda install -yc pytorch pytorch torchvision torchaudio

RUN /opt/conda/bin/conda install -yc conda-forge kornia

RUN /opt/conda/bin/conda install -yc fastai fastai

RUN /opt/conda/bin/pip install \
      efficientnet-pytorch pretrainedmodels timm object-detection-fastai \
      gpustat \
      libsixel-python fastai2 fastdot transformers \
      knockknock distro

RUN /opt/conda/bin/conda uninstall -y --force pillow pil jpeg libtiff libjpeg-turbo
RUN /opt/conda/bin/conda install -yc conda-forge libjpeg-turbo
RUN /opt/conda/bin/conda uninstall -y --force pillow
RUN CFLAGS="${CFLAGS} -mavx2" /opt/conda/bin/pip install --upgrade --no-cache-dir --force-reinstall --no-binary :all: --compile pillow-simd

COPY sixel.py /opt/conda/lib/python3.7/site-packages/fastai/

CMD ["bash"]
