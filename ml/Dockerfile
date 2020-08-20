FROM yinyang/basic

RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
   /bin/bash ~/miniconda.sh -b -p /opt/conda && \
   rm ~/miniconda.sh && \
   ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
   echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
   echo "conda activate base" >> ~/.bashrc

RUN /opt/conda/bin/conda install -yc conda-forge tensorflow-gpu
RUN /opt/conda/bin/conda install -yc pytorch=1.6 pytorch torchvision torchaudio
RUN /opt/conda/bin/conda install -yc fastai fastai

RUN /opt/conda/bin/conda install -yc conda-forge \
    jupyter ipyparallel jupyter_contrib_nbextensions \
    cython future coverage pytest-mock mock \
    graphviz pydot libjpeg-turbo \
    ffmpeg-python youtube-dl librosa \
    opencv tensorboardx \
    seaborn plotly dask dask-image scikit-learn scikit-image \
    munch pyarrow keyrings.alt \
    xgboost lightgbm catboost mlxtend shap lime \
    uvicorn starlette aiohttp \
    omegaconf fire python-graphviz pydicom pycocotools \
    kornia transformers

RUN /opt/conda/bin/ipcluster nbextension enable

RUN /opt/conda/bin/pip install \
    efficientnet-pytorch pretrainedmodels timm object-detection-fastai \
    gpustat \
    libsixel-python fastai2 fastdot nbdev \
    knockknock distro

COPY sixel.py /opt/conda/lib/python3.7/site-packages/fastai/

CMD ["bash"]
