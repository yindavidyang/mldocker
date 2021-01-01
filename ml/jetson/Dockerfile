FROM yinyang/base:jetson

RUN conda install -yc fastai -c yinyang \
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
        scikit-build pybind11 \
        # audio/video
        ffmpeg-python pydub \
        # data format
        pycocotools pyarrow=2 h5py=2.10 \
        # serving
        omegaconf fire onnx=1.8 \
        # deep learning
        pytorch torchvision torchaudio albumentations fastai \
        # NLP
        wikipedia elasticsearch nltk \
        # misc
        future munch keyrings.alt \
        # Jetson specific
        fastprogress fastscript numba thinc imageio tensorboardx numpy=1.18 scipy=1.4.1 keras-applications qtpy bottleneck numexpr protobuf pkgconfig \
        grpcio sentencepiece=0.1.91 imgaug spacy \
    && conda clean -ya

RUN wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate \
        https://nvidia.box.com/shared/static/6lxbakd8zaf2p5nkgcn7ih116iqm1wzm.whl -O onnxruntime_gpu-1.5.2-cp36-cp36m-linux_aarch64.whl \
    && pip install --no-cache-dir onnxruntime_gpu-1.5.2-cp36-cp36m-linux_aarch64.whl  \
    && rm onnxruntime_gpu-1.5.2-cp36-cp36m-linux_aarch64.whl

RUN wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate \
        https://developer.download.nvidia.com/compute/redist/jp/v44/tensorflow/tensorflow-2.3.0+nv20.9-cp36-cp36m-linux_aarch64.whl \
    && pip install --no-cache-dir tensorflow-2.3.0+nv20.9-cp36-cp36m-linux_aarch64.whl \
    && rm tensorflow-2.3.0+nv20.9-cp36-cp36m-linux_aarch64.whl
   
RUN pip install --no-cache-dir \
    tfds-nightly transformers \
    efficientnet-pytorch pretrainedmodels timm nlp pandarallel monai \
    onnx_coreml \
    knockknock distro libsixel-python \
    youtube-dl shapely librosa xgboost kornia \
    uvicorn starlette aiohttp futures

RUN imageio_download_bin freeimage

ENV FASTAI_HOME=/workspace/share/fastai
ENV TORCH_HOME=/workspace/share/torch
ENV KERAS_HOME=/workspace/share/keras
ENV NLTK_DATA=/workspace/share/nltk_data

CMD ["bash"]