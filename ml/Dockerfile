FROM yinyang/basic

RUN /opt/conda/bin/conda install -yc conda-forge tensorflow-gpu keras
RUN /opt/conda/bin/conda install -yc pytorch pytorch=1.6 torchvision torchaudio
RUN /opt/conda/bin/conda install -yc fastai fastai=1.0.61

RUN /opt/conda/bin/conda install -yc conda-forge \
    cython future coverage pytest-mock mock \
    graphviz pydot libjpeg-turbo \
    ffmpeg-python youtube-dl librosa \
    opencv tensorboardx \
    seaborn plotly dask dask-image scikit-learn scikit-image \
    munch pyarrow keyrings.alt \
    xgboost lightgbm catboost mlxtend shap lime \
    uvicorn starlette aiohttp omegaconf fire python-graphviz pydicom pycocotools \
    kornia transformers onnx

RUN /opt/conda/bin/pip install \
    efficientnet-pytorch pretrainedmodels timm object-detection-fastai \
    libsixel-python fastai2 fastdot nbdev nlp \
    onnx_coreml onnxruntime-gpu \
    knockknock distro

RUN /opt/conda/bin/pip install fastcore==1.0.0

COPY sixel.py /opt/conda/lib/python3.7/site-packages/fastai/

CMD ["bash"]
