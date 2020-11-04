FROM yinyang/base

RUN /opt/conda/bin/conda install -yc conda-forge cudatoolkit=11.0 \
    && /opt/conda/bin/conda clean -ya

RUN /opt/conda/bin/conda install -yc conda-forge -c nvidia cudnn=8 \
    && /opt/conda/bin/conda clean -ya

RUN /opt/conda/bin/conda install -yc pytorch pytorch=1.7 torchvision torchaudio torchtext \
    && /opt/conda/bin/conda clean -ya

RUN /opt/conda/bin/conda install -yc conda-forge \
        cython future coverage pytest-mock mock \
        ffmpeg-python youtube-dl librosa graphviz pydot libjpeg-turbo \
        seaborn plotly dask streamz dask-image scikit-learn scikit-image gdcm opencv nibabel accimage \
        munch pyarrow keyrings.alt \
        xgboost lightgbm catboost mlxtend shap lime \
        uvicorn starlette aiohttp omegaconf fire python-graphviz pydicom pycocotools \
        kornia onnx albumentations \
        wikipedia elasticsearch nltk \
    && /opt/conda/bin/conda clean -ya

RUN /opt/conda/bin/conda install -y -c conda-forge -c fastai fastai nbdev=1 fastdot \
    && /opt/conda/bin/conda clean -ya

RUN /opt/conda/bin/imageio_download_bin freeimage

RUN /opt/conda/bin/pip install --no-cache-dir \
    tf-nightly transformers \
    efficientnet-pytorch pretrainedmodels timm object-detection-fastai nlp pandarallel monai \
    onnx_coreml onnxruntime-gpu \
    knockknock distro libsixel-python

RUN /opt/conda/bin/imageio_download_bin freeimage

CMD ["bash"]
