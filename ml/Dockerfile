FROM yinyang/basic

RUN /opt/conda/bin/conda install -yc conda-forge tensorflow-gpu keras
RUN /opt/conda/bin/conda install -yc pytorch pytorch=1.6 torchvision torchaudio
RUN /opt/conda/bin/conda install -yc fastai fastai=1.0.61

RUN /opt/conda/bin/conda install -yc conda-forge \
    cython future coverage pytest-mock mock \
    ffmpeg-python youtube-dl librosa graphviz pydot libjpeg-turbo \
    seaborn plotly dask dask-image scikit-learn scikit-image gdcm opencv \
    munch pyarrow keyrings.alt \
    xgboost lightgbm catboost mlxtend shap lime \
    uvicorn starlette aiohttp omegaconf fire python-graphviz pydicom pycocotools \
    kornia transformers onnx \
    wikipedia elasticsearch

RUN /opt/conda/bin/pip install --no-cache-dir \
    efficientnet-pytorch pretrainedmodels timm object-detection-fastai \
    libsixel-python fastai2 fastdot nbdev nlp \
    onnx_coreml onnxruntime-gpu \
    knockknock distro

RUN /opt/conda/bin/pip install --no-cache-dir fastcore==1.0.0 nbdev==1.0.10

COPY sixel.py /opt/conda/lib/python3.7/site-packages/fastai/

RUN /opt/conda/bin/conda clean -ya

CMD ["bash"]
