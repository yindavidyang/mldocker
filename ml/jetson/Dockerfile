FROM yinyang/base:jetson

RUN /opt/conda/bin/conda install -yc fastai -c yinyang \
        # modeling
        lightgbm mlxtend scikit-learn shap lime \
        # parallel computing
        dask streamz \
        # plotting
        seaborn plotly graphviz pydot python-graphviz fastdot \
        # image processing
        dask-image scikit-image opencv libjpeg-turbo \
        # medical imaging
        pydicom gdcm nibabel \
        # testing
        coverage pytest-mock mock \
        # building
        scikit-build \
        # audio/video
        ffmpeg-python pydub \
        # data format
        pycocotools pyarrow=2 h5py=2.10 \
        # serving
        omegaconf fire onnx=1.8 \
        # deep learning
        torchvision torchaudio albumentations \
        # NLP
        wikipedia elasticsearch nltk \
        # misc
        future munch keyrings.alt \
        # Jetson specific
        fastprogress fastscript numba thinc imageio tensorboardx numpy=1.18 scipy=1.4.1 keras-applications qtpy bottleneck numexpr protobuf pkgconfig \
        grpcio sentencepiece=0.1.91 imgaug tokenizers=0.9.3 spacy \
    && /opt/conda/bin/conda clean -ya

# RUN /opt/conda/bin/conda install -y \
#         future coverage pytest-mock mock numba thinc \
#         ffmpeg-python graphviz pydot libjpeg-turbo mlxtend lime imageio \
#         seaborn plotly dask streamz dask-image scikit-learn scikit-image scikit-build nibabel \
#         munch pyarrow keyrings.alt \
#         omegaconf fire python-graphviz pydicom pycocotools \
#         wikipedia elasticsearch nltk pydub \
#         beautifulsoup4 tensorboardx \
#         numpy=1.18 scipy=1.4.1 h5py=2.10 keras-applications \
# 	    qtpy bottleneck numexpr protobuf pkgconfig \
#     && /opt/conda/bin/conda clean -ya

# RUN /opt/conda/bin/conda install -yc yinyang \
# 	    albumentations onnx grpcio lightgbm sentencepiece=0.1.91 shap imgaug tokenizers=0.9.3 spacy \
#         torchvision torchaudio \
#     && /opt/conda/bin/conda clean -ya

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
    tfds-nightly transformers \
    efficientnet-pytorch pretrainedmodels timm nlp pandarallel monai \
    onnx_coreml \
    knockknock distro libsixel-python \
    youtube-dl shapely librosa xgboost kornia \
    uvicorn starlette aiohttp pybind11 futures
    
RUN /opt/conda/bin/pip install --no-cache-dir --no-deps fastai

RUN /opt/conda/bin/imageio_download_bin freeimage

CMD ["bash"]
