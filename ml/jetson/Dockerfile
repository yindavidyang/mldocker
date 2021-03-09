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
        pytorch torchvision torchaudio torchtext albumentations fastai \
        # NLP
        wikipedia elasticsearch nltk \
        # misc
        future munch keyrings.alt \
        # Jetson specific
        fastprogress fastscript numba thinc imageio tensorboardx numpy=1.18 scipy=1.4.1 keras-applications qtpy bottleneck numexpr protobuf pkgconfig \
        grpcio=1.32 sentencepiece=0.1.91 imgaug spacy \
    && conda clean -ya

RUN wget --quiet --show-progress --progress=bar:force:noscroll --no-check-certificate \
        https://nvidia.box.com/shared/static/ukszbm1iklzymrt54mgxbzjfzunq7i9t.whl -O onnxruntime_gpu-1.7.0-cp36-cp36m-linux_aarch64.whl \
    && pip install --no-cache-dir onnxruntime_gpu-1.7.0-cp36-cp36m-linux_aarch64.whl  \
    && rm onnxruntime_gpu-1.7.0-cp36-cp36m-linux_aarch64.whl

RUN pip install --no-cache-dir --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v45 tensorflow

RUN pip install --no-cache-dir \
    tensorflow-datasets transformers \
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