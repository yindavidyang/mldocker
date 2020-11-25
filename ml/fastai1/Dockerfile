FROM yinyang/base:10.2

RUN /opt/conda/bin/conda install -yc conda-forge -c pytorch -c fastai \
        # modeling
        xgboost lightgbm catboost mlxtend scikit-learn shap lime \
        # parallel computing
        dask streamz \
        # plotting
        seaborn plotly graphviz pydot python-graphviz kornia \
        # image processing
        dask-image scikit-image opencv accimage libjpeg-turbo \
        # medical imaging
        pydicom gdcm nibabel \
        # testing
        coverage pytest-mock mock \
        # building
        scikit-build bazel \
        # audio/video
        ffmpeg-python youtube-dl librosa pydub \
        # data format
        pycocotools pyarrow=2 h5py=2.10 \
        # serving
        uvicorn starlette aiohttp omegaconf fire onnx=1.8 \
        # deep learning
        pytorch=1.7 torchvision torchaudio torchtext fastai=1.0.61 albumentations nvidia-apex \
        # NLP
        wikipedia elasticsearch nltk \
        # misc
        future munch keyrings.alt \
    && /opt/conda/bin/conda clean -ya

RUN /opt/conda/bin/pip install --no-cache-dir \
    tensorflow-gpu tensorflow-datasets tensorflow-addons transformers \
    efficientnet-pytorch pretrainedmodels timm object-detection-fastai nlp pandarallel monai \
    libsixel-python fastai2 fastdot fastcore==1.0.0 nbdev==1.0.10 \
    onnx_coreml onnxruntime-gpu \
    knockknock distro

RUN /opt/conda/bin/imageio_download_bin freeimage
    
COPY sixel.py /opt/conda/lib/python3.7/site-packages/fastai/
RUN /opt/conda/bin/conda uninstall -y --force pillow pil jpeg libtiff libjpeg-turbo
RUN /opt/conda/bin/conda install -yc conda-forge libjpeg-turbo
RUN /opt/conda/bin/conda uninstall -y --force pillow
RUN CFLAGS="${CFLAGS} -mavx2" /opt/conda/bin/pip install --upgrade --no-cache-dir --force-reinstall --no-binary :all: --compile pillow-simd

CMD ["bash"]
