FROM yinyang/jetson-base

# failed: catboost gdcm nvidia-apex accimage

RUN /opt/conda/bin/conda install -yc fastai fastprogress fastscript fastdot \
    && /opt/conda/bin/conda clean -ya

RUN /opt/conda/bin/conda install -y \
        cython future coverage pytest-mock mock numba thinc \
        ffmpeg-python graphviz pydot libjpeg-turbo mlxtend lime imageio \
        seaborn plotly dask streamz dask-image scikit-learn scikit-image scikit-build nibabel \
        munch pyarrow keyrings.alt \
        omegaconf fire python-graphviz pydicom pycocotools \
        wikipedia elasticsearch nltk pydub \
        beautifulsoup4 tensorboardx \
        numpy=1.18 scipy=1.4.1 h5py=2.10 keras-applications \
	    qtpy bottleneck numexpr protobuf pkgconfig \
    && /opt/conda/bin/conda clean -ya

RUN /opt/conda/bin/conda install -yc yinyang \
	    albumentations onnx grpcio lightgbm sentencepiece=0.1.91 shap imgaug tokenizers=0.9.3 spacy \
        torchvision torchaudio \
    && /opt/conda/bin/conda clean -ya

RUN wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate \
        https://nvidia.box.com/shared/static/wa34qwrwtk9njtyarwt5nvo6imenfy26.whl -O torch-1.7.0-cp36-cp36m-linux_aarch64.whl \
    && /opt/conda/bin/pip install --no-cache-dir torch-1.7.0-cp36-cp36m-linux_aarch64.whl  \
    && rm torch-1.7.0-cp36-cp36m-linux_aarch64.whl

RUN wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate \
        https://nvidia.box.com/shared/static/6lxbakd8zaf2p5nkgcn7ih116iqm1wzm.whl -O onnxruntime_gpu-1.5.2-cp36-cp36m-linux_aarch64.whl \
    && /opt/conda/bin/pip install --no-cache-dir onnxruntime_gpu-1.5.2-cp36-cp36m-linux_aarch64.whl  \
    && rm onnxruntime_gpu-1.5.2-cp36-cp36m-linux_aarch64.whl

RUN wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate \
        https://developer.download.nvidia.com/compute/redist/jp/v44/tensorflow/tensorflow-2.3.0+nv20.9-cp36-cp36m-linux_aarch64.whl \
    && /opt/conda/bin/pip install --no-cache-dir tensorflow-2.3.0+nv20.9-cp36-cp36m-linux_aarch64.whl \
    && rm tensorflow-2.3.0+nv20.9-cp36-cp36m-linux_aarch64.whl

RUN /opt/conda/bin/pip install --no-cache-dir \
    youtube-dl nbdev tfds-nightly shapely transformers librosa xgboost kornia \
    uvicorn starlette aiohttp pybind11 futures
   
RUN /opt/conda/bin/pip install --no-cache-dir --no-deps fastai

RUN /opt/conda/bin/imageio_download_bin freeimage

CMD ["bash"]