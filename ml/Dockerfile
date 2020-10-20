FROM yinyang/base

RUN /opt/conda/bin/conda install -yc conda-forge tensorflow-gpu keras
RUN /opt/conda/bin/conda install -yc pytorch pytorch=1.6 torchvision torchaudio torchtext
RUN /opt/conda/bin/conda install -y -c conda-forge -c fastai fastai nbdev fastdot

RUN /opt/conda/bin/conda install -yc conda-forge \
    cython future coverage pytest-mock mock \
    ffmpeg-python youtube-dl librosa graphviz pydot libjpeg-turbo \
    seaborn plotly dask dask-image scikit-learn scikit-image gdcm opencv nibabel accimage \
    munch pyarrow keyrings.alt \
    xgboost lightgbm catboost mlxtend shap lime \
    uvicorn starlette aiohttp omegaconf fire python-graphviz pydicom pycocotools \
    kornia transformers onnx \
    wikipedia elasticsearch

RUN /opt/conda/bin/pip install --no-cache-dir \
    efficientnet-pytorch pretrainedmodels timm object-detection-fastai nlp pandarallel monai \
    onnx_coreml onnxruntime-gpu \
    knockknock distro libsixel-python

RUN /opt/conda/bin/conda clean -ya

CMD ["bash"]
